---
title: 'AMD Torrenza: 서버 통합의 방법을 모색하다.'
author: babyworm
type: post
date: 2006-10-01T12:04:34+00:00
categories:
  - Microprocessor
tags:
  - AMD
  - Torrenza
  - 마이크로 프로세서

---
AMD에서 비지니스 환경을 위한 &#8220;Torrenza&#8221;, &#8220;Trinity&#8221;, &#8220;Raiden&#8221;의 세 가지 신기술을 발표했습니다. 보도자료를 보면 거의 마케팅적인 용어로 도배로 되어 있습니다만, Torrenza는 AMD64 프로세서와 이종(혹은 동종) 프로세서간의 서버 버스/소켓에 대한 공개 규약이고, Trinity는 보안,가상기술,관리를 통합하는 하나의 공개 전략이며, 코드명 &#8220;Radien&#8221;은 일종의 클라이언트 기술로 파악됩니다.  
(보도자료 전문은 [http://www.amd.com/us-en/Corporate/VirtualPressRoom/0,,51\_104\_543~109409,00.html][1])

하지만, Torrenza, Trinity, Raiden 모두 선언적 의미가 강했었으며 실체를 파악하기 힘들었는데, MPR에서 Torrenza에 대해서 어느정도 궁금증을 해소하게 해주는군요.

&#8221;]<img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile5.uf.162C95494D6A7A8D0DF31C.jpg?resize=500%2C376" width="500" height="376" alt="" data-recalc-dims="1" />

MPR에 따르면, 토렌자 기술은 서버 환경을 위한 공개 버스/소켓 아키텍쳐로서 HyperTransport 2, HyperTransport 3 그리고, HTX 에드인 카드 인터페이스, HT3 기반의 1207 소켓을 구성요소로 취하고 있다고 합니다.  
AMD는 이 토렌자 기술이 서버들에 있어서 표준 인터페이스 기술이 되도록 하기 위해서, 다른 파트너사들과 함께 Opteron Rev F에서 사용된 1207핀 소켓에 기반을 둔 Torrenza Innovation Socket(TIS)라는 공통 소켓 표준을 같이 개발하고 있다고 하네요. 

현재 Common interface partner사로는 Tarari, RMI(알케미 인수한 회사죠?), Bay microsystems, DRC, Celoxica(셀록시카가 들어있다는 건 좀 의외네요..), XtremeData, Qlogic과 같은 많은 분야의 회사들이 망라되어 있고, Common Socket Partner사로는 IBM, Cray, Sun Microsystems가 있습니다 (인텔의 제외한 서버용 프로세서 규모가 있는 서버용 프로세서 회사는 다 모인거 아닌가요? ^^;) 

토렌자 표준에 따르면, AMD의 opteron프로세서가 1207 소켓에 장착되어 HT 버스로 연결되는 것과 같이 타사의 프로세서 역시 1207핀 소켓에 장착되어 HT버스로 서로 직접 통신이 가능하고 (코프로세서로 인식되겠습니다만), 그 이외의 프로세서 역시&nbsp; HTX를 이용하여 장착 가능하게 된다고 합니다. 

즉, 토렌자가 실현되는 경우 서로 다른 이종간 멀티 프로세서 환경이 아주 쉽게 구축 가능하다는 장점이 있겠습니다. 이종간 멀티프로세서 시스템의 구축을 통한 가장 큰 장점은 아마도 virtualization이 아닐까 생각도 되는데, 한 시스템에 두가지 이종간 CPU를 설치하고 해당 CPU의 applicaiton을 자유롭게 실행시킨다는 점이 실현 가능하겠습니다. 

소프트웨어가 어떻게/얼마나 지원해 줄지 미지수입니다만.. 아마도 Tirinity라는 플랫폼이 이러한 이종간의 시스템에서 자유로운 보안, 가상화, 관리을 해결하기 위한 방법론이 아닐까 생각됩니다. (AMD도 생각이 있을테니까요..)

처음으로 발표된 x86기반의 공개 소켓/인터페이스 표준이니 기대가 됩니다.  
(인텔의 반격도 기대되는 건 사실입니다만, 인텔의 &#8220;플랫폼 맘대로 바꾸기&#8221;에는 나름의 철학이 있으니.. ^^;)

 [1]: http://www.amd.com/us-en/Corporate/VirtualPressRoom/0,,51_104_543~109409,00.html
