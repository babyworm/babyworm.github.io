---
title: Level of abstraction
author: babyworm
type: post
date: 2007-03-27T11:56:05+00:00
categories:
  - verification
tags:
  - abstraction
  - SystemVerilog
  - Verification
  - 추상화 수준

---
“추상화 수준”, “추상화 단계”라 불리는 용어이지요. 아마도 C++를 다루실 때 많이 접하셨을 것이라 생각합니다. ^^; 추상화 수준이라는 것은 말 그대로 추상화의 정도입니다. 추상화의 반대가 구체화라는 것은 아실 것이고, 추상화는 생각에, 구체화는 사물에 가깝다는 것도 아실 것이라 생각합니다.

모든 작품(?)이 다들 그렇지만, 머리 속의 관념이(ASIC에서는 알고리즘) 표현 도구를 통하여 구체화되는 과정을 거쳐서 하나의 작품이 됩니다. 이때 머리속의 관념은 추상화 단계에서 점차 구체화되는데요.. 칩쟁이들이 잘 하는 말로 algorithm level, architecture level, register transfer level, gate level, physical implement level 뭐 이 정도 표현할 수 있겠습니다. 

ASIC에 있어서 보통 RTL이라고 하는 register transfer level에서부터 physical impelmentation level(즉, GDSII라는 완성된 그림이 나오는 단계)까지는 EDA툴이라 부르는 CAD툴에 거의 전적으로 의존하게 됩니다. (아날로그 하시는 분들이 빼고요.. 그 분들은 직접 그림을 그리시는 artist잖아요~ ^^;)

즉, 설계라는 분야란 기계적으로 말하자면 algorithm을 RTL로 변환하는 과정을 의미합니다. “기계적”이란 용어를 사용한 건 말이 그렇다는 것을 알려드리고 싶어서입니다. ^^;<br>
실무에서 보면, algorithm을 전공하신 분과 computer architecture/ASIC을 전공하신 분이 실무에서 어느 정도 일하다가 동일한 작업을 수행하기 위하여 RTL을 만들때 보면 전혀 다른 RTL을 만들어낼때가 있는데, 가장 큰 이유는 어느 추상화 수준에 초점을 맞추었느냐에 차이가 있고, 두 번째는 ASIC 전공자들은 알고리즘 자체를 볼때 하드웨어 구현을 고려하여 하드웨어에 최적화된 알고리즘을 생각하는 반면, 많은 알고리즘 전공자 분들께서는 software적인 최적화 알고리즘을 많이 생각해 내십니다. (에고.. 그냥 이야기하다가 너무 벗어났네요..여하튼.. 저는 각 전공분야에서 보는 관점이 다르다..라는 이야길 하고 싶었는데.. 쩝. ^^;)

검증에서는 약간 더 많은 추상화 단계를 지닙니다. 사실 검증이라기 보다는 modeling이라는 표현이 맞겠습니다. 이건 model의 정확성과 수행 시간간의 상관관계 때문에 아주 정확하지 않아도 되는 부분은 추상적으로 표현해서 속도를 빠르게 할 수 있기 때문이지요. 

예를 들어, gate 수준으로 구현된 netlist simulation보다 RTL simulation이 훨씬 빠른 것이 당연하고, RTL simulation보다 대략적인 functional model을 이용하는 것이 더 빠르니까요. 

이 functional model은 약간 더 세분하면

  * Transaction level model; 사실 각 모듈 간의 동작만을 정의하는 것이지요. 내부 동작 자체를 구현할 수도 안할 수도 있는데, 일반적으로 ‘추상화 수준이 높다’고 이야기 할때는 내부 동작은 구현하지 않고 모듈의 transaction만을 나타낼 때입니다. 
  
  * Untimed functional model; transaction level도 untimed와 timed로 나뉘는데 시간에 대한 정보 포함 여부에 따라 나눕니다. 그냥 읽고/쓰고.. 이런식으로 하면 untimed이고, 가장 추상화 수준이 높다고 봅니다. 
  
  * Timed functional model; timed는 transaction의 time정보가 있으므로, 약간은 더 구체화 된 수준입니다. 

대략 이런식으로 나눕니다. 물론, 이것 이외에도 behavior level을 나누는 형태로

  * bus functional model(BFM) – bus functional model은 사실 transaction level model과 별 차이 없다고 생각되는데 많은 경우 pin accuracy가 있느냐를 가지고 나눕니다. 말 그대로 모듈의 출력/버스 수준에서의 동작만을 기술한 것입니다. 알고리즘이 들어간 블럭의 경우 이런거 만들기 쉽습니다.  
  
  * bus cycle accurate model – timed functional model과 유사하죠.
  
  * cycle accurate model – 시스템 클럭 수준에서의 동작을 맞추어 주는 수준입니다. 

둘 사이에 많은 유사점이 있는데, 큰 사항은 transaction을 추상화 할 것이냐 차이겠습니다. 

사실 pipelined processor와 같은 control 위주의 모델에서는 transaction model이 크게 편하지 않습니다. 어짜피 명령어 fetching 이후에 몇번째 사이클에서 data bus에 어떤 종류의 transaction이 발생할지를 알아내기 위해서는 어느 정도 구체화를 해야하니까요. 하지만, 통신 모델이라던지 연산 모델에서는 이게 상당히 쉽습니다. latency정도만 알면 연산하고 latency이후에 결과를 내놓는 형태로 구현되니까요. 그래서 알고리즘, 통신 쪽에서 transaction model이 각광받고 있고, ASIC에서 이쪽 분야가 차지하는 비중을 생각할때 이 모델들이 중요시 되는 것이겠지요. ^^;

추가적으로 검증에서는 어떤 수를 써서라도 추상화 레벨을 높여주는 것이 필요합니다. 왜냐하면, 더 정확한 검증이란 더 많은 검증 벡터를 기존 벡터가 cover하지 못한 부분에 generation해 주어야 하고, 많은 검증 벡터를 주어진 시간안에 수행하여 coverage를 높이기 위해서는 모델이 더 빨라져야 하며, 이를 가장 보장해주는 방법이 추상화 수준을 높이는 것이기 때문입니다.  ^^;

p.s. system verilog의 verification feature(class나 dynamic array, queue같은..)가 지원되는 “저가” simualtor 좋은 거 없나요? ㅎㅎ
