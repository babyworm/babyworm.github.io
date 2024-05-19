---
title: '[verilog] wire와 reg'
author: babyworm
type: post
date: 2006-09-13T15:17:14+00:00
url: /archives/72
categories:
  - 'SoC &amp; IP design'
tags:
  - reg
  - RMM
  - verilog HDL
  - wire

---
예전에는 verilog동호회니 asic동호회니 나름대로 활발히 활동했었는데, 점점 숙제도와주기 동호회가 되가서 잘 안가게 되었습니다.

정말 오랫만에 오늘 verilog동호회에 갔는데, 위의 질문이 있더군요. 저 질문은 제가 대답한 것만 한 3번 정도이고.. 자세히 정리해서 쓴적도 한번 있을 정도로 verilog를 배우시는 분들에게 있어서 이해가 어려운 부분이듯 합니다. (이제와서야 이렇게 이야기하지만, 되집어 생각해보면 저도 처음 배울때 위의 것의 차이를 잘 몰랐던것 같구요.)

사실 verilog라는 언어자체보다는 설계가 우선인 것이고, verilog는 도구에 불과하지만, 도구를 잘 아는 것도 많은 도움이 되는 것이 사실입니다. 또한, verilog의 timing 정의라던지 신호의 driving에 대해서 어느정도 명확히 이해하면 PLI programming으로 좀 정교한 모델을 만들때 크게 도움이 됩니다.  
저 역시도 프로세서 모델의 PLI모델을 만들면서 많은 부분을 좀더 정확히 알게 되었으니까요..

여하튼. 오늘 이야기 할 부분은 바로 wire와 reg, 정확히 이야기하자면 net과 reg라고 부르는 것이 더 맞을 듯 합니다.

우선, verilog를 정의하고 있는 IEEE 1364-2001 표준을 보면 net에 대해서(특히 wire에 대해서)는 다음과 같이 기술하고 있습니다.

> **_The wire and tri nets connect elements._** The net types wire and tri shall be identical in their syntax and functions; two names are provided so that the name of a net can indicate the purpose of the net in that model.** _A wire net can be used for nets that are driven by a single gate or continuous assignment._** The tri net type can be used where multiple drivers drive a net.

위에서는 wire와 tri를 기술하고 있는데, 우리의 주된 관심은 wire이므로 이쪽만 살펴보죠.. (사실 tri는 tri-state wire를 기술하고 있는 것으로 속성상 wire와 같습니다. 단, multiple-driver가 허용된다는 것만 다르죠. 혹시 driver가 신호를 보내주는 요소, 즉 게이트 출력, tr의 출력 같은 넘이라는 건 다 아시죠?)  
wire는 기본적으로 &#8220;연결&#8221;을 위한 요소입니다. 그리고, 이것은 단일 게이트 혹은 continuous assignment의 출력을 연결하기 위한 목적으로 사용됩니다.  
continous assignment로 대표적인 것이 assign문이므로 다음과 같이 여러분이 일상적으로 쓰는 구문이 가능한 것입니다.

<pre lang="verilog">wire out = a & b & c & d;</pre>

이 문장이 다음과 같은 문장이라는 건 아시죠?

<pre lang="verilog">wire out;
assign out = a & b & c & d</pre>

보통 이런식의 문장에서 wire가 가능한 것입니다. wire는 개념적으로 &#8220;<span style="color: #ff0000;">선을 연결한다</span>&#8220;라고 생각하십시요.  
출력포트에 어떤 표현식의 출력을 <span style="color: #ff0000;">연결</span>할때 사용되는 것 처럼요..

이제 reg에 대해 알아봅시다. 역시 표준 문서의 정의를 먼저 보겠습니다.

> _Assignments to a reg are made by procedural assignments (see 6.2 and 9.2). Since the reg holds a value between assignments, it can be used to model hardware registers. Edge-sensitive (i.e., flip-flops) and level sensitive (i.e., RS and transparent latches) storage elements can be modeled. A reg needs not represent a hardware storage element since it can also be used to represent combinatorial logic._

위의 정의에 따르면, reg는 procedural assignment(절차적 assignment는 소위 always begin.. end, initial begin.. end사이에 사용되는 모든 표현식으로 생각하십시요..)에 의하여 assign되는 요소입니다. 또한, assign사이에 값을 저장할 수 있습니다. <span style="color: #ff0000;"><strong>이런 속성을 이용해서 flip-flop이나 latch를 만들수 있다고 되어 있습니다</strong></span>. 많은 초보자분들이 헷깔리시는 부분이 바로 이 속성때문일 것입니다. 보통 플립플롭 즉, 순차 회로를 만들때 reg문을 많이 사용하다보니, 많은 분들이 reg문을 사용하면 register(즉 플립플롭)이 생성될 것이라는 생각을 가지고 있습니다.  
하지만, 표준의 마지막 문장에서 이건 절대 아니라고 명시하고 있으며, 실제로도 그렇습니다.  
그래서, &#8216;reg는 register가 나오는 것이다&#8217;라고 생각하시는 많은 분들이 &#8216;reg이면 register가 나와야 하는건데.. 왜 안나오지? 그럼 wire랑 뭐가 다른거야?&#8217; 라는 궁금증을 가지십니다.

이제부터 차근 차근 설명 드리지요..

