---
title: Asynchronous는 어려워
author: babyworm
type: post
date: 2008-10-22T08:28:36+00:00
url: /archives/1292
categories:
  - 개인적인
tags:
  - Dalvik VM
  - EISC
  - gals
  - IDEC
  - Open Source
  - 마이크로 프로세서

---
요즘 MPSoC쪽 버스 문제 때문에 GALS(Globally asynchronous Locally synchronous)를 다시 들여다보고 있는데, circuit design을 배제하고 verilog netlist 수준에서 기존의 합성 툴을 이용할 수 있도록 생각하다 보니 자꾸만 생각이 제한됩니다. 조막만한 아이디어가 있긴 한데, 이게 구현 가능한 것인지 생각해 보는 것 자체가 고역인걸 보니 그간 머리를 안 돌리긴 안 돌렸나봐요.  
GALS중에 Pausible clock control에서 아이디어를 가지고 오되, 귀찮은 부분은 던져 버려서 latency를 줄이는 것에 주안점을 두고 있는데.. 흠 쉽지 않네요.. 

  
  


요즘 회사에서 superscalar microprocessor/SMT 쪽 강좌(?) 세미나(?) 뭐 이런걸 진행하고 있습니다. 컴퓨터 아키텍쳐란 과목에만 한정되는 이야기는 아닙니다만, 이런 종류의 과목이 비교적 편한 과목이지요. (동의하지 않을 분들도 많을 것이지만. ^^;)  
물론, 이런 저런 복잡한 배경과 논리들이 얽혀 들어가지만, 신이 만든 것을 연구하는 생물학이나 화학, 물리학에 비하면 컴퓨터 아키텍쳐 같은 것은 예전 사람들이 만들어놓은 걸 논리적으로 풀어가서 발전시키는 형태의 학문이기 때문에 일종의 퀴즈와 같다는 느낌을 많이 받습니다. (안사람이 분자 생물학쪽을 전공하고 있는데, 이야기 듣다보면 정신이 멍~ 해지지요..) 감탄. 또 감탄! 세상엔 똑똑한 사람이 끝도 없이 있단 말이죠. 젠장.. 

  
  


Android의 [Dalvik VM][1][[참고자료][2]]이 공개되었습니다. (원래 되어 있던 건가요? 소스공개는 오늘 되었다네요.. 여하튼). 특징적인건 이 VM에서 사용하는 bytecode가 java와는 동떨어진 형태네요. register 기반의 bytecode니까 말이죠. 아주 좋아요. ^^; 단, 호환성 문제는 어쩔라고 그러는지(살펴보니 .class는 .dex로 바꿔야 한다네요.).. JavaME에서의 Sun license를 피하기 위한 방법이라는데, register 기반이기 때문에 전반적인 성능은 java보다 좋을 확률이 좀 있군요. 

  
  


SIMD/Vector machine에 관심이 없던 건 아닌데, 좀 의외에 상황에서 건드려야 하는 상황이 발생했습니다. 인력의 문제로 사실 할까 말까를 한 2달 동안 고민했는데, 그냥 고민하고 앉아있는 시간이면 요상한 형태의 SIMD machine은 벌써 하나 만들었겠다라는 생각이 들었어요. 이것 저것 처한 상황 때문에 빠르게 진행될 가능성은 없지만, 간단하게 하나 만들어 봐야겠습니다. 대충 틀만 잡고 누구한테 떠넘겨 버릴지도. ㅋㅋ 

  
  


회사차원에서 open source진영에 대한 지원을 고려하여, EISC 프로세서 관련 사이트 하나를 개설할까 개인적으로 생각중입니다. EISC processor/system시뮬레이터는 그냥 open source로 공개할 생각이고요. 예전에 작업된 이런 저런 시뮬레이터나 환경, 벤치마크 등도 같이 open해 버릴까.. 하는 생각입니다. 감추어두고 죽느니, 열어두고 살리는 것이 좋겠지요. IDEC과 공동으로 작업하는 MPW 지원 프로그램도 거의 정식 release 직전이고.. 이런 저런 &#8220;잡일&#8221;로 바쁘네요.

 [1]: http://en.wikipedia.org/wiki/Dalvik_virtual_machine
 [2]: http://www.dalvikvm.com/