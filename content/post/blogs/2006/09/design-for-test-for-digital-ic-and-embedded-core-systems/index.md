---
title: Design-For-Test for digital IC and embedded core systems
author: babyworm
type: post
date: 2006-09-06T04:36:00+00:00
categories:
  - 책이야기
tags:
  - DFT
  - SoC Design

---
&nbsp;

&nbsp;

[<img loading="lazy" decoding="async" class="alignnone" title="Design-For-Test For Digital IC's and Embedded Core Systems [Paperback]" src="https://i0.wp.com/ecx.images-amazon.com/images/I/51K5QBX84EL._SL500_AA300_.jpg?resize=300%2C300" alt="" width="300" height="300" data-recalc-dims="1" />][1]

요즘에 반도체 설계에 있어서 가장 중요시되는 것중에 하나는 &#8220;테스트를 고려한 설계(DFT)&#8221;, &#8220;검증을 고려한 설계(DFV: design for verification)&#8221;, &#8220;생산을 고려한 설계(DFM)&#8221;입니다.

DFV는 저 같은 front-end까지를 담당하는 엔지니어에게 중요한 요소입니다.  
원하는 바대로 설계가 되었는지, 그 검증은 얼마나 편하게 되도록 고려되었는지.. 이를 위한 조작들(assertion과 같은)이 수행되었는지..

DFM은 back-end엔지니어에게 중요한 요소라고 봅니다. 이는 대부분 공정에서 fault가 발생할 여지를 얼마나 줄일 수 있느냐에 해당하므로, 설계의 goal을 침해하지 않는 범위에서 최대한 fault가 발생할만한 여지를 줄여주는 것입니다. 최근의 back-end 설계툴들은 이 부분을 모두 갖추고 있습니다.

DFT는 설계된 로직이 fab에서 반도체로 나왔을때 그 공정상에서 발생한 문제(fault)를 알아낼수 있는가 입니다. 이 부분은 front-end엔지니어나 back-end 엔지니어 모두에게 중요한 요소입니다.  
오늘 소개해 드리는 이 책은..(책장수 같네요.) 바로 DFT에 대한 기초적인 사항을 다루고 있는 책입니다.

<span style="color: #333333;">Prentice Hall에서 요즘에 나오는 교재를 위한 시리즈들중의 하나이며, 반도체 회사에 가길 지망하시는데(혹은 종사하시는데) DFT에 대한 기본적인 개념을 잡으실때 상당히 좋습니다. </span>

우선, 그림이 많고 명확하다는 점이 가장 큰 장점입니다.   (그림 만세~!)  
포함하고 있는 내용도 DFT전반에 대한 내용을 모두 다루고 있으므로, 한번 읽어보시면 도움이 될만한 책입니다.

단점은 현재 사기가 어렵다는 점.. 실무적인 툴의 사용이라던지 하는 부분은 빠져 있다는 점입니다.

DFT책중에 (개인적으로는) 추천이 어려운 책도 하나 알려드리죠..

<span style="color: #000000;"><img loading="lazy" decoding="async" class="alignnone" title="Principles of Testing Electronic Systems" src="https://i0.wp.com/ecx.images-amazon.com/images/I/41b3uUH%2BxrL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_AA300_SH20_OU01_.jpg?resize=300%2C300" alt="" width="300" height="300" data-recalc-dims="1" /></span>  
Mourad/Zorian이 쓴 <span class="producttitlebold"><span style="color: #000000;">Principles of Testing Electronic Systems이라는 </span></span>책이며, willy에서 나온 책입니다. (스펙만 보면 상당히 괜찮을 것 같습니다만..)

이 책은 그림이나 내용에 오타가 너무 많습니다. 특히 그림에서 몇몇 wire가 사라져 있어서 한참 봐야 할때가 있었습니다. 중요한 그림에의 오류는 참기 어렵습니다. (예를 들어 boundary scan cell을 설명하면서 serial-in, serial-out을 연결하는 wire가 없다던지..)

사실 전반적인 내용은 어떨지 모르겠습니다. 저의 얄팍한 인내심으로는 책을 덮어야 했으니까요..(반성&#8230;)

&nbsp;

 [1]: http://www.amazon.com/Design-For-Test-Digital-Embedded-Core-Systems/dp/0130848271/ref=sr_1_3?s=books&ie=UTF8&qid=1334505012&sr=1-3