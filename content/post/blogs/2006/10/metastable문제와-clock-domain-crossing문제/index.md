---
title: Metastable문제와 clock domain crossing문제
author: babyworm
type: post
date: 2006-10-28T08:11:03+00:00
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - CDC
  - Clock domain crossing
  - Metastable
  - 면접
  - 전자

---
아마도 비메모리 반도체 설계를 지망하시는 분들이 입사시 면접에서 가장 많이 받는 질문중의 하나가 바로 &#8220;**_metastable이 무엇이며, 이를 어떻게 해결할 수 있는지 설명해 보세요_**&#8221; 가 아닌가 생각합니다.

실제로 미국 비메모리 반도체 설계(ASIC designer) 직종의 면접에서 가장 많이 질문으로 사용되는 문제가 무엇인지 이야기가 나온적이 있는데, 위의 문제가 가장 많이 사용되었다고 하네요.. (이 내용을 어디서 봤는지는 잊었습니다.)

학교에서 digital system을 배우시고, HDL을 배우시고, ASIC을 시작한지 얼마 안되는 분들이 간과하기 쉬운 문제가 바로 이 metastable문제이며, 시뮬레이션에서는 별다른 문제 없어보이는데, 칩이 죽는 큰 원인중의 하나입니다.

**Metastable?**  
Metastable은 사전적 의미로 &#8220;준안정성&#8221;이라고 해석됩니다. 즉, 안정화된 값을 가지지 않은 상태인 것이지요.  
로직의 출력 전압에 따라 논리적인 값 0/1을 판단하는 디지털 로직에서는 0/1로 판단될 수 없는 전압이 출력되는 경우 이때의 전압 수준을 &#8220;undefined voltage&#8221;라 부르고, 로직상으로는 이를 &#8220;metastable&#8221; 상태인 것으로 판단합니다.

**플립 플롭에서의 metastable 상태 출력**  
Flipflop이 입력된 값을 정상적으로 출력단으로 전달하기 위해서는 clock edge의 앞뒤로 일정시간동안 데이터가 안정화 되어 있어야 하는데, 이를 setup time/hold time이라고 합니다.  
만일 데이터가 setup/hold time동안 안정화되지 못하고 데이터가 변하면 플릿플롭의 출력 transition time이 비정상적으로 길어지게 되어서 결과적으로 0/1로 판단할 수 있는 수준의 voltage level에 도달하지 못하는 상태가 발생할 수 있습니다. 이런 경우가 바로 플립플롭에서 metastable출력이 발생하는 경우이며, 이 경우 아주 치명적인 논리적 오류를 발생시킬 수 있습니다.

따라서, 플립플롭을 사용하는 synchoronous 설계에서는 setup/hold 시간을 고려하여 설계를 합니다. 즉, 데이터가 다음 클럭의 setup time 이전에 도착하도록 하고, 같은 클럭의 hold time보다 늦게 데이터가 도착하도록 설계하는 것입니다.

**Asynchronous input의 문제**  
플립플롭에 대한 asynchronous input은 이런 조작이 근본적으로 불가능하기 때문에, metastable상태가 발생할 수 있는 경우가 있습니다.  
Asynchronous input이란 다른말로, 언제 들어와도 아주 큰 상관 없는 입력이겠죠? ^^;  
그러니까, metastable을 피하기 위해 플립 플롭을 하나 더 추가하는 방법으로 metastable문제를 해결합니다.  
즉, 첫번째 플립 플롭에서 metastable이 되더라도, 추가적으로 하나 더 플립플롭을 사용하면 에러가 의미있는 로직으로 전파되는 것을 막을 수 있다는 것이지요.  이러한 해결방법을 multistage flipflop혹은 multistage synchronizer라 부릅니다.

**Clock Domain Crossing**  
사실 metastable문제는 clock domain crossing(CDC)때문에 복잡해집니다. CDC에 대한 이야기는 나중에 자세하게 이야기할 예정이고, 여기서는 간략히 소개만 하겠습니다.  
클럭 도메인이라는 것은 동일 클럭 소스를 받는 FF들의 집합 정도가 될까요&#8230; 그런데, ASIC을 설계하다 보면 클럭 도메인이 여러개가 될 수 있고, 클럭 도메인 간에 데이터 전달이 일어납니다.

연관 있는 클럭, 예를 들면 주기가 25ns인 클럭과 50ns인 <span style="color: #ff0000;">동일 소스에서 분주</span>된 두개의 클럭인 경우, 두 클럭간의 연관성이 매우 크기 때문에 clock domain crossing에서 별로 고려할 사항이 없습니다. 단지 합성시 tool setting만 제대로 해주면 되죠. ^^;

하지만, 연관성 없는 두개의 클럭, 예를 들어 클럭 소스도 완전히 분리되어 있고, 주기도 제각각인 클럭 도메인에서 신호가 전달되는 것은 asynchronous와 별다를바 없는 상황인 것입니다. 따라서 클럭 도메인을 변경시키기 위한 synchronizer와 더불어 추가적으로 플립플롭을 하나 더 써서 metastable을 방지해야 합니다.

아주 간단한 구조적 CDC문제만 이야기 했는데, 사실 CDC에는 구조적인 CDC뿐 아니라 클럭 도메인을 넘어가는 두 신호(혹은 버스)가 다시 조합되어 사용될때 발생할 수 있는 문제인 reconvergence의 문제와 같이 고려해야할 사항이 몇개 더 있습니다. 이 이야기를 좀더 알고 싶으신 분은 [cadence에서 나온 CDC 자료][1]를 참조하시면 됩니다. 나중에 이 이야기도 더 해볼 기회가 있을거라고 생각합니다.

혹시 ASIC position에 면접 보시는 분들.. metastable은 꼭 기억하고 들어가세요.

추가> Timing 시뮬레이션 관련 내용은 [이 posting을][2] 보세요

 [1]: http://www.cadence.com/whitepapers/cdc_wp.pdf
 [2]: http://babyworm.net/wordpress/?p=1345