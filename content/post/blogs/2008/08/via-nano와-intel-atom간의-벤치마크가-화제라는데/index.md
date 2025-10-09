---
title: via nano와 Intel atom간의 벤치마크가 화제라는데..
author: babyworm
type: post
date: 2008-08-08T01:26:49+00:00
categories:
  - Microprocessor
---
오랫만에 올블을 보다보니, VIA nano와 Intel ATOM간의 벤치 마크 결과 VIA가 앞섰다는 이야기가 있어서 좀 찾아봤습니다.

지난 글에서 간단히 썼듯이 ATOM의 경우 전력 성능을 위하여 speculation을 최대한 자제한 프로세서라 할 수 있지요. 따라서 in-order issue pipeline을 사용하고 있습니다.

## ATOM
MPFJ 2008에서 Belli Kuttanna의 발표를 보면 다음과 같은 내용이 있지요.

- 이 이야기를 하면서, ‘baseline core에 비하여 성능이 떨어지더라도, 전력 소모를 줄이는 것이 목표이며, 이를 위해서 처음부터 다시 개발했다(developed from scratch)’ 라는 이야기를 같이 했었지요. 그만큼 저전력 마켓에 대한 의지가 강력하다는 의미로 받아들일 수 있겠습니다.
- 문제는 in-order issue의 경우 out-of-order에 비하여 여러 면에서 성능 차이가 발생하게 되는데, 이를 해결하기 위한 intel의 방법입니다.
  - ATOM에서는 2개의 thread를 지원하는 SMT 구조를 채용하고, 프로세서의 입장에서는 약간 특이한 OF(RF)-AG-DC1-DC2-EX-WB 형태의 backend pipeline을 구성하여 x86 native(macro) instruction에 최적화 시킨듯한 느낌입니다.
  - 이 경우 분기 예측의 중요성이 매우 커지게 되는데, 이를 보완하기 위해서 branch trace buffer, GShare predictor와 Return stack buffer등을 채용해서 분기 쪽은 비교적 aggressive하게 만든 거죠.

- 좀 재미난 건, 슬라이드 중의 다음 내용인데요..
  - Reduced number of specialized execution units and queuing structures
  - no integer multiplier, divider, store data buffer
- 처음에는 저렇게 해도 성능(clock freq말고요..)이 나올까.. 라는 부분이 궁금했습니다만, 강력한 SIMD/FP part가 있으니 integer part중 복잡한 연산을 모두 FP 부분에 넘기고, 이 결과를 바로 integer 연산 pipeline쪽으로 넘기는 동작을 수행하더군요.
- SIMD/FP 연산의 경우는 reg-reg 연산이라서 가능한 거겠지요. 물론 데이터 패스에 보면 메모리에서 FP로 바로 넘어가는 것도 있습니다만, 발생하는 일이 많지 않으니 저렇게 설정했겠습니다.

## Via Nano
아.. 제목의 것으로 돌아가서, VIA nano의 경우 약간 접근이 다릅니다.

{{< wikipedia VIA_Isaiah >}} 의 정보를 보니, VIA의 경우 out-of-order pipeline을 사용한 것을 알 수 있습니다. 따라서, 일반적인 개념상 더 빨라야 정상이겠습니다.

## Note
COOLCHIPs에서 Intel과 ARM이 한번 이야기를 나눈 적이 있는데, 전력 소모를 줄이려면 in-order를 해야 한다는 Intel에 비해서 ARM은 out-of-order를 넣어야 한다는 주장이었는데, 재미있죠? 서로 다른 영역으로 접근하고 있습니다.
