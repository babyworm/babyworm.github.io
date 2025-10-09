---
title: Microsoft의 ARM지원
author: babyworm
type: post
date: 2011-01-16T09:10:01+00:00
categories:
  - SoC
  - IP design
tags:
  - arm
  - Windows

---
마이크로소프트 windows에서 ARM을 지원한다는 소식이 지면을 장식한 것으로 이런 저런 이야기가 많은데요.

  저는 별로 새로울 것도 없네.. 정도의 느낌입니다. 물론 한 걸음 갔다는 정도의 의미는 있습니다.

  일단 windows의 속성상 binary compatibility를 가지고 있지 않은 두 아키텍쳐를 지원하는 것은 어차피 application이 바로 재활용될 수 없을 것이기 때문입니다.

  즉, 모든 application이 재컴파일되어야 한다는 건데요..


1.  개발의 입장에서 일단 비쥬얼스튜디오에서는 ARM 아키텍처를 지원하겠죠. (하지만, 지금이라고 지원 못하는 건 아닙니다. mobile 버전이었지만요..)


2.  Windows API를 이제 ARM용 application에서도 직접적으로 사용할 수 있겠죠.  (하지만, windows CE도 API의 많은 부분을 계속 통합하던 중이었습니다. 물론, 차이도 있었지요..)


  위의 두 가지가 결정적인 장점으로 작용할 것입니다.

  하지만 3rd party의 library를 사용했다면, 3rd party에서 ARM architecture용 라이브러리를 내 놓을때까지 기다려야 겠네요. 즉, 시간이 상당히 걸릴것이고 intel base PC에 비해서 minor일 것으로 보이는 netbook 시장을 위해서 얼마나 많은 업체들이 뛰어들지는 모르겠습니다.

  어플리케이션 입장에서는 일단 MS의 강력한 지원을 받을 수도 있을 것이라는 기대가 있습니다. 특히 최고의 killer app인 office의 지원을 받을 가능성이 매우 높아졌네요. 사실 저는 그것만으로도 기대가 좀 있습니다.

  하지만, 기사에서 이야기하는 것처럼 세상이 바뀔 것이라는 생각은 아직 좀처럼 들지 않네요. 모르죠. 한 2년쯤 지나서 netbook/tablet의 시장이 지금보다 훨씬 커지고(지금은 niche market일 뿐이죠..), 그때까지도 intel의 대응이 실패한다면 가능성이 있겠죠.


  참고적으로 android에서 다른 architecture(MIPS, Intel)을 지원하는 것은 약간 다른 이야기가 됩니다. 아시다시피 android는 java(실제적으로는 dalvik VM에 맞게 compile하지만..)를 기반으로 하고 있으므로, 시스템이 어딘가에 포팅되는 것에 application이 받는 영향이 아주 크지 않을 것이라고 생각됩니다.  (적다고 이야기는 못합니다. ㅎㅎ 하지만, 전혀 안도는 수준이 되지는 않죠.. )

  여하튼, ARM 아키텍쳐가 좀 더 높은 시장을 공략하는데 있어서 중요한 step이라는 것은 부인할 수 없겠네요.

  추가…

  아래 커맨트를 보시면 .net framework에 대해서 이야기 해주셨습니다. 감사합니다. 제가 잊고 있던 건데요.. 닷넷도 virtual machine상에서 도는 bytecode로 되어 있어서 포팅(?)이 아주 편하겠습니다.

  따라서, ARM용 windows가 나오면 적어도 .NET framework 기반의 어플 정도는 거의 완전히 구동되지 않을까 생각합니다.

  물론 모든 어플의 호환은 좀 더 먼 이야기겠죠.

  하지만, 앞에서 설명했지만, 중요한 한 걸음이라는 의의가 있겠네요.
