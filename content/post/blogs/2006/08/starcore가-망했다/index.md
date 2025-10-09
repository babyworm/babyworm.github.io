---
title: Starcore가 망했다.
author: babyworm
type: post
date: 2006-08-22T14:25:09+00:00
categories:
  - 'SoC & IP design'
tags:
  - DSP
  - embedded microprocessor
  - starcore

---
<img loading="lazy" decoding="async" src="featured_starcore.gif">

MPR(<http://www.mdronline.com/mpr/>) 최신호를 보니 가슴아픈 소식이 새로 올라왔다.
Starcore가 망했다는 것이다.

StarCore는 잘 알려져있는 것과 같이 상당히 유명한 축에 속하는 DSP processor IP를 판매하는 회사였으며, 모토로라와 아기어의 합작 벤쳐이기도 했다.

설계 방법이나 지원 라이브러리나 상당한 수준이었기때문에 발전이 기대되었던 회사였는데..
MPR은 회사의 기술력에도 불구하고(그래서, 별로 망할만한 이유는 없는듯 하지만 굳이 찾아보자면) 문을 닫을 수 밖에 없었던 이유로, 모회사인 agree에서 starcore기반의 SoC가 없다는 점과
starcore가 강력한(대신 비용은 좀 비싼) DSP를 지향한 반면 시장의 상황은 일반적인 성능의 DSP(필요하다면 이를 여러개 사용하고) dedicated fucntional block을 채택하는 경우가 많았다는 점(이는 embedded라면 전력 소모 관계로 flexablity보다 low power를 선택해야 하는 어쩔수 없는 선택일듯)을 꼽고 있다.

결국은 강력한 한놈보다 작은 여러개의 DSP가 workload에 따라 clock gating을 수행하여 전력 소모를 줄일 수 있는 여지가 많으므로, starcore와 같이 강력하고 큰 DSP는 embedded에서는 overkill이라는 점이 작용한 듯 한다.

약간 다른 이야기이지만, 이 이야기는 사실 프로세서 부분에도 마찬가지 일듯하다.

이전 글에서도 이야기 했듯이 software로 모든 코덱을 처리할 것이라면 x86기반의 embedded microprocessor가 득세할 것이며, 따라서 향후 PMP는 x86기반의 embedded microprocessor로 재편될 것으로 보이며, 기타 다른 아키텍쳐는 저전력을 얼마나 성공적으로 수행하느냐가 관건일 것이다.

회사에서도 저전력 분야를 강화하고 있는데, 이쪽으로 좀더 어필할 수 있도록 하는 노력이 필요하겠다.