procedural assignment를 수행하는 과정(begin에서부터 end까지)에서 이 값은 임시로 보관 될 수 있습니다.  
비유를 하자면 reg문은 그릇같은 것이라 할수 있습니다. 입력이 들어오면 그걸 가지고 생성된 임시값을 일단 그릇에 담습니다. 그리고, 어떤 경우에던지간에  입력에 의하여 결과의 변화를 end문을 만나기 전까지 기술할 수 있다면, 그건 더 이상 그릇에 담을 필요가 없이 최종결과로 보고 쏟아버리면 됩니다.  
이런 경우는 reg문장이 더이상 그릇의 형태를 지닐 필요가 없겠습니다.  
따라서, storage element로 구현되지 않습니다. 과거를 기억할 필요가 없으니까요..

<pre lang="verilog">always @(a or b or x) begin
  if (a == b) out = 1'b0;
  else if (x) out = 1'b1;
  else         out = 1'b0;
end</pre>

이 예에서는 모든 가능한 경우에 대해서 출력이 정의되어 있지요? 그래서, 이 예의 문장은 조합회로로 구현됩니다.

하지만, 입력에 따라서 그 결과의 변화를 나타낼 수 없는 경우가 생긴다면, 이전에 내가 가지고 있던..즉, 예전에 그릇안에 있던 값이 유지되어야 할 조건이 되는 것이므로, reg는 그릇의 형태를 가지고 예전에 결과를 담을 수 있어야 합니다.  
이 경우에, reg는 storage element로 구현됩니다. 과거를 알아야 하니까요..

<pre lang="verilog">always @(a or b or x) begin
  if (a == b) out = 1'b0;
  else if (x) out = 1'b1;
end</pre>

위의 예에서 위의 경우에서 if문이나 else if에 만족 하지 않으면, 예전 값을 그대로 가져 가겠다는 거죠? 그래서, 과거의 값을 기억할 필요성이 생겼습니다. 그래서 저장장치인 래치로 구현됩니다.

<pre lang="verilog">always @(posedge clk or negedge rst_x)  begin
  if (!rst_x) a = 1'b0;
  else a = in;
end</pre>

이 코드는 언듯 입력에 대한 모든 경우가 표시된 것 같습니다만.. always문에서 clk의 상승엣지 혹은 rst_x의 하강엣지까지 &#8220;기다려&#8221;라고 선언했기 때문에 입력에 따른 변화값이 &#8220;기억되어야 합니다&#8221;. 그래서 기억할 필요성으로 인하여 저장장치(플립플롭)로 구현됩니다.

요약하자면,  
1) reg가 과거값을 알아야 할 경우가 생긴다면(입력에 의한 출력이 모두 기술되지 않거나, 특정 입력을 기다려야 하는 경우), reg는 storage element로 구현된다.  
2) reg가 과거값을 알아야 할 경우가 없다면, 일반적인 combinational logic으로 구현된다.

이해가 가시런지요?

두번째 요약!

1) **wire**는 net 형식이다. net 형식은 연결을 위한 요소이다. wire는 continous assignment(_assign_)에 의하여 assign될 수 있다.  
2) reg는 그 자체로 reg 형식이다. reg는 procedural assignment(_always begin.. end_)에 의하여 assign 될 수 있다. reg는 잠깐동안 값을 보관할 **수도** 있다. (보관이 필요없으면 combinational logic으로, 보관이 필요하면 storage element를 포함하는 logic으로 구현된다)

이렇습니다.  
초보분들께 도움이 되셨으면 좋겠습니다.

p.s.  
ASIC으로 밥먹고 사는 저도 verilog에 대해 속속들이 다알고 쓰는것은 아닙니다. 권장할 만한 사항도 아니구요(필요한 정도만 속속들이 알아야죠..).. 어짜피 verilog 자체로 ART를 하는 것도 아니고, 최종적으로 회로가 나와야 하는데, 일정 수준 이상의 문법은 CAD툴에서 안전하지 못하거든요..

그래서, verlog HDL에서는 coding style이라는 guide line이 있습니다.  
말하자면, 이런 경우에는 이렇게 쓰면 좋다. 이런 문장은 왠만하면 쓰지 말아라.. 뭐 이런 지침 같은 것입니다. 가장 유명한 책이 바로 아래의 RMM이라는 책인데, 이쪽 계통을 지망하시는 분께는 아마도 &#8220;필독서&#8221;가 아닐까 생각합니다. 개인적으로 공부삼아 번역도 좀 해본적이 있고.. (실제로는 귀찮아서 번역은 하다 말았고, 정독한번 잘했다~ 정도로 생각하고 있습니다.)

[<img loading="lazy" decoding="async" class="alignnone" title="Reuse Methodology Manual for System-on-a-Chip Designs" src="https://i0.wp.com/ecx.images-amazon.com/images/I/41JE3t%2BAoLL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg?resize=300%2C300" alt="" width="300" height="300" data-recalc-dims="1" />][1]

하다보니, 겸사 겸사 책 소개도 되었군요.. 나중에 기회되면 RMM에 대해서는 좀더 자세히 소개해 드릴 기회가 있겠지요.

 [1]: http://www.amazon.com/Reuse-Methodology-Manual-System--Designs/dp/0387740988/ref=sr_1_1?s=books&ie=UTF8&qid=1334505770&sr=1-1