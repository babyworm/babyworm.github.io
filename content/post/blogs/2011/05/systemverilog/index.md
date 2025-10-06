---
title: SystemVerilog
author: babyworm
type: post
date: 2011-05-18T15:02:02+00:00
url: /archives/1555
categories:
  - verification

---
IT-SoC 센터에서 SystemVerilog Verification을 한다기에 들어왔습니다.&nbsp;  
몇년째 책을 보고 예제 몇 개 끄적이다가 잊고.. DPI오~ 예제 몇 개 끄적여보다 잊고.. OVM사용해보고.. 예제 몇 개 끄적여보다 잊고.. UVM 오~~ 예제 몇 개 끄적여보다 잊고를 반복하고 있어서, 이번에는 제대로 듣고 업무에 적용을 해 봐야겠다는 생각이 있습니다.&nbsp;

근데.. 초반 2일이 SystemVerilog for Design section이네요..  
음.. 음.. 내일 부터가 기대됩니다. 2일동안 verification을 얼마나 깊이 다룰지 걱정이 쪼금(이라고 쓰고, &#8216;많이&#8217;라고 읽는..)됩니다.&nbsp;

예전부터 (개인적으로) 주장하던 것인데..  
SystemVerilog가 Design Language의 대세가 될 것이냐.. 에는 약간 회의가 있습니다. (물론, 강사님 말로는 많이들 사용한다고 하시더군요..)  
일단 SystemVerilog의 문법을 제대로 처리하는 tool과 못하는 tool이 혼재해 있는 상태에 적어도 IP단계에서는 systemverilog를 도입하는 것이 거의 어렵다고 봐야겠죠. (물론 SystemVerilog도 Synthesizable Subset이 정의되어 있지만&#8230; 음 Verilog 2001 문법도 아주 많이 제한해서 사용하는 판국에..)

그럼 Verification에서는.. 이라는 질문에는 아주 긍정적으로 봅니다. (사실 제가 긍정할 필요도 없을 정도로 대세죠.. 희안하게도 국내에서는 좀 적게 사용하는 경향이 있지만)

OVM이나 UVM(사실 UVM은 paper를 본 것이 다라서 뭐라 이야기하기 어렵고.) 같은 것이 SystemVerilog를 기반으로 하고 있어서 뭐 별 일 없이 그냥 표준이 되어가고 있어요..

p.s.  
이거 왜 공개되었다가 없어졌나했더니.. SCV관련된 이야기했다가 확인을 못해서 비공개처리하고 잊었었나 보군요.. 일단 지우고..공개

p.s.2.  
음.. 별 기대없이 들었는데..&nbsp;<http://verificationacademy.com/course-modules/uvm-ovm-verification/basic-uvm-universal-verification-methodology>&nbsp;VA에서 하는 UVM basics 꽤 쓸만하네요.. 이제 목표는 적용해보는것..

<div id="__KO_DIC_LAYER__" style="padding-top: 0px; padding-right: 0px; padding-bottom: 0px; padding-left: 0px; position: fixed; z-index: 999999999; overflow-x: hidden; overflow-y: hidden; border-top-width: 2px; border-right-width: 2px; border-bottom-width: 2px; border-left-width: 2px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(51, 51, 119); border-right-color: rgb(51, 51, 119); border-bottom-color: rgb(51, 51, 119); border-left-color: rgb(51, 51, 119); display: none; ">
</div>