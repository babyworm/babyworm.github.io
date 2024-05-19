---
title: embedded microprocessor; 인텔과 AMD의 선택
author: babyworm
type: post
date: 2006-07-01T16:32:00+00:00
url: /archives/30
categories:
  - 'SoC &amp; IP design'
tags:
  - Embedded
  - Microprocessor

---
인텔에서 ARM기반의 strongARM와 XScale 사업에서 손을 땐다고 한다.  
그리고, 뒤를 이어 AMD도 MIPS기반의 알케미 사업에서 손을 땐다고 한다.

이상한 일이라고 생각하실 분들도 많겠지만, 자연스러운 변화라고 본다.

인텔과 AMD에서 타겟으로 하는 내장형 마이크로 프로세서는 이쪽 분야에서는 high-end라 볼수 있고, embedded에서 high end는 현재 PDA나 PMP라 할 수 있겠다.  
특히, 사용자들의 요구가 PMP쪽으로 방향이 바뀌고 있는데, 이때 중요한 것이 얼마나 많은 코덱을 지원할 수 있으냐가 되겠다.  
현재 상태에서 가장 많은 코덱을 지원할 수 있는 아키텍쳐는 명백하게 x86이다.  
그리고, PMP쪽에서 요구하는 저전력/고성능이라는 요구는 low-end mobile cpu의 요구사항과 일치한다.  
따라서, ARM이나 MIPS의 성능을 끌어올리기 위해 SIMD기능을 아주 강력하게 추가하고, 클럭을 높이기 위하여 파이프라인의 깊이를 깊게하는 것보다는 기존의 mobile cpu로 대치하는 것이 합당하다고 생각했을 것이다.

동일한 타켓의 두 아키텍쳐는 프로세서 만드는 회사에 부담이 되는 것이므로, 당연히 x86기반의 PMP가 나타날 것이라 예상되며, 이 두 회사는 아마도 1~2년 내에 x86기반의 mobile CPU를 PMP용(이 정도면 아마도 더 이상은 PMP가 아니고 UMPC쪽일지도 모르겠지만) 출시할 것이라 보인다. 

그렇다면, embedded cpu의 성능이 일정 부분 이상을 상회해야 한다면, 이 부분은 x86쪽에서 가져갈 확률이 높다는 말이고, 아무래도 embedded cpu는 특정 분야에 특화되거나, (소위 이야기하는)범용 embedded microprocessor는 x86보다 저전력으로 구현해야 하는 PDA정도의 시장까지가 한계가 아닐까 싶다.

EISC는 어디로 가야 할 것인가.