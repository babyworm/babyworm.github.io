---
title: 마이크로 프로세서가 나아가야 할 방향…
author: babyworm
type: post
date: 2007-06-23T04:28:26+00:00
categories:
  - Microprocessor
tags:
  - 마이크로 프로세서

---
쓰고보니 상당히 거창한 제목입니다.  
요즘 <A href="http://babyworm.net/tatter/179" target=_blank>프로세서 로드맵 작성중</A>이라는 말씀을 드렸는데, <A href="http://babyworm.net/tatter/180" target=_blank>회사에 중대한 일</A>이 생겨서 전면적으로 홀드 상태입니다. 가용 자원이나 target이 약간 수정되어야 하니 말입니다.  
그래도, 마이크로 프로세서가 나아가야 할 방향성은 크게 달라지지 않겠지요. 단지, 현재 상황에서는 targeting하기 어려울 것이라 생각했던 목표를 추가적으로 설정할 수 있게 되었다는 것이 중요하겠지요.

**<FONT size=1>  


### ****<FONT size=3>Energy Efficient</FONT>**</H7>**</FONT>**현재 microprocessor 개발에 있어서 ({{< wikipedia "EISC" >}}나 {{< wikipedia "ARM" >}}같은 embedded microprocessor에 한정하지 않더라도) 가장 중요한 목표가 무엇이겠습니까?

  
아마도 energy-efficient 가 아닐까 생각합니다.  
생각보다 많은 분들이 저전력 (low power)프로세서와 에너지 효율이 높은(energy-efficient) 프로세서를 혼용하여 사용하시는데, 사실은 약간 차이가 있습니다. 

아시다시피 전력은 소모되는 에너지를 단위 시간으로 나눈 것이지요.  
에너지는 일량. 즉 어떤 일을 끝내는데 필요한 힘이라 보시면 되겠습니다. 

Low Power와 energy-efficient가 어떻게 다른지 한번 간단한 예를 들어 봅시다. 

A라는 프로세서는 123.exe라는 프로그램을 한번 처리하는데 10초가 걸리며 100mw의 전력을 소모하는 반면,  
B라는 프로세서는 123.exe라는 프로그램을 한번 처리하는데 2초가 걸리며 200mw의 전력을 소모한다고 생각해 보죠.

어떤 프로세서가 energy-efficient하겠습니까? 당연히 B 프로세서입니다. 전력소모에 있어서는 A라는 프로세서가 더 저전력이지만 말입니다.  
Energy 단위의 중요성은 &#8220;동일한 일&#8221;을 수행하는데 얼마나 적은 에너지를 소모하는냐를 따지는 척도이기 때문에, 단순히 단위 시간당 얼마나 적은 &#8220;전력&#8221;을 소모하느냐와는 약간 다르다고 생각하시면 됩니다. 

다른 관점에서 전력은 power supply가 얼마나 전력을 공급해 줄 수 있느냐와 발열에 영향을 미칩니다. 그래서 desktop/server에서는 평균적인 전력 소모가 얼마나 되는지가 중요합니다.  
이에 반하여 Energy는 동일 용량 battery로 얼마나 버틸 수 있느냐를 결정할 때 매우 중요한 요소입니다.  
단, 아무리 energy efficient하더라도 전력 소모가 크다면 (예를 들어 C라는 프로세서가 123.exe를 처리하는데 0.0001초가 걸리고 30W가 소모된다고 예를 듭시다), battery를 사용하는 시장 자체에 진입이 불가능할 수도 있습니다. 그런 관점에서는 low power와 energy-efficient가 밀접한 관계가 있는 것이겠지요. 

요즘에 low-power보다 energy-efficient가 중요시되는 중요한 이유중의 하나는 dynamic power management 기법의 적극적인 활용입니다. Dynamic power management 기법은 &#8220;사용하지 않을때는 해당 유닛에 공급되는 전력을 최소화 한다&#8221;라고 생각하시면 되는데, 저전력을 위하여 느릿 느릿 오랫동안 일을 지속하는 것 보다, 빠른 시간에 작업을 끝내고 전력 소모를 더이상 하지 않는 것이 좋다는 것이겠지요.  
여담입니다만, Dynamic power consumption 기법이 활성화되지 않았다면, 사실 energy-efficient와 low power는 동일한 언어로 표현되지 않았을까.. 라는 생각도 해봅니다. 

또 다른 관점에서&#8230;  
Enenry-Efficient는 Hardware만의 문제가 아니라 Software도 같이 노력해야 하는 문제입니다. (물론, 저전력도 그렇습니다만) Energy란 &#8220;어떤 일&#8221;을 수행하는데 소모되는 시간이기 때문에, &#8220;어떤 일&#8221;을 빠르게 수행할 수 있도록 더 효율적인 코드를 만드는 책임이 소프트웨어에게 있는 것이지요. 

<FONT size=3>**프로그래머의 관점에서**  
</FONT>  
프로세서를 사용하는 프로그래머에게는 약간 다른 관점이 있는데, 프로그래밍이 쉬워야 한다는 측면입니다.  
프로세서 아키텍쳐는 벌써 dual core, quad core로 발전하고 있으며, GPU들도 programmable shader를 가지고 있으므로, 아키텍쳐적인 형태로 보았을 때는 heterogeneous multiprocessor의 형태를 이미 취하고 있다고 보셔도 됩니다.  
문제는 프로그래머들은 아직 multiprocessor를 사용할 준비가 되어 있지 않다는 것입니다. Multiprocessor를 지원하는 OS와 compiler, library의 등장으로 물론 점점 multiprocessor를 효과적으로 사용해 나가는 상황이 되어가고 있는 것은 맞습니다만, 아직 프로그래머들이 multiprocessor가 제공하는 기능을 충분히 활용하고 있는 상태는 아닙니다. &nbsp;  
점차 나아지겠습니다만, 프로그래머의 역량 강화가 매우 시급한 상황입니다.