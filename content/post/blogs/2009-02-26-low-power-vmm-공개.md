---
title: Low Power VMM 공개
author: babyworm
type: post
date: 2009-02-26T06:55:37+00:00
url: /archives/1370
categories:
  - 'News on SoC &amp; IP design'
tags:
  - e
  - LPVMM
  - OPP
  - OVM
  - SystemC
  - Verification
  - VMM
  - 저전력 설계

---
가끔 올리는 짧은 소식 몇 가지. 

1. 

Synopsys에서 Low Power Verification Methodology Manual을 공개하였습니다  
Solvnet ID가 있으시다면 누구라도 여기(<http://www.vmmcentral.org/vmmlp>)에서 다운 받으실 수 있습니다. 

저는 다운만 받고 아직 훓어보지도 못해서 no comment입니다. ^^; 

 

2. 

Mentor가 OVM을 기반으로 VMM code를 지원하겠다고 발표했습니다. (실질적으로는 VMM의 function을 OVM 함수를 이용하여 구현한 것이겠습니다)  
VMM을 기반으로 작업했던 사람을 OVM으로 끌고 오겠다는 셈이겠지요. ([http://www.mentor.com/products/fv/methodologies/\_3b715c/cb\_rf.cfm][1] 에서 Verification Cookbook을 다운받으실 수 있습니다.) 

아래 posting에 댓글 달아주신 홍용재님의 글처럼, OVM은 e, SystemC로 지원할 계획을 가지고 있습니다. 대부분의 interface 함수를 공유하게 될 것이니, 기존의 작업은 그대로 둘 수 있고, e, SystemC를 HVL로 이용하여 모델링 하시던 분들을 역시 적극적으로 끌어들이겠다는 전략으로 해석됩니다. 

 

3. 

드디어 simulation 가능한 툴이 생겨서 OVM을 좀 보고 있습니다. SystemVerilog의 Class를 참 잘 이용한 것 같습니다. 제가 평소에 하는 프로그래밍이라는 것이 대부분 모델링이라 보통 프로그래밍을 할 때 속도 문제로 OOP는 잘 사용하지 않는데(특히 virtual function의 경우 상당히 느려집니다), 걍 편하게 살자는 마음과 Verification에 한정하니 머리가 편해지는군요. OOP라는 것이 처음에 class design(실제적으로는 상속의 남발 ^^;) 잘못하면 낭패를 보는 경우가 많은데, 대부분의 코드가 공유될 때 편하긴 편하지요. 

 

4. 

ABV를 여쭈어 보시는 분들이 많은데 SystemVerilog에서 출발해야 할 부분이라고 생각되어서, 취미 삼아 Verilog사용자를 위한 SystemVerilog Guide를 지난달부터 작성하고 있는데, 회사 일과 크게 관련이 없는지라 주말에 집에서 하는 작업으로 한정하고 생각하다 보니 진도가 아주 느립니다. 어느 정도 정리되면 올리겠습니다. (대부분 doulos.com의 Tutorial 자료를 참고하고 있고, 내용에서 빠지는 부분을 채우고, 제 생각에 별로 필요 없는 부분 – 그런게 있나요.. ^^; -은 제외하고 작성하고 있습니다.

  &#8212;

쓰고 보니 요즘 문서작업으로 바쁜데.. 그 와중에 또 글을 쓰는 건 뭐지… 라는 생각이 드는 군요. (시험 전달에 이상하게 몰아두었던 만화나 드라마나 심지어 논문이 재미있어지는 것과 비슷한 현상일지도..)

 [1]: http://www.mentor.com/products/fv/methodologies/_3b715c/cb_rf.cfm