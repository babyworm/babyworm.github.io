---
title: 방명록에 쓰여진 문의에 대한 답변..(설계의 결과를 보는 법..)
author: babyworm
type: post
date: 2007-01-16T05:03:28+00:00
categories:
  - 'SoC & IP design : For beginners'
tags:
  - synopsys
  - Synthesis
  - 설계

---
(말머리: e-mail로 답변을 달라고 하셨지만, 기본적으로 문제는 공유하는 것이 좋다고 생각해서 posting합니다. e-mail로도 알려 드리겠습니다. 아.. 이제보니 비공개 문의셨군요.. 제가 항상 로그인 상태라서 몰랐습니다. 성함은 제외하였습니다. )

Algorithm쪽, 혹은 System을 배우는 연구실에서 알고리즘의 하드웨어적인 측면의 우수성을 알려고 할때 hardware구현을 시도해 보는 일반적입니다. (혹은 실제 동작을 확인할때도 많이 사용되지요..)

이때, 그 전의 선배들이 hardware performance를 비교한 적이 있어서 기틀이 잡혀 있는 랩이라면 아무런 문제가 없겠지만, 그렇지 않은 랩에서는 엄청나게 고생하게 되어 있습니다.

그래서 비교적 설치/사용이 간편한 FPGA 기반으로 hardware를 비교하는 경우가 종종있습니다. 하지만, FPGA는 사실 예전 글에서 설명드렸지만, functional verification에 사용되는 것이지, FPGA에서의 크기/속도를 기반으로 실제 hardware가 어느정도 크기/속도로 짐작하기는 매우 어렵습니다.
<br>
ASIC은 P&R이 자유롭기 때문에 복잡한 로직을 잘 표현하지만, FPGA는 각 Cell 에서 표현 할 수 없는 형태의 복잡한 로직(많은 입력/많은 출력이 관여하는)이라면, 여러개의 cell을 사용할 수 밖에 없고 이 과정에서 속도/크기가 나빠지기 마련입니다.

따라서, FPGA에서 나오는 속도/크기는 그냥 FPGA에서 의미를 가지며, ASIC에서는 하드웨어 형태를 추정하기는 어렵습니다(물론, 어느정도 연관관계가 있으므로, 전혀 무의미하다 할 수는 없습니다.)

문의 하신  부분의 테이블은 Artisan에서 제작된 0.18um (어느 회사 공정인지는 모르겠습니다만..) standard cell library를 이용하여 합성하고 그 값을 비교한 값입니다.
<br>
Artisan은 잘 알려진 Physical IP제작 회사이면서 라이브러리 제작회사죠.. 이번에 ARM에 합병되었습니다만.. ^^;
<br>
전 세계적으로 상당히 많은 회사에서 artisan라이브러리를 지원하고 있는데,
국내에서는 동부-아남에서 Artisan라이브러리를 쓰고 있죠.  (Hynix도 사용하던가요? hynix는 virage였나? 가물..)

```
Table III) comparison of synthesized results
| Li’s Architecture | Our Architecture
————————————————————————————————–
Technology | 0.18um Artisan CMOS | 0.18us Artisan CMOS
Critical path | 10ns | 6ns
Working frequency | 100MHz |148.5Mhz
Gate count | 13.6k | 15K
Decoding speed | less than 1 code per cycle | 1code per cycle
Capacity | SDTV | HDTV
————————————————————————————————–
```


위의 테이블에서는 동일 공정에서 critical path delay 가 예전것이 10ns이고, 제안된 것이 6ns이므로, 더 좋을 것이다. 뭐 이런 이야기겠죠? ^^;


>unix 컴퓨터에 synopsys 환경 구축은 기본이겠지요?
>
>보고 따라할 수 있는 자료나 책이 있으면 링크 혹은 추천 부탁드리겠습니다.
>
>또는 이러한 교육을 받을 수 있는 곳이 있다면 소개 부탁드립니다.

위의 결과가 synopsys에서 수행되었다는 보장은 없습니다만, synopsys일 가능성이 90%이상이겠구요(ASIC용 logic합성 시장에서 90%이상의 market share를 가지고 있으니까요..).

가장 좋은 방법은 <A href="http://idec.kaist.ac.kr/" target=_blank>IDEC</A>이나 <A href="http://www.asic.net/" target=_blank>IT-SoC </A>교육을 한번 다녀오셔서, 전반적인 flow에 대해서 이해하시는 것이 좋을 것입니다. Synopsys Korea의 교육이 있습니다만, 워낙에 비싸구요.. (IDEC 교육과 동일합니다)

기본적으로 보고 따라하실 수 있는 자료도 IDEC에 교육 자료 부분에 보시면 design compiler부분에 있습니다.
설치에서 따라하실 수 있는 자료는 synopsys에서 같이 따라나온 install guide를 보시는 것이 가장 정확합니다.

툴 설치를 정상적으로 마치셨고, 기본적인 사용법을 익히셨다면 이제 합성이 가능합니다.
<br>
로직 합성을 할때 툴과는 별개로 target library라는 것이 필요한데, 이것은 어떤 공정(위의 테이블에서는  0.18um공정에 해당하는 artisan library였죠..)을 대상으로 합성할 것인지 결정하는 것입니다. (FPGA에서 device선택과 비슷하달까요?)
<br>
이건 IDEC에서 배포하는 MPW용 몇몇 라이브러리를 사용하시면 될 것 같습니다. 하지만, 이 MPW용 라이브러리는 MPW기간에만 사용할 수 있으므로, 연구용으로 계속 사용하시기는 어려울 것입니다.

따라서, IDEC에서 배포하는 MPW용이 아닌 IDEC 자체 제작 라이브러를 사용하시거나(상용 라이브러리에 비하여 약간 라이브러리의 질이 떨어집니다만…), 교수님께 부탁드려서 몇몇 회사(삼성, Hynix, 동부/아남)에 NDA(정보 비공개 각서)를 채결하시고, 이를 연구용으로 받는 방법도 있습니다. 이 경우 NDA 조건을 잘 지키셔서 좋은 정보를 제공해준 회사들과 문제가 발생하지 않도록 신뢰를 유지하시는 것도 중요합니다.

학생일때는 최대한 IDEC을 활용하는 것이 좋겠죠.. ^^;
답변이 되었을까요?
