---
title: Design Compiler의 TNS, WNS..
author: babyworm
type: post
date: 2006-11-08T11:09:31+00:00
categories:
  - CAD tools
tags:
  - constraint
  - Desgin Compiler
  - Optimization
  - synopsys
  - TnS
  - WNS

---
오늘은 지난번 posting에 이어서 front-end 설계 엔지니어에게 있어서 주요 설계 도구중의 하나인 Design Compiler의 constraint 주는 방법에 대해서 Total negative slack과 Worst Negative slack의 관점에서 간략히 설명해 보겠습니다. 

Design compiler는 잘 아시다시피 constraint 기반으로 optimization을 진행합니다.  
즉, 설계를 어떤 방식으로 합성하여 최적화시키는지는 사용자가 해당 모듈에 대하여 원하는 목표치들.. 동작 주파수, 크기를 설정하면 그 값에 맞추어 합성 및 최적화을 진행하게 됩니다. 

만일 constraint가 존재하지 않는 경우, 더 이상 최적화를 진행하지 않고 mapping으로 끝나게 되죠.

**Slack?**  
모든 함성이 끝난 후 지정된 constraint 대비 합성 결과를 비교하여 slack을 나타내게 되는데, 아래 그림처럼 지정된 것보다 일찍 신호가 도착하면 positive slack이라 하지요. 이런 경우 설계자로서는 행복한 순간이니 바로 호프집으로 가서 뒷풀이하면 되겠습니다. 

그 반대의 경우 negative slack이라 하는데, 지정한 constriant을 맞추지 못하는 것입니다.  
따라서, 코드를 바꾸던, 툴이 더 힘을 낼수 있도록 스크립트를 작성하던..더 열심히 최적화를 해봐겠죠.

&#8221;]<img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile27.uf.19502D484D6A7AB309588B.gif?resize=600%2C217" width="600" height="217" alt="" data-recalc-dims="1" />

**TNS와 WNS**  
그럼 오늘의 주제인 TNS와 WNS는 무엇일까요?  
TNS는 total negative slack이라해서, negative slack의 합입니다. 즉, 설계의 모든 net에서 발생한 negative slack을 더한 값이죠. 전반적으로 설계가 어떻다.. 를 의미합니다.  
WNS는 worst negative slack이라해서, negative slack중에 가장 나쁜 값 하나를 이야기합니다. 

이 값들이 어떤 의미를 가지냐 하면, WNS는 나쁘지만 TNS는 그리 나쁘지 않은 경우, WNS만 최적화하면 되기 때문에 front-end에서건, back-end에서건 그 path가 잡힐 확률이 아주 높습니다.  
반대로 WNS는 별로 나쁘지 않지만 TNS가 매우 나쁜 경우, 설계상의 대부분의 path가 worst case에 몰려 있는 상태이므로, 더 이상 최적화와 P&R을 열심히 돌려도 별로 좋아지기 힘들다고 보시면 됩니다. 

**WNS와 TNS의 처리**  
Synopsys DesignCompiler에서 delay를 최적화 시키는 방법은 기본적으로 Worst Negative Slack(WNS)를 하나씩 줄여나가는 방법에 기반을 둡니다. 

즉, 로직을 mapping시키고, negative slack이 발생한 net들을 주욱~ 나열한 후, 그중에 가장 나쁜 넘(WNS)에 해당하는 net을 최적화하고,  
다시 negative slack net을 주욱~ 나열하고, 또 WNS를 최적화하고.. 이런식의 반복입니다.  
단, WNS를 줄이면서 TNS가 늘어나면 안되게 하고 있습니다. 즉, 합성 과정에서 WNS를 줄일 수 있더라도 TNS가 늘어나는 경우라면 synopsys에서 받아들이지 않습니다. 

Synopsys의 기본적인 합성 방법이 이해되시나요?

**TNS도 같이 줄이기**

