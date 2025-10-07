---
title: Verilog PLI 배우기 (1)
author: babyworm
type: post
date: 2006-05-18T13:30:28+00:00
categories:
  - 'SoC &amp; IP design'
tags:
  - PLI
  - SoC
  - verilog HDL
  - VPI

---
Verilog 사용자가 별로 없는지라(이 이야기에 발끈~하는 엔지니어 분들도 계시겠지만, 사실 C언어 사용자 보다는 적은거 맞잖습니까.., 우리나라 사람들중에 공학도 중에, 전자공학도 중에, verilog HDL을 쓰는 분을 따지면 별로 안되죠..^^) 국내에는 verilog PLI에 대하여 다루고 있는 페이지도 별로 없다.

개인적으로도 verilog PLI 관련 내용은 외국의 웹 페이지나, sutherland의 책을 참조하고 있는데, 국내의 많은 분들도 PLI를 적극적으로 이용하고 있음에 의심에 여지가 없건만 다들 숨기기만 하시니, 참조할 곳이 참 적기만 하다.

책이야기와 더불어 verilog PLI 이야기를 특히 VPI 이야기를 한번 해보려 한다.  
뭐, 나도 PLI중의 tf\_나 acc\_는 좀 써봤지만, VPI는 얼마전에 처음 다루어 보았다.

그래서 공부 겸사 겸사.. 시간 될때 마다 정리해서 올려보려고한다.

우선 이번에는 PLI에 대한 대략적인 틀에 대해서~  
(뭐 머리속에 있는 걸 쓰는 것이니 틀린것이 있을지도..)

PLI는 Programming Language Interface, 즉 verilog 에서 C/C++과 같은 언어와의 연동을 위하여 제공하는 일종의 API이다. 예전에 정의된 tf\_, acc\_(소위 PLI1.0)는 각각의 상황에 맞는 수많은 함수가 존재해서, 적절한 함수만 찾으면 쓰기는 쉽다는 장점이 있었다. (babyworm도 예전에 이걸 가지고 simulator와 verilog와 연동시킨 적이 있다..)

하지만, 함수가 너무 많아서 reference가 없으면 도저히 쓰기 어렵고, 명확히 정의되지 않았다는 단점이 있다(특히 verilog simulator와의 interfacing부분에 있어서 표준화 되어 있지 않다).

VPI는 다시 정의된 PLI함수로서 소위 PLI2.0으로 불린다. 예전에는 시뮬레이터 지원이 잘 안된다는 단점이 있었다지만, 요즘 시뮬레이터에서는 대부분 지원하고, 상당히 일관된 인터페이스를 지니고 있는 장점을 가지고 있다.

개인적으로는 acc\_, tf\_ 를 알면 verilog simulator가 어떻게 object들을 처리하는지 정말 잘~ 알게되는 장점(?)이 있는 반면, VPI는 그런 거 알 필요 없이 함수의 설정만 알아도 대부분 처리할 수 있다는 장점이 있다.  
사용자 입장에서 어떤것이 편한 것인지는 말할 필요가 없다.

PLI는 기본적으로  
1. 그 함수를  verilog simulator에 등록하는 부분을 지니고,  
2. 해당 PLI 함수의 초기화, 호출, 크기 검사를 수행하는 callback 함수를 지니고 있다. (PLI1.0에는 misctf라는 재미나고 babyworm이 잘 사용하는 callback이 하나 더 있었다)

PLI를 verilog simlator와 연동하는 가장 쉬운 방법은 dynamic library로써 PLI함수를 컴파일하고, 이를 verilog simulator호출 시점에서 시뮬레이터에 알리는 것이다.

간단한 예를 들자면,

```bash
ncverilog +access+rwc +loadvpi=./aaaa.so:aaa_bootfunc test.v
```

이런식이다. 위에서 loadvpi라는 옵션을 사용헀는데, 이는 VPI 형태의 PLI함수를 포함한 동적 라이브러리를 시뮬레이션 시에 포함하되, aaa_bootfunc 이라는 것이 등록함수(다른 말로 bootstrap이라고 한다)로 사용할 것임을 알려주는 것이다.
다음번에는 실제적으로 VPI의 전반적인 얼계에 대해서 살펴봅시다.
