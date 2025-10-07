---
title: AMBA 3.0 AXI protocol에 대한 잦은 질문
author: babyworm
type: post
date: 2008-10-14T10:39:43+00:00
ao_post_optimize:
  - 'a:5:{s:16:"ao_post_optimize";s:2:"on";s:19:"ao_post_js_optimize";s:2:"on";s:20:"ao_post_css_optimize";s:2:"on";s:12:"ao_post_ccss";s:2:"on";s:16:"ao_post_lazyload";s:2:"on";}'
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - Amba
  - AXI
  - interconnection network

---
2주 전부터 몸 상태가 메롱메롱한데, 지난주에 그 상태로 IT-SoC 강좌를 하고 왔더니 평상시 보다 더 못한 강의를 하고 와서 멀리 누리꿈 스퀘어까지 찾아주신 분들께 죄송한 마음이 많습니다. 제가 수원 월드컵 경기장 앞에 살고 누리꿈 스퀘어는 상암에 있으니 수원 월드컵 경기장에서 서울 월드컵 경기장까지 이동하고 나면 정신이 하나도 없더군요.

AXI 강좌를 맡아서 하게 된지 벌써 2년인데, 항상 듣는 이야기들 중의 하나가 학교에서 공부하시는 분들께서 AXI 버스 자체, 그리고 peripheral들을 구하기가 어려워서 많은 분들께서 고생하시고 있는 듯 합니다. ARM에서 university program을 운영하고 있는데, 거기에 AXI 관련 RTL이나 model에 대한 지원이 원활하지는 않은가 봅니다. 저희 회사에서도 일종의 university program을 운용 예정인데요. 실은<a href="http://idec.kaist.ac.kr/" target="_blank" rel="noopener">IDEC</a>의 MPW 프로그램과 연계를 통해서 적극적인 운용을 할 예정입니다. AHB based platform/AXI based platform 모두를 가지고 있습니다만, 일단 AHB 기반으로 출발해서 사용자 요구가 있으면 확대할 예정이지요.

아.. 잡설은 이쯤하고 ^^;

AXI 강좌를 할 때 많이 받는 질문들을 좀 정리해보겠습니다.

<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow">
  <p>
    <strong>AXI의 channel이란 무엇이며, 장점이 뭔가요?</strong>
  </p>
</blockquote>

AXI에서 channel은 기존의 protocol에서 양 방향으로 많은 신호가 흐르면서 복잡도가 증가하던 것을 ready 신호 이외의 신호는 한방향(driver-> target)으로 흐르게 해서 전반적인 설계 복잡도를 줄인 것이지요. (신호 자체가 bidirectional이었다는 건 아니니 오해마시길..)

Channel을 채용하여 transaction뿐만 아니라 channel간의 의존성(dependency)도 줄어 들었다는 점이 첫 번째 장점이고, 위의 설계 복잡도를 줄일 수 있었다는 것이 두번째 장점이고, 가장 중요한 장점은 channel에서 valid-ready를 사용하고 있으니, 요청에 대해서 즉시 응답해야 하는 부분이 사라져서 register slicing이 쉬워졌다는 점도 장점이 되죠

<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow">
  <p>
    <strong>AXI 에서 multiple outstanding transaction의 장점이 뭔가요?</strong>
  </p>
</blockquote>

AXI의 가장 큰 장점은 slave에서 자신의 상황에 맞게 처리 순서를 바꾸어 줄 수 있다는 것이 되겠습니다. 즉, 필요에 따라 out-of-order를 할 수 있다는 거죠. 그런데, 이런 처리는 다수의 transaction에 대한 정보가 있어야 하는데요, 이러한 다수의 transaction 정보를 slave로 전달하는 것이 바로 multiple outstanding transaction이라는 보시면 되겠습니다. 다수의 트랜젝션 정보를 미리 보낼 수 있으니 slave가 이 중의 하나를 선택적으로 먼저 처리할 수 있는 거죠.. OK?

(물론, 같은 ID를 가지고 multiple outstanding transaction을 만든 경우에는 in-order로 처리하겠다는 의미이니, response 없이 command를 먼저 보내두는 것에 의미를 두어야 합니다. &#8211; read가 특히 그렇죠)

<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow">
  <p>
    <strong>ID는 왜 사용하나요?</strong>
  </p>
</blockquote>

AXI에서 ID는 실질적으로 interconnection에서 어떤 방식으로 transaction을 다룰지 알려주는 정보이며, transaction의 souce를 나타내는 용도로 사용됩니다. (하나의 master에서 다수의 ID를 발생시키는 경우 virtual channel ID라는 이야기를 사용하는 경우도 있고..). ID가 다른 경우 서로 다른 master(상호 의존성이 없는 혹은 interconnect에서는 의존성을 고려하지 않아도 되는)가 생각해도 크게 다르지 않을 것 같습니다. 보통 interconnect는 내부적으로 ID를 붙이는 rule을 가지고 ID를 확장해가면서 slave에서 master로 어떻게 response를 돌려보낼지 결정합니다. 개인적으로 ID가 존재하므로 AXI는 다양한 형태의 interconnection network을 쉽게 형성할 수 있다고 생각됩니다. (만들기 쉽다는 건 아니구요.)

<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow">
  <p>
    <strong>AMBA 3.0 = AXI 인가요?</strong>
  </p>
</blockquote>

AMBA 3.0에서 AXI가 도입된 건 맞는데, AMBA 3.0은 AXI, AHB lite, APB 3.0을 포괄합니다. AXI의 경우 대역폭을 많이 제공해 줄 수 있는 다양한 형태의 interconnection network (crossbar / bus matrix 형태를 주로 사용하죠..) 에서 상당히 괜찮은 결과를 보여줄 수 있어요.

<blockquote class="wp-block-quote is-layout-flow wp-block-quote-is-layout-flow">
  <p>
    <strong>만들기 어렵나요?</strong>
  </p>
</blockquote>

개인적인 소견으로는 어렵지는 않고 좀 귀찮게 해요.. script로 짜면 많이 편해져요 ^^; 

(추가로..) AXI의 경우 signal이 조금 많아져서 귀찮은 부분이 있는데, channel 덕분에 구현이 어렵지는 않습니다. (system verilog의 경우 interface/struct 등을 쓰면 그나마 좀 편하고)  
위의 script를 쓰면.. 의 의미는 일종의 generator를 만들면 어렵지 않다는 의미입니다. 예전에 이 글을 쓸 당시도 perl로 스크립트를 만들어서 설계했고요.. 다만, interconnect의 형태가 다양해졌으니, interface component를 잘 설계하는 것이 쉽지 않겠죠. (설계 자체는 AHB에 귀찮은 기능들이 있어서 사실 설계가 조금 짜증나고, AXI는 성능을 위해서 잘 만들려면 쉽지는 않겠죠. )  
  
&#8212;-  

p.s 실수 잘하시는 것들 몇개 더.. AXI는 당연히도 input과 output간의 combinatorial feedback이 있으면 안됩니다. 즉, input과 output 신호는 반드시 한번은 f/f을 거쳐야 합니다. reset은 반드시 synchronous deassdert 입니다.
