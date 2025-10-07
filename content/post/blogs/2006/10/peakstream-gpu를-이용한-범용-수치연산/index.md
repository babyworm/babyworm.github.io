---
title: 'PeakStream: GPU를 이용한 범용 수치연산!'
author: babyworm
type: post
date: 2006-10-10T14:02:45+00:00
categories:
  - 'SoC &amp; IP design'
tags:
  - API
  - GPU
  - PeakStream
  - 멀티프로세서

---
MPR 10/2일자에 PeakStream이라는 재미있는 라이브러리(플랫폼?)에 대한 내용이 있어서 좀 살펴봤습니다.  
[PeakStream][1]이라는 회사의 플랫폼은 GPU를 이용하여 범용 수치 연산을 하기 위한 여러가지 방법(API)을 제공하는 것인데요.. 상당히 재미있습니다.

다음 그림은 peakstream의 아키텍쳐를 보여주는데, 간단히 설명드리자면 연산량이 많은 응용분야에서 peakstream의 API를 써서 프로그래밍하고, 이것이 현존하는 GPU에 연산기능을 mapping해서 병렬 연산을 한다는 구조입니다.

&#8221;]<img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile22.uf.1452884A4D6A7A9029DC7D.gif?resize=266%2C366" alt="" width="266" height="366" data-recalc-dims="1" />현재 가장 빠른 GPU의 경우 가장 빠른 dual core x86 CPU보다 7배 이상의 부동 소수점 연산 성능을 지니고 있는 괴물이라고 합니다[출처: MPR 06/10/2]. 게다가 peakstream 백서에서는 그 격차가 매년 2배씩 벌어지고 있다고 합니다. peakstream은 다양한 부동 소수점 연산에 GPU의 성능을 쓰자는 아이디어를 구체화시킨것이라 할 수 있습니다.

> Today, the CPU with the best floating point performance is the dual-core Intel Xeon 5160 which offers 48 gflops of single precision floating point performance. In contrast, the commodity high-end  GPU offers 360 gflops of single precision floating-point performance  and more than 50 GBytes/s of bandwidth to local memory. The computational performance growth rate for GPUs over the last few years has exceeded 2x per year. [Hanrahan05]

사실, Nvidia에서는 강력한 쉐이더를 이용해서, 물리 연산을 하는 방법을 제시하고 있으니 아주 새로운 아이디어는 아닙니다만, 쓰기가 쉽지만은 않습니다.  
하지만, (예제로 나온)peakstream 코딩은 단지 기존의 부동 소수점 연산을 단지 해당 API에서 제공하는 연산 함수로만 바꾼듯 한 모습을 지닙니다. 즉, 포팅이 아주 쉽다는 것이지요. 지원하는 컴파일러도 GCC, intel compiler, matlab과 같이 많이 사용하는 환경에서는 모두 가능하고 말입니다.

아직까지는  ATI R580 프로세서(X1900 series라네요)만 지원하고 있으며, 하나의 프로세서만(즉, cross-fire 환경을 지원못한다는 말이죠) 사용할 수 있는데, 이 회사가 만들어진것이 2005년 2월, 수면 위로 떠오른것이 2006년 9월이니 이후의 일들을 더 기대해도 될 것 같습니다.

제가 얼마전에 [멀티프로세서 환경에서 소프트웨어가 중요][2]하다는 글을 쓴적이 있는데, 소프트웨어 부분에서도 분발하고 있군요.

p.s. 오랫만에 11시 이전에 집에 온 기념 포스팅입니다. ㅠㅠ;

 [1]: http://www.peakstreaminc.com/
 [2]: http://babyworm.net/wordpress/?p=95
