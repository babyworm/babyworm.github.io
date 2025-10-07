---
title: 잘하는 짓들이다..
author: babyworm
type: post
date: 2007-08-28T02:38:00+00:00
categories:
  - Microprocessor
tags:
  - AVM
  - SystemVerilog
  - VMM

---
어떤 것을 하던지 방법론이라는 것이 중요합니다. 잘 짜여진 방법론은 이후의 모든 일에 영향을 주기 때문이지요. 

SystemVerilog 기반의 검증은 현재 VMM, AVM 등 여러가지 방법론을 지니고 있습니다(사실 방법론이라기보다 verification library라는 표현이 맞을 지 모르겠습니다만..). 그런데, 문제는 이러한 verification library들이 tool dependent할 요소가 거의 없음에도 불구하고, 실제적으로는 tool dependent하게 만들어졌다는데 있습니다. 

예를 들어, VMM을 사용하시려면 synopsys 툴을 구매해야 합니다. 다른 툴에서 VMM을 사용하시려면, 역시 synopsys에서 해당 라이브러리를 결코 적지 않은 돈을 주고 구매해야 합니다. 당연한 이야기일지도 모르겠지만, verification methodology라는 부분을 사용자 편의보다 각 사의 market share를 늘리는 방편으로 사용하고 있는 것이겠지요.

표준화된 sugar가 있는 Assertion 분야에서 OVL이 아직도 힘을 얻고 있는 이유는 tool이 해당 부분을 따로 지원할 필요없이 간단히 \`include 구문으로&nbsp; assertion이 가능하다는데 있지 않을까요. (상대적으로 sugar는 tool에서 지원하지 않으면 쓸 수 없지요)

이번에 Cadence와 Mentor가 OVM(Open Verification Methodology)를 만들기 위한 기구를 설립했는데, 문제는 synopsys가 참여하지 않았다는 것이지이요. (혹은 cadence와 mentor가 상대적으로 systemverilog기반의 검증에서 선두를 달리고 있는 Synopsys를 견재하려고 한 짓일 확률도 높습니다만.. 여하튼)

결과적으로 OVM은 또 다시 반쪽이 될 확률이 높아졌습니다. 그나마 다행인것은 OVM의 implementation은 open source의 형태를 취할 것이라는 점입니다만.. 향후에 어떻게 흘러갈 것인지는 알 수 없겠지요.
