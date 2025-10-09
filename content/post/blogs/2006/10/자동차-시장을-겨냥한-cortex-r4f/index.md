---
title: 자동차 시장을 겨냥한 Cortex-R4F
author: babyworm
type: post
date: 2006-10-20T04:38:21+00:00
categories:
  - Microprocessor
tags:
  - arm
  - Automotive
  - Cortex-M4
  - CortexR4
  - embedded microprocessor
  - falut-tolerant

---
ZD net을 보니 {{< wikipedia "ARM" >}}이 MPR fall에서 {{< wikipedia "Cortex-R4F" >}}라는 프로세서를 발표했다고 하네요.<br>
(기사 원문은 여기에 있습니다.[기사 출처] <http://www.zdnet.co.kr/itbiz/press/network/etc/0,39032102,39152022,00.htm>)<br>
Cortex-R4는 제가 [이전 posting][1]에서도 간략히 올린 적이 있습니다만, IPC(instruction per cycle) matric의 관점에서 이전의 프로세서에 비하여 많은 향상이 있는 프로세서입니다.  실질적으로 ARM에서 Cortex시리즈를 발표하면서 main stream market을 보고 만든 프로세서이기도 하고요.. (타겟 마켓으로 보아 ARM11 마켓을 대체할 것 같습니다.)

Cortex-R4F 프로세서는 F(fault-Tolerant)라는 약자에서 알수 있듯, 시스템에서 발생가능한 오류에 대하여 대처하기 위한 오류교정코드(ECC: Error-Correcting Code) 메모리, 인터커넥트까지의 오류 검출 방법을 제공한다고 합니다. 

사실 cortex-R4F에 내장된 프로세서 자체는 fault-tolerant embedded microprocessor라기에는 좀 기능이 약하죠.. 물론 ECC같은 처리 기능을 processor pipeline안에 내장했다는 것은 추가적인 시간 지연을 적게 요구하니까 좋은 생각입니다만,Cortex의 processor core 자체의 falat를 교정하는 방법보다는 인터페이스 과정(메모리든, I/O든..)에서의 오류에 중심을 둔것으로 보입니다.<br>
하긴, 범용 마이크로 프로세서에서 항공우주쪽의 application을 위하여 개발된 프로세서와 같이 reduncency를 이용한 fault-tolerant이 적용된 프로세서를 채용하기는 무리가 있겠지요. 

Cortex-R4F는 합성 옵션이 있는 부동소수점 처리장치(FPU: Floating-Point Unit)를 제공한다는데, 아마도 configurable FPU 겠지요. \{{< wikipedia "Mathwork[/wp\]([wp]Matlab" >}}을 만든회사)와의 공동 작업도 있고하니, 편의성은 아주 좋겠습니다. 

제일 부러운점은 ARM이 인수한 phyciscal library 제작사인 {{< wikipedia "Artisan" >}}의 Advantage 라이브러리를 ARM에 최적화해서 제공해 준다는것…. (개인적으로는 ARM의 Artisan 인수에 좌절이었습니다. 같은 RTL에서 더 좋은 합성 결과를 보장해 주는 마법이니까요..)

automotive라는 분야가 embedded system에 있어서 big market으로 떠 오르고 있다는 사실과 ARM이 telecom분야 이외의 다른 마켓으로의 확장을 노리고 있다는 점이 서로 잘 맞아서 이런 결과가 나온듯 합니다. 이전의 cortex-M시리즈도 그렇구요.. 아직까지는 multimedia 나 network쪽에서는 고전하고 있지만, ARM이라는 회사의 R&D 역량이 최근에 상당히 발휘되고 있으니 여러가지 재미있는 결과가 나올 것이라 봅니다. 

덧붙여서.. 기사상에 “이중 명령어 이슈(Dual Instruction Issue) 능력을 보유한 향상된 마이크로 아키텍처를 갖추고 있는”이라고 되어 있는데.. 흠.. 제 기억에 Cortex-A가 dual issue이고, Cortex-R은 single issue로 알고 있었는데 Cortex-R4F에서 새로 추가된 feature인지 모르겠네요..

또 덧붙여서.. ARM이 여러가지 시도를 할때마다 저로서는 좌절스러운 경우가 많습니다.<br>
Falut-Tolerant 기능도 예전에 검토해 본적이 있었던 내용인데, 이 기능을 넣음으로서 상승하는 system 비용(프로세서가 아니라..)으로 인해서 채용하고자 하는 회사는 극히 적었고, 회사의 인력은 한정되어 있어서 나~~~~중에 개발하는 것으로 잠정적인 결론을 내렸었거든요. 쩝.. 인력과 돈의 문제입니다. 정말..

 [1]: http://babyworm.net/tatter/25