위의 설명에서 synopsys에서 기본적으로 사용하는 WNS기반의 최적화를 보여드렸는데, 이 경우 전반적인 path가 WNS근처에 몰려 있을 확률이 아주 높습니다. (design_vision이나 primetime에서 histogram으로 확인하실 수 있습니다.)  
즉, 이 말은 앞에 설명하였듯이 나중에 P&R이 아주 귀찮아 진다는 거죠..  
그래서, TNS를 좀더 빡~시게 고려할 수 있는데.. 이것이 바로 오늘 이야기 하려하는 critical_range에 대한&nbsp; 이야기입니다. 우선 문법.

<div style="BORDER-RIGHT: #e38fbc 1px solid; PADDING-RIGHT: 10px; BORDER-TOP: #e38fbc 1px solid; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #e38fbc 1px solid; PADDING-TOP: 10px; BORDER-BOTTOM: #e38fbc 1px solid; BACKGROUND-COLOR: #ffe4f4">
  <textarea name="code" class="c++"><br /> set_critical_range value [design_name]<br /> eg) set_critial_range 0.5 *<br /> </textarea>
</div>

이 명령은 WNS에서 critical range로 지정된 값 이내의 path에 대해서도 같이 optimization을 수행하도록 합니다.  
이렇게 하면 DesignCompiler는

1) 우선 WNS를 줄이려 노력합니다.  
2) WNS줄이기가 끝나면 critical range에 해당하는 path들을 줄이기 위해 노력합니다. 

이 과정에서 WNS보다는 좋지만 여전히 neagtive slack을 발생시키는 net들에 대하여 더 합성을 하게 되는 것입니다. 따라서, 전반적으로 histogram을 보면 slack이 WNS쪽에 몰리지 않고 약간 더 뒤로 이동합니다.  
이는 P&R과정에서 WNS를 해결할 가능성을 높이는 결과는 보여줍니다. 

**Back-End Tools로 hand-off하기..**

지난번에 이야기한 것 처럼, 공정이 미세해지면서 front-end에서 wireload model을 사용하면 합성의 정확성이 떨어지고 P&R과정에서 여러가지로 힘들어집니다.  
따라서, P&R을 좀더 쉽게 진행하려면 front-end에서 약간 더 빡세게 합성해줄 필요가 있습니다.  
(물론, S사나 L사와 같이 back-end team에서 로직 수준까지 바꿔치기 해줄 수 있는 팀이 회사내에 존재한다면 뭐가 걱정이겠습니까? ^^; )

이때 흔히 사용하는 방법이 over constraint입니다.  
즉, 타겟 주파수가 100MHz라면 110MHz에서 돌수 있도록 front-end에서는 합성하는 거죠..  
(물론, back-end design house 잘못 만나면 10% 마진.. 어림도 없습니다..! orz)

over-constraint와 더불어 좋은 방법이 바로 TNS를 줄여서 전달하는 겁니다.  
예를 들어 110MHz에서 sign-off할 것이라면 약 clock period를 8ns정도주고, critical_range를 1ns정도 주는 것이지요.

그럼, 툴은 좀더 노력하지만, 설계보다 constraint가 너무 심하게 들어가 있으니 WNS는 대략 -0.5이상이 발생할 거고.. TNS도 큰 값이 되어 있을 겁니다. 이때 critical range를 지정하면, 많은 path가 더 좋은 delay를 가지게 됩니다. (물론, sign-off시에는 110MHz로 STA해야겠죠?)

이렇게 보내면, P&R과정에서 WNS로 잡혔던 path에 대한 time-driven placement가 별 고민 없이 최적화를 시킬 수 있으므로, design house를 좀 잘못만나도 빠르게 timing closure를 이룰 수 있습니다. 

결론적으로, <del>디자인 하우스를 잘 만나자! (농담입니다.^^;)</del> critial_range를 이용하여 TNS 줄임으로, back-end에서 P&R에 따른 고민을 적게 하는 것이 좋겠습니다. ^^;

<div style="width: 170px" class="wp-caption aligncenter">
  <img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile22.uf.190ECF554D6A7AB306D7BD.gif?resize=160%2C120" width="160" height="120" alt="" data-recalc-dims="1" />
  
  <p class="wp-caption-text">
    역시 뭐든 타이밍을 잘 맞춰야 합니다.
  </p>
</div>
