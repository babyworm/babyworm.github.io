---
title: Coverage와 Assertion
author: babyworm
type: post
date: 2007-04-02T11:51:35+00:00
url: /archives/262
categories:
  - verification
tags:
  - ABV
  - Assertion
  - coverage
  - functional coverage

---
검증에 있어서 고려되어야 하는 사항중에 하나는 &#8220;언제 검증을 그만 둘 것인가&#8221;입니다. 

  


너무나도 쉬운 질문이지요? 뭐, 검증할 부분을 다하면 검증을 그만 두면 되죠. 그럼 질문을 바꿔보겠습니다. &#8220;검증할 부분에 대하여 모두 검증했는지는 어떻게 알지요?&#8221; 

  


그것이 오늘 말씀드릴 coverage에 대한 부분입니다. 

  


사실 이쪽 계통에서 coverage라는 이름으로 검색하면 처음에 나오는 것은 아마도 falut coverage/test coverage일 것입니다. [wp]DFT[/wp]/Testing 부분에서 사용하는 용어인데, 만들어진 test vector가 얼마나 많은 tr. 을 천이시켜 볼 수 있느냐를 나타내는 말이죠(값을 천이시킬 수 있어야지만, stuck-at-0/stuck-at-1 fault를 잡아낼 수 있으니까요). 여하튼.. 이때 test coverage는 입력된 테스트 벡터에 의하여 천이 시킬 수 있는 transistor의 비율을 나타냅니다. 

  


검증에 있어서 coverage도 마찬가지 입니다. 

  


기본적으로 두 가지 coverage는 충족해야 하는데, 아주 기초적인 값이 code coverage, 약간 더 복잡하지만 반드시 체크해야 하는 부분이 functional coverage입니다. 

  


이 중 code coverage는 주어진 RTL 코드 중에 검증 벡터에 의하여 활성화 되는 코드의 비율 정도로, functional coverage는 &#8220;점검해야 할 기능 요소 대비 주어진 벡터로 잡아낼 수 있는 기능 요소의 수&#8221; 정도로 요약 될 수 있습니다. Code coverage는 그나마 좀 자동화하기 쉽습니다. 

  


이미 존재하는 RTL 코드가 시뮬레이션 도중에 사용되는지를 확인하면 되는 문제니까 말입니다. 물론, 여기서 말한 [wp]code coverage[/wp]는 가장 기초적인 line coverage를 의미합니다만&#8230; ^^;  
여하튼, 이 code coverage는 검증에 있어서 가장 기본적인 요소가 됩니다. 적어도 자기가 만든 RTL 코드가 검증 벡터에 의하여 모두 확인되었는지는 알고 지나가야 할 문제니까요. &nbsp;

  


다시 처음 질문으로 돌아가서 &#8220;점검해야 할 기능 요소의 수&#8221;는 어떻게 알수 있겠습니까???&nbsp; 물론, 설계자의 spec안에 있습니다. RTL 코드란 궁극적으로 spec안에 제시된 기능을 구현한 것이니까요. 그런데, 이걸 검증 과정에서 빼놓지 않고 검증 했는지를 알기란 상당히 어렵고, 자동화 대상이 되기 어렵습니다. 그래서 assertion이 등장합니다. 

  


[wp]assertion[/wp]은 software부분에서는 이미 폭넓게 사용되던 개념입니다. 코딩에 있어서는 어떤 가정(이 조건은 절대 들어오지 않는다던지.. 어떤 변수는 어느 구간안에서는 절대 어떤 값을 지니지 않는다던지..)을 하는 경우가 있는데, 이런 가정하지 않은 경우가 온다면 구현된 코드가 &#8220;절대&#8221; 안전 할 수 없으며, 정의되지 않은 동작을 시도하면서 프로그램이 오동작하게 됩니다. 이런 경우를 확실히(assert)&nbsp; 하기 위해서 assertion이라는 것을 사용합니다. 즉, 가정하지 않은 경우가 발생하면 동작 과정에서 &#8220;조용히 버그를 발생시키기보다는 경고 메시지와 함께 끝나자&#8221;는 것입니다. (여기에 대한 주요한 내용은 이 분야의 선구자(?)인 Foster의 &#8220;Assertion-based Design&#8221;이라는 책을 보면 잘 나와 있습니다.) 이 책의 내용을 기반으로 OVA라는 라이브러리도 있고, 실무에서 많이 사용된다고 합니다. [wp]PSL[/wp]/Sugar라는 표준 언어가 제정되기도 했지요. (systemverilog에서는 언어수준에서 assertion이 제공됩니다.)

  


이 assertion 기능을 좀 더 전향적으로 사용하면, spec을 정의할 수도 있습니다. 즉, 어떤 기능에 대하여 assetion으로 지정해 두는 것이지요. 이런 assertion은 테스트 벡터에 의하여 지정된 기능 요소가 검증되었는지 나타내는 기능으로 사용되는 것입니다. 이걸 바꿔 말하면, 주어진 assertion의 수 대비 테스트 벡터에 의하여 점검된 assertion의 수로써 우리가 원하던 &#8220;spec에 정의된 기능을 테스트 벡터가 얼마나 수행하였는지&#8221;를 나타내게 되며, 이는 달리 말하면 functional coverage를 나타내게 됩니다. !!!

  


드디어 전혀 관계 없어 보였던 두 개의 기능이 만나 하나의 art가 되는 순간이죠. ^^;

  


몇 번 적었습니다만, Lint, code coverage, assertion의 개념은 모두 소프트웨어 공학쪽의 개념이었는데, 이제는 하드웨어 설계로 넘어오고 있습니다(사실 다 넘어왔죠..) 참 재미있습니다.