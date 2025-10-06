---
title: PLI와 Simulator의 연결(I)
author: babyworm
type: post
date: 2007-06-11T14:45:03+00:00
url: /archives/284
categories:
  - verification
tags:
  - EISC
  - PLI
  - simulator
  - Verification
  - verilog HDL

---
Automated Functional Verification 방법에는 여러 가지가 있지만, testvector 발생 유닛(보통 Directed Random방식을 사용하지요?)과 golden model을 이용한 checker model을 만들어서 DUV(Design Under Verification)의 결과와 비교하는 것이 가장 편한 방법 중에 하나임은 부정할 수 없습니다. (여담입니다만, 국내에서는 많은 경우 golden model없이 설계하는 경우가 많아서 검증을 위하여 작성한 golden model이 실제로 RTL보다도 정확성이 떨어지는 경우가 있다는 것이 문제가 종종 발생합니다. 여기서는 golden모델의 확보에 대한 이야기는 나중으로 미루죠.)보통 golden model은 C model을 이용하게 되는데, C 모델을 Verilog와 동시에 simulation하는 것은 그리 녹녹한 일이 아닙니다. 

  


저는 프로세서를 대부분 다루기 때문에 C모델이라 함이 대부분 ISS simulator가 됩니다. 이후에 Simulator와 C모델은 그냥 섞어 쓸 가능성이 높은데, 보시는 분께서 편하신 대로 생각하시면 되겠습니다. 

  


우선 Simulator를 만들 때 그 목적을 정확히 할 필요가 있습니다. 초기에 Simulator의 목적은 executable spec.의 의미가 가장 중요한 의미였을 것입니다. 그래서, 대부분 function level의 정확성을 가지지요. 프로세서의 경우 보통 이야기하는 ISS(Instruction Set Simulator)정도의 수준일 것입니다. 

  


이때 고려하는 사항은 동작의 정확성, 빠른 동작 속도, 유연한 변경 가능성(design space exploration을 해야 하니까요)과 같은 것을 고려하게 됩니다. 

  


그런데, 아시다시피 Verilog와 Simulation을 한다던지, Verilog Model대신 사용하려고 할 경우에는 ISS level뿐만 아니라, BFM 수준, 간혹은 Pin-level accuracy를 필요하게 됩니다. 통신이나 영상쪽의 모델은 뭐 Functional model이나 BFM이나 큰 어려움이 없습니다. Latency가 거의 정의되어 있기 때문이지요. 

  


프로세서의 경우 약간 복잡해지는데, hazard의 발생, instruction issue rate의 변화, exception의 발생을 고려해야 하는데, 이 경우 bus function이 발생하는 Instruction Fetch와 Data Access stage의 동작을 모사하기 위해서는 대부분의 pipeline을 표현해내야 합니다. 예전에 pipeline 수준의 accuracy를 가지는 simulator를 만들고, pin-level interface를 붙여서 나름대로 쓸만한 PLI model을 만든 적이 있지요. 단지 문제는 pipeline수준의 accuracy를 가지다 보니, 너무 너무 느려져 버린거지요. 

  


쉽게 쉽게 만들려면 functional model로 simulator를 만들고, Verilog Model(DUV)상에 하나의 명령이 retire되는 순간에 register들의 값을 비교하는 방법도 가능합니다. 하지만, 해당 model이 불필요한 hazard 발생은 없는지, Instruction Fetching에 불필요한 사항이 추가되지는 않았는지 확인 할 수는 없습니다. (당연하죠.. reference model이 functional model이니 timing spec.을 만족시켰는지는 알수 없는것이지요) 

  


흠.. 많이 옆으로 샜는데요.. 

  


C Model과 Verilog와 붙이는 방법이 Verilog-PLI (Programming Language Interface)를 이용하는 겁니다. Simulator는 clock단위로 동작하므로, 느낌상 아래와 같이 동작시키면 될 것 같습니다. 이런 경우에 verilog에서 C function을 호출할 때 가장 많이 사용되는 건 calltf()를 이용하는 방법입니다. 

  


<DIV style="BORDER-RIGHT: #e38fbc 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #e38fbc 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #e38fbc 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #e38fbc 1px dotted; BACKGROUND-COLOR: #ffe4f4">
  <br /> 
  
  <P>
    <FONT face="'courier new',courier,monospace">always @(posedge clk or negedge rst_x) begin </FONT>
  </P>
  
  <br /> 
  
  <P>
    <FONT face="'courier new',courier,monospace">&nbsp; $run_sim_calltf(xxxx); </FONT>
  </P>
  
  <br /> 
  
  <P>
    <FONT face="'courier new',courier,monospace">end </FONT>
  </P>
</DIV>

  


즉, run_sim()을 calltf()의 callback function으로 등록하는 겁니다. 그리고, 매 클럭 calltf()를 불러주는 것이지요. 

  


근데, simualtor의 이전 상태를 계속적으로 보존해야 하는 경우에는 매 클럭 새롭게 호출되는 calltf()를 이용할 때 문제가 있을 수 있습니다. (사실 그리 어려운 일은 아닙니다만, 예를 들기 위하여 ^^ ) 그래서, 내용을 보존하고 싶을 때는 misctf()를 사용하는 것도 괜찮습니다. misctf()는 원래 verilog simulation의 이런 저런 정리 작업을 하는데 사용하는 목적으로 만드는 건데요. 아래와 같이도 사용할 수 있습니다. 

  


