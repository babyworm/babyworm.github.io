---
title: SPEC과 EEMBC
author: babyworm
type: post
date: 2006-10-17T14:30:35+00:00
url: /archives/126
categories:
  - Microprocessor
tags:
  - benchmark
  - EEMBC
  - spec

---
이런 저런 벤치마크가 있습니다만, 컴퓨터 아키텍쳐를 하는 사람들에게 가장 관심이 집중되는 벤치마크는 바로 [[Standard Performance Evaluation Corporation]]의 SPEC 벤치마크이지요.

SPEC이 범용 마이크로 프로세서, 특히 서버와 데스크탑에 초점을 맞추고 있다면, [[EEMBC]]는 [[ARM]], [[MIPS]], [[ARC]], [[xtensa]], [[EISC]]와 같은 [[embedded microprocessor]] system을 위한 벤치마크 입니다.

벤치마크에 있어서 가장 중요한 것은 그 시스템/CPU가 사용될 환경을 착실하게 반영하는 것이겠습니다.

그래서, EEMBC는 요즘에 전력에 관한 부분이 점차 강화되고 있는 추세이고, SPEC은 멀티 미디어 분야가 추가되는 형태로 진화하고 있더군요.  
이번에 MPR에 소개된 기사는 올해 새로나온 SPEC2006에 대하여 소개하고 있는데, SPEC2000이후에 7년만의 업데이트인 만큼 여러가지가 변했습니다. 특히 눈에 띄는 것은 cache bursting application의 데이터 셋이 엄청나게 커졌습니다. 예전의 CPU들에서 캐쉬가 대략 256K정도여서 이정도를 피할 수 있게cache bursting application이 작성되었는데, 요즘엔 뭐 4M cache도 흔하니 이러한 application에서 cache miss가 발생하지 않아서 제대로 평가할수 없게 된거죠.  
눈에 띄는 다른 변화는 H.264에 대한 추가와 같이 멀티미디어 분야의 추가, 그리고 압도적인 run time의 증가를 들수 있겠습니다.

저로서야 SPEC95이후에 SPEC [[benchmark]]를 사용해본적이 없어서 특히 더 뭐라 붙일 말이 없네요.. 예전에 있던 compress나 go같은 것에 익숙한 사람이니 말입니다.  오히려 [[EEMBC]]/[[Mediabench]]/<a href="http://www.eecs.umich.edu/mibench/" target="_blank">MiBench</a>에 익숙하죠. ^^;  
(Mediabench나 MiBench의 경우 초기에는 아주 의욕적이었지만&#8230; 학교에서 만든것이다 보니 업데이트가 안되는 것이 문제기는 하네요.. 그래도 MiBench의 경우 다양한 분야의 embedded 어플리케이션을 잘 조합했다는 생각입니다. 실제적으로도 EEMBC와 유사점도 많구요.)

올해내에 CPU simulator만드는 기술적인 내용을 좀 써볼 예정(요즘에 블로그가 너무 뉴스 위주로 써나가서리..)인데, 거기서 MiBench를 하나 포팅해서 돌려볼까 합니다. 그때 좀더 자세한 내용을 쓰도록 하죠..