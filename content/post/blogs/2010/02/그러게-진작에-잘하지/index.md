---
title: 그러게 진작에 잘하지
author: babyworm
type: post
date: 2010-02-28T20:00:18+00:00
categories:
  - SoC
  - IP design
tags:
  - arm
  - ATOM
  - OVM
  - VMM

---

## VMM / OVM

얼마 전에(워낙에 요즘에 업데이트를 안하고 있어서 좀 그렇지요?) VMM과 OVM의 interoperation kit이 나왔지요. Accellera에서 추가적인 자료가 나왔다고도 하지요 ([여기][1]).

결국 이렇게 될 것을 진작에 합쳐서 잘 만들지, Synopsys가 주도하는 VMM과 Mentor와 Cadence가 주도하는 OVM 진영으로 나뉠 때부터 좀 그랬어요 <span style="font-family: Wingdings;">J</span> 그래도 지금이라도 공동 작업이 이루어지니 좋은 결과가 나올 것으로 봅니다. 가장 좋은 것은 그냥 하나로 묶는 건데, 각 회사의 정치적인 부분이 조금 첨예해서 왠지 합쳐지지는 않을 듯 하죠.

아무래도 Synthesis 부분에 있어서는 Synopsys의 강세인 반면에, Functional Simulation & verification에 있어서는 Cadence가 많이 앞서나가고 Mentor도 학생들에게는 많이 퍼져 있으니 전반적으로 OVM이 좀 더 세력을 더 많이 가지고 있다고 생각됩니다. 아마존 같은 데서 나오는 책의 양을 봐도 그렇구요. </p>

## Intel Core IP

인텔이 TSMC를 통해서 Atom Core License를 한다는 말이 있었는데, 하기는 하나 보군요.

이 이야기는 3<sup>rd</sup> party에서 인텔 Atom Core가 들어간 SoC를 만들 수도 있다는 이야기인데요. 이 경우에 현재 ARM에 내주고 있는 시장을 많이 Intel 계열로 되찾아 올 수 있는 가능성이 있습니다. 사실 모바일 시장이 인텔의 입장에서는 그다지 매력적인 시장은 아니죠. 시장은 크지만 가격 경쟁이 심하다보니 그간 우주선을 주워서 비싼 CPU를 만들던 인텔이 만족할 만한 것은 아니죠. 어찌보면 Atom의 성능을 제한하고, Integration level을 제한하고 있는 것도 좀더 높은 마진을 가지고 있는 노트북 용 CPU 시장을 잠식당하는 것을 원하지 않기 때문이지요.

따라서, Atom Core License 이야기가 나왔을 때도, 이 부분에 대한 business model에 대한 이야기가 많았는데 사실 공개된 것만 보면 super 갑의 형태를 보여주는 라이선스 모델을 가지고 있군요.

예전에 MPR에서도 이 부분에 대해서 아주 실랄하게 깐 적이 있기는 한데, 이번에 EE-Times에서도 실랄하게 깠군요 (EETimes; [Six reasons why no one wants an Atom-based SoC][2]).

사실 인텔 입장에서는 아쉬울 것이 별로 없고, 혹시라도 3<sup>rd</sup> party의 칩에서 너무 좋은 결과가 나오면 노트북용 시장이 직접적으로 영향을 받을 수도 있는 상황이고, 그렇다고 손을 놓고 있자니 ARM 기반의 칩들이 스멀 스멀 netbook 부분을 잠식해 와서 윈텔 시장에 위해를 가할 수도 있는 위협이 눈에 보이는 상황인 것이지요.

Intel 계통에서 가장 강력한 힘은 전세계 데스크탑 PC 시장의 93%를 잠식하고 있는 Windows 운영체제가 돌아가며, 그 위에 구축되어 있는 강력한 소프트웨어가 있다는 점이지요. 하지만, ARM에서 정말 공략을 잘해서 netbook 시장에서 any-operating system과 web-based application을 가진 생태계 구축에 성공하면 그때부터는 이야기가 달라지게 되지요(현재로서는 쉬운 이야기가 아닙니다. 개인적인 예상으로는 2012년 정도까지 대략 1%~2% 정도만 잠식할 수 있다고 해도 성공으로 봐주겠습니다. 참고적으로 현재 MacOS의 점유율은 5%도 안됩니다.)

여하튼, 인텔의 다음 행보가 기대가 되기는 합니다. 공격을 받고만 있을만한 회사는 아니니까요. <span style="font-family: Wingdings;">J</span>

 [1]: http://www.accellera.org/activities/vip/VIP_1.0.pdf
 [2]: http://www.eetimes.com/news/latest/showArticle.jhtml?articleID=223100833
