---
title: 가상화 기술.. 왜 각광 받는가?
author: babyworm
type: post
date: 2007-04-11T13:31:16+00:00
url: /archives/269
categories:
  - Microprocessor
tags:
  - 가상화
  - 마이크로 프로세서

---
<DIV style="BORDER-RIGHT: #fff200 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #fff200 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #fff200 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #fff200 1px dotted; BACKGROUND-COLOR: #ffffcc">
  이 글은 MPR의 &#8220;gHOST in the machine&#8221;이라는 3주간의 연재 기사를 읽고 이를 토대로 &#8220;제 기억 남은 내용과 그 간의 어설픈 지식을 버무려&#8221; 쓴 글입니다. 관심 있으신 분은 microprocessor report를 보시는 것이 더 좋은 글을 읽으실 수 있습니다. <br />
</DIV>

  
요즘 마이크로 프로세서에서는 &#8220;가상화(virtualization)&#8221;라는 기술이 각광받고 있습니다.  
Intel도 AMD도 서로 앞을 다투어 &#8220;가상화&#8221; 가속 명령어라는 것을 대대적으로 홍보하고 있지요.  
그럼.. 가상화 기술이 대관절 무엇이관대 이렇게도 세상을 시끄럽게 하는지 알아보도록 하겠습니다. 

우선, 생각해볼 문제가 가상화란 것이 무엇인가 하는 점입니다.  
가상화란 &#8220;A&#8221;라는 머신에 &#8220;B&#8221;라는 virtual machine을 구동시키는 것을 의미합니다. 근데, embedded 분야에 종사하시는 분은 상당히 익숙하실만한 Intel CPU상에서 ARM이나 MIPS cpu simulator가 구동되는것도 엄연히 virtual machine이 구동되는 것입니다. (사실 마음 같아서는 제가 만든 EISC processor simulator인 ESCAsim도 끼워 넣고 싶지만.. ^^; 사용해 보셨을 분이 극히 제한적이라.. 그래도 나름대로 uCLinux까지도 구동 가능한 simulator랍니다.). 또한, 일반적인 사용자분들께서도 JVM(Java Virtual Machine)에 익숙하실 것입니다. &nbsp;즉, 가상화란 &#8220;특별한 기술&#8221;이 아니라는 거죠. 다른 프로세서의 &#8220;동작&#8221;을 모사하는 것은 범용 마이크로 프로세서에게 있어서는 큰 문제가 아니라는 것이죠. 

제가 가상화 가속 기술들이 속속 소개 될때 가장 궁금했던 내용이 &#8220;왜 가상화 가속이 필요한가&#8221; 였습니다. 일반적으로 모든 프로세서에서 큰 어려움 없이 되는 것에 대한 가속이라.. 근데, 문제는 다른 것이더군요. 그리고, 이 문제가 multithread/multicore processor를 이끄는 힘 중에 하나가 됩니다. 흥미 진진하죠?

시간은 거슬러 소프트웨어 업계의 가장 변태적인(저는 가끔 천재적인 = 변태적인으로 인식하게 되더군요..) 소프트웨중의 하나인 &#8220;VMWare&#8221;가 나타납니다. VMWare는 Virtual machine인데, 해당 프로세서뿐 아니라 해당 시스템에 있는 모든 시스템을 가상화시킨 하나의 독립적인 &#8220;시스템&#8221;으로서의 가치가 있습니다.

이 각각의 독립적인 **가상 시스템**에서 서버를 운용한다면 어떻게 될까요?  
하나의 머신에서 A,B,C라는 세 개의 서버가 운용되고, A라는 머신에 문제가 발생해도 B, C라는 머신은 문제 없이 수행되겠지요? 즉, 안정성의 문제가 향상되고.. OS 하나가 만들어 낼 수 있는 thread보다 OS 세 개가 만들어내는 thread가 당연히 많고 parallelism도 높겠지요. 즉, multiprocessing/multithreading에 유리한 환경이 됩니다.  
이 부분이 가상화 기술이 multicore/multithreading의 기치를 높이 들고 있는 현재의 microprocessor에게 있어서 병렬성의 문제를 확보할 수 있는 아주 좋은 수단으로 여겨지게 되는 것입니다. 

그런데, 문제는 각 가상 시스템이 host OS의 application이라는 점입니다. 즉, host OS에 문제가 발생하면 전체 가상 시스템에 문제가 발생한다는 문제점이 있는거죠. 이 문제는 아주 치명적입니다. 여러 개의 가상 시스템이 한번에 모두 죽어버릴 수 있는 여지가 있는 것이니까요.

이 문제를 해결하고자 하는 방법이 기존의 user/supervisor 모델에 hypervisor라는 권한(혹은 권한 수준)을 추가하는 것입니다. 즉, 예전에는 O/S가 모든 하드웨어나 서비스에 접근했는데, 이중에 민감한 부분은 hypervisor(혹은 virtual machine manager)라는 firmware가 서비스를 담당하고, 그 위에서 각 OS(실은 VM이겠죠?)들이 도는 구조로 바뀌는 거죠.  
예전에 application이 OS에 종속되고, OS가 다시 hyperviosr에 종속되면서 점점 하드웨어에 직접 접근해서 시스템 전체를 불안하게 만드는 것이 허용되지 않게 되는 것입니다. 

가상화 &#8220;가속&#8221; 기술이란 말하자면, 이런 hypervisor를 추가하여 운용할 수 있도록 하는 명령을 추가하는 것으로 보시면 되겠습니다. Microprocessor report상에서는 각 프로세서간의 차이점등 아주 재미있는 내용이 많으니, 관심있으신 분은 꼭 보세요 🙂 (이 부분도 포스팅 하고 싶습니다만, 좀 내용이 너무 전문적일지도 모른다는 생각에.. 혹시라도 요청이 있다면 고려하겠습니다)