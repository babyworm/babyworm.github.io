---
title: DVCON 2016 간략 리뷰
author: babyworm
type: post
date: 2016-03-20T14:06:50+00:00
url: /archives/1927
categories:
  - 'SoC &amp; IP design'
  - verification

---
DVCON2016(<https://dvcon.org/>) 에 다녀왔습니다.

DAC15때 Draft만 적고 publish를 못한 전력이 있어서, 되도록 빨리 쓰고 올릴려고 했습니다만, 쉽지 않았습니다.

DVCON은 처음 다녀왔는데요. 일단 주제가 Verification이라는 부분으로 한정되어 있어서 내용에 대한 집중이 좋았다는 측면에서 DAC보다 괜찮았습니다. (물론, DAC의 경우 설계, 검증, 공정, 소프트웨어를 포괄하는 더 다채로운 행사와 폭넓은 내용을 포괄하고 있습니다만, 실제로 수많은 섹션이 동시에 열리면서 제가 직접 볼 수 있는 건 아주 제한적이라는 점이 안타까웠거든요.)

DVCON2016의 내용은 요약하자면..

일단 UVM을 빼놓고 이야기하기 어렵습니다. 실제 발표된 대부분의 내용이 UVM을 기반으로 설명할 정도로 UVM이 검증 분야에서는 널리퍼졌다는 점과 UVM1.2가 IEEE1800.2으로 들어간다는 점.

두번째로 HLS를 위해서 SystemC synthesizable subset이 정의되고 있다는 점과 생각했던 것보다 HLS의 기반이 커지고 있다는 것.

세번째로 Portable stimulus에 대한 정의가 진행되고 있다는 점. 이건 stimulus를 하나 만들어서 만들때 system firmware, emulation, top level simulation(& &nbsp;subblock level simulation)등의 검증에 적용시킬 수 있었으면 좋겠다는 의도가 있습니다. &nbsp;접근 방법은 별도의 언어를 정의하는 것과 이전에 만들어진 걸 conversion하는 툴을 만드는 방식이 동시에 진행되면서 어떤것이 좋을지 테스트하고 있는 중입니다.

논문 발표의 경우 여러 부분으로 분리되어 진행되었는데, 많은 부분이 UVM의 활용과 개발에 할애되었고, 저도 관심분야라 이쪽 위주로 들어갔습니다. UVM에서 디자인 패턴을 활용하자는 이야기는 그전에도 나왔는데(사실 UVM 자체에서 몇몇 디자인패턴 &#8211; 대표적으로 factory pattern &#8211; 이 이용되었죠), 이를 조금 더 폭넓게 사용할 수 있도록 제안 + 라이브러리가 발표되었습니다 (best paper도 이쪽에서 나왔죠). UVM의 경우 다양한 회사에서 적용 예와 자신들의 필요에 따라 새로운 class를 만들고 개선해서 github에 올리고 공유하는 활동이 이어졌습니다.

이외에 다양한 tutorial과 on-site meeting들이 있었습니다만, 자세히 적기는 그렇고.. 인상적인 것만 이야기하자면..

Software 부분에서는 일반적이라 할 수 있는 TDD와 Design Pattern이 하드웨어 검증 부분에서도 급격하게 도입되고 있다는 점이 볼만합니다. 이쪽 사람들이 하드웨어 + 소프트웨어의 background를 가졌기 때문일 것 같습니다. &nbsp;여튼, TDD를 위해서 unit testing environment (심지어 assertion에대한 unit test framework까지도..) 에 대한 이야기들이 많이 언급되었습니다.

Emulation + formal verification이 simulation을 대체할 수 있을것인가에 대한 패널토론이 있었는데, simulation에 대한 보조적인 방식에 머무를 것이라는 것이 &#8216;모든&#8217; 패널들의 의견이었습니다. 다만 위의 기법이 점차 중요해진다는 점도 동의하기는 했지만, &#8216;여전히 보조적인 수단&#8217;이라는 점은 명확히 하더군요. automatic formal verification app의 성장세도 눈여겨 볼만합니다.&nbsp;

음.. DAC나 DVCON이나 가보면 참 부러운 것이 나이 많으신 어르신 분들과 젋은 친구들이 섞여서 기술적인 이슈에 대해서 비교적 자유롭게 토론한다는 점입니다. 이게 이쪽 업계가 오래 지속된 곳의 특징일 것이고, 우리도 한 20년쯤 지나면 이랬으면 좋겠네요.

&nbsp;