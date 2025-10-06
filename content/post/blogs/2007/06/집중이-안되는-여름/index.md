---
title: 집중이 안되는 여름
author: babyworm
type: post
date: 2007-06-19T12:22:05+00:00
url: /archives/286
categories:
  - verification
tags:
  - PLI
  - Teal
  - truss
  - Verification
  - VPI
  - 여름

---
연일 30도를 넘나드는 더위가 계속되고 있습니다. 

  


이럴때 항상 문제가 되는 것이 집중력이 떨어진다는 건데요.. 저도 마찬가지 입니다.  
(실은 개인적으로 좋은 일이 생겨서 그럴지도 모르겠습니다만 ^^;)

  


오늘만해도 gcc-MinGW에서 mti vpi 연결시키는 거 때문에 잠깐 modelsim userguide를 보다가, 딴짓을 하기 시작해서 대략한 5시간동안 딴짓을 했습니다. 

  


뭐 딴짓이라고 해도 모레쯤이나 하려던 processor market forecasting자료 정리였는데, 어짜다보니 하고 있더군요. 이건 뭐, 원래 하려던 일은 까맣게 잊고 나중에 하려던 일을 한참하다가 &#8220;아.. 내가 오늘 하려던 일은 이게 아닌데.. &#8221; 뭐 이런 시나리오라고나 할까요.

  


VPI 이야기가 나와서 그러는데요.. (또또.. 옆길로 빠집니다요) 회사 툴이 System Verilog-verification feature를 지원해주지 않아서, C/PLI나 만들어야 겠다는 이야기를 했었죠? 요즘 teal library를 분석하고 있는 중인데, 이거야 원.. 보면서 몇 번을 감탄한 것인지 모르겠습니다. 

  


사실 뭐 PLI 연결하는 것이야 별 차이있겠습니까? 뭐 thread를 사용하는 것도 그렇다치구요.. 근데, PLI 연결 부분을 teal_synch.cpp라는 몰아두고, 이걸 class로 덮어씌우고 연산자 오버로딩을 해버리니 예술적인 경지에 이르르더군요. 사용하는 사람 입장에서는 이 부분이 verilog랑 붙기 때문에 어쩌구 저쩌구 생각할 필요가 거의 없도록 만들어졌더군요. 

  


아쉽게도 저는 유연성 보다는 빠른 동작을 즐기기 때문에 teal을 그대로 이용하지는 않겠지만, (처음에는) 재미삼아 분석해 본 라이브러리인데 아주 많은 걸 배웠습니다. 천재성이 담긴 코드에요.. 저에겐 &#8216;이 정도쯤은 해야 verification engineer가 되는 건가.. 에효..&#8217; 라는 상념에 빠지게 하더군요.. 

  


C++에 익숙하시고, PLI를 공부중인 분들은 상당히 도움을 받으실 수 있을 것 같습니다. 혹시라도 관심있으신분은 <A title=http://www.trusster.com/ href="http://www.trusster.com/">http://www.trusster.com/</A>&nbsp;에서 다운 받아보실 수 있습니다. 이거 관련된 책도 있는데, 아직은 저도 본 상태가 아니라 뭐라 말씀드리기는 어렵습니다. (TRUSS도 아직 사용해보지 못했습니만, Teal만으로도 괜찮습니다 ^^;)

  


아.. 그러고보니 관련 기사도 있었군요.. [EETimes Korea의 기사][1]입니다. 

&#8212;  
위의 부분까지는 MS Writer에서 썼는데, 평소처럼 publish하려니 좀 허전하네요.. ^^;

혹시라도 PC환경에서 cygwin/modelsim하에서 사용하시는 분들을 위하여 몇 가지만

1) Makefile.Windows를 만듭니다. 이 파일은 Makefile.linux를 복사하시는 것이 편합니다.  
2) 아래와 같이 고칩니다. (필요에 따라 더 고치셔도 됩니다.)  


  


<DIV style="BORDER-RIGHT: #90e0ff 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #90e0ff 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #90e0ff 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #90e0ff 1px dotted; BACKGROUND-COLOR: #d2f2ff">
  <FONT face="'courier new',courier,monospace">ARCH_LIB_OPT = -L/cygdrive/c/Modeltech_6.0/win32 -lmtipli<br />ARCH_SHARED_SUFFIX = dll <br />SYS_ARCH_CC = g++<br /></FONT>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
</DIV>

  


3) Makefile을 수정합니다. 



  


<DIV style="BORDER-RIGHT: #90e0ff 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #90e0ff 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #90e0ff 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #90e0ff 1px dotted; BACKGROUND-COLOR: #d2f2ff">
  <FONT face="'courier new',courier,monospace">SIMULATOR_HOME = /cygdrive/c/Modeltech_6.0<br />ARCH &nbsp;&nbsp; = Windows<br />SIM &nbsp; &nbsp; = mti_2_0<br /></FONT><br />
</DIV>

  


  
대략적인 힌트만 드렸습니다만, 이 정도면 필요한 부분을 추가적으로 수정하셔서 verification_top()함수를 작성하신 다음에 linking하시는데 문제 없을듯 합니다.

 [1]: http://www.eetkorea.com/ART_8800437633_480103_NT_609ccedf.HTM