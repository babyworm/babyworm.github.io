---
title: AMBA 4.0 공개
author: babyworm
type: post
date: 2010-03-16T16:22:04+00:00
categories:
  - 'News on SoC &amp; IP design'
tags:
  - AMBA 4.0
  - AXI 4.0

---
다들 아시겠지만, 혹시 모르시는 분이 있으실까봐 적습니다. 

AMBA 4.0이 공개되었지요.

AMBA 4.0에서는 드디어(?) AHB가 사라졌어요. 일견 그렇지요.  
하지만, AMBA 4.0은 AMBA 3.0위에 프로토콜이 추가된 것이므로, 사실은 AHB-lite가 아직 포함되어 있습니다. 

새로 추가된 라인업!

AXI 4.0  
AXI-Lite  
AXI-Stream

예전의 라인업

AXI 3.0  
AHB-Lite  
APB 3.0

이를 모두 포함하여 AMBA 4.0이 되는 것이지요.

AXI 4.0은 beat 수가 256으로 늘어난 것이 눈에 띄구요. QoS 관련된 부분등이 바뀌었군요  
AXI-Lite는 APB를 대체할 목적을 가지고 있는 느낌인데.. 흠.. APB의 latency문제 때문일까요.. 여하튼  
AXI-Stream은 사실 좀 무겁군요. 버스에서 뭐 이런걸 다.. 라는 느낌이 드는데, 아직 스펙을 잘 본것이 아니라..

나중에 한번 소개해 드릴 시간이 있을거라 생각해요.

스펙은 당연히 ARM에 🙂