<DIV style="BORDER-RIGHT: #e38fbc 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #e38fbc 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #e38fbc 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #e38fbc 1px dotted; BACKGROUND-COLOR: #ffe4f4">
  <br /> 
  
  <P style="MARGIN-LEFT: 11pt">
    <FONT face="'courier new',courier,monospace">initial begin </FONT>
  </P>
  
  <br /> 
  
  <P style="MARGIN-LEFT: 11pt">
    <FONT face="'courier new',courier,monospace">&nbsp; $run_sim_misctf(data, reason, paramvc); </FONT>
  </P>
  
  <br /> 
  
  <P style="MARGIN-LEFT: 11pt">
    <FONT face="'courier new',courier,monospace">end </FONT>
  </P>
</DIV>

  


뭐 이런 느낌입니다. misctf()의 경우 시뮬레이터의 초기 시에 simulator에 연결된 이후에 simulator의 종료 시까지 계속 머무르면서 파라미터의 값이 변경 될 때 마다 제어권을 가집니다. 이 파라미터의 변화시마다 클럭이 변화되었는지 확인하고, 클럭이 변화하였을 때 값을 호출하면 되겠습니다. 

  


아래는 한 4년 전에 만든 PLI 모델중의 misctf부분인데요.. 실제 구현은 없으니 공개해도 별 문제 없을 것입니다. ^^; 대략 이런 느낌으로 만드시면 됩니다. 🙂  
다음 번에는 좀 더 재미난 PLI 함수를 다루어보죠.. (아.. VPI는 초반에 좀 다루지 않네요. ^^; Blog의 예제를 위해서라도 예전에 acc\_와 tf\_를 이용해서 만든 PLI 모델을 업그레이드해야겠군요. ) 

  


<DIV style="BORDER-RIGHT: #90e0ff 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #90e0ff 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #90e0ff 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #90e0ff 1px dotted; BACKGROUND-COLOR: #d2f2ff">
  <br /><FONT face="'courier new',courier,monospace">int misctf_proc(int data, int reason,int paramvc) {<br />&nbsp;<br />&nbsp;static int &nbsp;reset_called = FALSE;<br />&nbsp;int &nbsp; POInt;<br />&nbsp;<br />&nbsp;<br />&nbsp;<br />&nbsp;switch (reason) {<br />&nbsp; case reason_paramvc : { // 파라미터의 값 변화로 인한 호출의 경우 <br />&nbsp; &nbsp;if (tf_getp(PIN_RST_X) == 0) { // reset state<br />&nbsp; &nbsp; // 아래의 형태는 초기 조건에서의 리셋 호출을 위하여 사용된다. <br />&nbsp; &nbsp; if (reset_called == FALSE || paramvc == PIN_RST_X) {<br />&nbsp; &nbsp; &nbsp;io_printf(&#8220;$AE32KB_RUN : CORE RESET CONDITION\n&#8221;);<br />&nbsp; &nbsp; &nbsp;// 실제적인 reset을 수행한다. <br />&nbsp; &nbsp; &nbsp;<br />&nbsp; &nbsp; &nbsp;reset_called = TRUE;<br />&nbsp; &nbsp; &nbsp;<br />&nbsp; &nbsp; &nbsp;POInt = 0;<br />&nbsp; &nbsp; &nbsp;<br />&nbsp; &nbsp; &nbsp;if (tf_getp(PIN_OSIEN) == 1) {<br />&nbsp; &nbsp; &nbsp; POInt = POInt | OSIEN;<br />&nbsp; &nbsp; &nbsp; if (tf_getp(PIN_OSIROM) == 1) {<br />&nbsp; &nbsp; &nbsp; &nbsp;POInt = POInt | OSIROM;<br />&nbsp; &nbsp; &nbsp; }<br />&nbsp; &nbsp; &nbsp;}<br />&nbsp; &nbsp; &nbsp;ResetCore(POInt);<br />&nbsp; &nbsp; }<br />&nbsp; &nbsp;} <br />&nbsp; &nbsp;else if ( paramvc == PIN_CLK ) { &nbsp;<br />&nbsp; &nbsp; if (is_posedge(PIN_CLK,paramvc) == TRUE) {<br />&nbsp; &nbsp; &nbsp;// 변경된 모든 입력 값을 받아서 반영한다.&nbsp; <br />&nbsp; &nbsp; &nbsp;apply_input();<br />&nbsp; &nbsp; &nbsp;io_printf(&#8220;%s : CLOCK POSEDGE\n&#8221;, tf_strgettime());<br />&nbsp; &nbsp; &nbsp;<br />&nbsp; &nbsp; &nbsp;EndClock();<br />&nbsp; &nbsp; &nbsp;// end_clock함수<br />&nbsp; &nbsp; &nbsp;<br />&nbsp; &nbsp; &nbsp;StartClock(); <br />&nbsp; &nbsp; &nbsp;// start clock 함수<br />&nbsp; &nbsp; &nbsp;<br />&nbsp; &nbsp; &nbsp;// 변경된 데이터를 기반으로 핀과 레지스터를 변경시킨다. <br />&nbsp; &nbsp; }<br />&nbsp; &nbsp;}<br />&nbsp; &nbsp;break;<br />&nbsp; }<br />// &nbsp;case <br />&nbsp; default : <br />&nbsp; break;<br />&nbsp;}<br />&nbsp;<br />&nbsp;// apply outputs<br />&nbsp;apply_output();<br />&nbsp; &nbsp; return 0;<br />}<br /></FONT><br />
</DIV>

  
이제 EISC processor도 어느 정도 정비를 마치고, 빠른 미래에&nbsp; 좀 더 공격적인 마케팅을 시작할 예정입니다. ^^; 많이 기대를 해 주세요.. 특히 학생분들께 좋은 기회가 많이 돌아가도록 노력 중입니다.