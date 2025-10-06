---
title: Power6의 십진 연산은 DFP입니다.
author: babyworm
type: post
date: 2006-10-13T04:02:17+00:00
categories:
  - Microprocessor
tags:
  - decomal
  - DFP
  - POWER6
  - 부동 소수점 연산
  - 연산

---
[아래글][1]에서 적었던 MPF fall에서 발표된 [[Power6]]가 십진 연산을 지원한다는 [ZDnet의 기사][2](번역된 한글 기사도 있습니다만)는 단지, 십진 연산이라는 표현만 있어서 그 내용이 아주 궁금했었죠.

십진 연산만을 생각하자면, [[IBM]]에서는 정수 연산에 대하여 예전부터 [[BCD]] 연산([[binary-coded decima]])으로 10진 연산을 적용했었기 때문에 별로 특별한 내용은 아니었습니다. (게다가 예전 [[ENIAC]]시절부터 10진 연산은 사용되었죠) 따라서, 뭔가 새로운 기법이 나온것은 같은데 실체가 상당히 궁금했습니다.

여러 웹사이트와 논문을 뒤적인 결과 드디어 실체를 찾을수 있었는데요, 이번에 적용된 10진 연산은 [[floating point]] 연산에 대한 이야기입니다. 이는 2003년의 ARITH16에 발표된 &#8220;[Decimal Floating-Point: Algoritm for Computers][3]&#8220;라는 논문을 기반으로 하고 있으며, 이에 대한 전반적인 내용은 IBM [웹페이지][4]에 잘 나와 있습니다.  
이는 10진수 기반의 Floating point연산(이후 DFP) 방법에 대한 내용인데, 대략적으로 살펴보니 mantisa(부동 소수점에서 지수 부분이 아닌, 유효숫자를 표시하는 부분) 부분을 binary가 아닌 compressed BCD로 표현하는 방법과 연산에 대해서 기술하고 있는 것 같습니다.  
(컴퓨터에서 floating point 연산은 모두 [[IEEE-754]]라는 복잡한 표준을 따르고 있는데, 이 표준에 대하여 decimal mode를 추가하는 IEEE-754 revision(이후 [[IEEE 754r]]) 작업이 진행중이라고 합니다. 사실 IEEE 754 표준은 그 자체가 복잡해서 많은 연구자들의 머리를 아프게 합니다. 저도 마찬가지였구요. 특히 복잡한 라운딩 모드들 ^^;)

논문에 따르면 DFP 기법은 아주 새로운 것은 아니고, 754표준을 따를 필요성이 적은 휴대용 전자 계산기 종류에서는 (최근들어) 대부분 DFP를 따르고 있다고 하네요. 하지만, 위의 IBM 웹페이지를 따르면 프로세서에 적용되는건 아마도 Power6가 최초인가 봅니다.

프로세서에서는 기본적으로 포맷의 호환성으로 고려해야 할테니 기본적으로 IEEE-754 호환 모드를 기본으로 하고, IEEE-754r을 위한 연산기를 준비하되, 이것은 특정 라이브러리를 통해서 호출되는 방식을 취하지 않을까 생각됩니다.

DFP에 대한 자세한 부분은 논문과 자료를 좀더 봐서, 머리속에서 정리가 된 후에 적겠습니다.

p.s. 나름대로 챙겨보는 논문집들이 ISCA, ASPLOS, MICRO, ARITH인데.. 어쩌다 빼먹었는지 모르겠네요. ㅠㅠ;

 [1]: http://babyworm.net/wordpress/?p=110
 [2]: http://news.zdnet.com/2100-9584_22-6124451.html
 [3]: http://www2.hursley.ibm.com/decimal/IEEE-cowlishaw-arith16.pdf
 [4]: http://www2.hursley.ibm.com/decimal/