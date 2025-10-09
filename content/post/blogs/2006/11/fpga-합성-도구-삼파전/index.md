---
title: 'FPGA 합성 도구..  삼파전?'
author: babyworm
type: post
date: 2006-11-13T09:55:10+00:00
categories:
  - CAD tools
tags:
  - Altera
  - DC-FPGA
  - FPGA
  - Precision
  - Synplify
  - Synthesis
  - xilinx

---
{{< wikipedia "FPGA" >}}의 사용이 늘어나면서 이쪽 합성 분야에 눈독을 들이는 회사들이 늘어나고 있군요..

사실 FPGA 설계/합성 도구는 무료로 제공되는 경우가 많아서.. ({{< wikipedia "xilinx" >}} <A href="http://www.xilinx.com/ise/logic\_design\_prod/webpack.htm" target=_blank>webpack</A>이나 {{< wikipedia "altera" >}}의 <A href="https://www.altera.com/support/software/download/altera\_design/quartus\_we/dnl-quartus\_we.jsp" target=\_blank>quartus II web version</A>과 같이 말입니다.)비교적 돈이 덜 됩니다만.. 무료로 제공되는 설계도구가 비교적 약한 편이라, 다른 툴을 많이 찾아다니게 되지요..

게다가 많은 FPGA 업체들이 simulation과 logic 합성 자체는 3rd party툴에 도움을 받고, P&R쪽만 in-house 툴을 사용하는 방향으로 나아가고 있는데.. 각 회사의 입장에서는 아주 합리적인 선택입니다. 

Simulation에서는 가장 많이 번들링 되고 있는 것이 아무래도 {{< wikipedia "Mentor" >}}의 {{< wikipedia "Modelsim" >}}이지요. (사실 modeltech의 것이지만..)<br>
국내에서 학생 유저들이 가장 많이 사용하는 시뮬레이터일텐데요.. 윈도우 환경에서 안정적인데다, verilog/VHDL/SystemC까지 가리지 않고 컴파일해서 single kernel로 시뮬레이션하는 능력을 지닌 좋은 시뮬레이터 입니다. 산업체에서는 아직 Golden simulator로 받아들여지는 NCsim에 밀리지만, 많은 엔지니어가 사용하고 있는 좋은 시뮬레이터입니다. (이 이야기는 주관적인 내용이 아니고 ESNUG 설문 결과인데 modelsim은 폭 넓은 사용자에 비해서 golden simulator라기 보다, secondary simulator느낌으로 사용되고 있습니다.)

FPGA 합성툴로는 우선 xilinx나 altera의 자체 툴이 있겠지요.

사실 저는 altrea툴을 max-plusII 시절에 많이 사용하고, quartus는 초기 버젼만 잠시 다루어봐서 평가하기 어렵습니다만.. 좋은 인상은 받기 어려웠습니다.<br>
Xilinx의 XST도 역시 뭐 그리 잘 만들어진다 볼 순 없겠습니다. 물론, 예전에 비하면 아주 좋아졌습니다만 말입니다.

오늘 제목에 FPGA 합성도구 삼파전이라는 약간 “찌라시틱”한 제목은 사실 FPGA 제조사의 툴은 제외하고 3rd party의 FPGA합성도구 3가지를 보려고 합니다. 

첫번째로 FPGA 합성 시장에서 가장 많이 사용되고 있는 <A href="http://www.synplicity.com/" target=_blank>synplicity</A>의 synplify가 있습니다. 얼마전에 보니 국내 지사도 생겼더군요.. SCOPE라는 손쉬운 constraint editor도 있고, 그림도 이쁘게 보여주더군요..<br>
가장 좋은 점은 합성 결과가 만족스럽다는 점입니다. 특히, DSP function을 지정하는 경우 이것을 각사의 macrocell로 변환을 아주 잘하는 편입니다.<br>
최근에 synplicity가 synplify의 힘을 믿고 synplifyAISC을 발표해보았습니다만.. 합성시에 오류가 몇개 발견되고 있다네요…아직은 ASIC진입은 좀 이르지만, 시간이 지나면 어찌 될지 모르겠습니다. 

약간 민감하긴한데.. 현재로서는 FPGA합성 부분에 있어서는 가장 좋은 방법이 아닐까 생각합니다. 

<TABLE cellSpacing=0 cellPadding=2 width=400 align=center border=0><br>
  
</TABLE>

<DIV style="TEXT-ALIGN: center">
  [image source: synplify homepage]
</DIV>

두번째는 합성 시장의 절대 강자.. synopsys의 DC-FPGA입니다.<br>
사실 synopsys는 예전에 FPGA-Express라는 툴을 갖추고 있었고 Xilinx에 번들로 제공했던 적도 있었습니다. 하지만, 명성에는 조금 못 미치는 툴이였는데, 이를 자사의 flagship tool인 Design Compiler에 접목하려는 노력을 하더니만(ASIC to FPGA migration guide가 있었지요..), 결국 DC-FPGA라는 이름으로 나왔지요.<br>
DC에 익숙한 엔지니어가 워낙 많아서 이것도 비교적 많이 사용되고 있다고는 합니다만, 새로운 디바이스에 대한 지원이 좀 느린것이 단점이랄까요.. 요즘에는 약간 시들한 느낌입니다.<br>
하지만, 워낙에 ASIC flow상에서 강하니까, script상에 별 변경없이 FPGA를 만들수 있다는 건 큰 장점이겠지요.<br>

<DIV style="TEXT-ALIGN: center">
  <IMG alt=Compiler hspace=0 src="https://i0.wp.com/www.synopsys.com/news/pubs/compiler/images/art3_dcfpga-fig1.jpg?w=625" border=0 data-recalc-dims="1"><br />[image source: <A href="http://www.synopsys.com/news/pubs/compiler/art2_dcfpga-may04.html?NLC-insight&Link=May04_Issue_Art2">http://www.synopsys.com/news/pubs/compiler/art2_dcfpga-may04.html?NLC-insight&Link=May04_Issue_Art2</A>]
</DIV>

세번째는 이글을 쓰게된 직접적인 계기인 mentor의 <A href="http://www.mentor.com/products/fpga\_pld/synthesis/" target=\_blank>precision</A>이라는 합성도구 입니다.<br>
사실 precision은 예전에 mentor의 FPGA advantage를 evaluation해보면서 처음 접해봤었는데.. Le사실 사라진줄 알았습니다. ^^;<br>
그런데, <A href="http://www.edadesignline.com/193700445?cid=RSSfeed\_EDAdesignline\_edadlALL" target=_blank>EETimes의 기사</A>를 보니 아직도 건재하고, 많은 기능이 추가된 것 같습니다. DesignWare의 지원이나 Clock Gating지원, DSP/Memory macrocell inference기능들을 지원한다는 것으로 보아 상당한 수준으로 올라왔군요..

<DIV style="TEXT-ALIGN: center">
  <IMG id=||CPIMAGE:626305| height=326 alt="Precision Physical" hspace=0 src="https://i0.wp.com/www.mentor.com/products/fpga_pld/synthesis/precision_synthesis/images/physical_image1.jpg?resize=428%2C326" width=428 border=0 data-recalc-dims="1"><br />[image source: mentor homepage]
</DIV>

ASIC logic합성쪽은 DesignComiler가 압도적인 우위를 점하고 있는 가운데.. BuildGates, Synplify ASIC같은 것들이 도전하는 형국이고..

FPGA 합성쪽은 Synplify가 가장 우위를 점하고 있지만, DC-FPGA, Precision의 추격도 가속화되고 있는 느낌입니다. 

뭐.. 사용자야 즐겁지요..^^;
