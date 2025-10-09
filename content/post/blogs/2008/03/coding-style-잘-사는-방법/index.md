---
title: Coding style; 잘 사는 방법
author: babyworm
type: post
date: 2008-03-17T14:01:24+00:00
categories:
  - 'SoC & IP design : For beginners'
tags:
  - Coding Guideline
  - coding style
  - RMM

---
예전에 C 언어를 한참 할때, 코딩스타일이란 이야기를 처음 들었었습니다. K&R style이라느니, ansi style이라느니.. 그런 것이지요. indent를 2를 써야 한다.. 아니다 4를 써야 한다 등등도 있었구요.<br>
Windows API에 와서는 이게 좀 더 복잡해져서 hungarian 표기법이 등장했습니다.<br>
그런데, Verilog HDL에서는 이 Coding Style이라는 것이 아주 중요한 요소로 등장하고 있지요.

코딩 스타일이란 쉽게 이야기하자면, 어떤 설계를 하고자 할때, 혹은 어떤 표현을 하고자 할때 사용할 수 있는 방법이 여러가지가 있겠지만, 이런 형태로 표현 하는 것이 어떠냐~ 라는 식의 일종의 가이드입니다.<br>
HDL에서는 FSM에서 one-hot을 표현하는 방법이라던지, mux를 합성하는 방법이라던지와 같은 <span style="font-weight: bold;">언어적인 특성을 잘 표현하기 위한 가이드</span>도 있고, negative edge신호는 n으로 끝나고, 플립플롭의 출력은 _r로 끝난다는 등의 <span style="font-weight: bold;">이름 정하기 규칙(네이밍 룰)</span>, 그 이외에 indent(들여쓰기)는 tab이 아닌 2칸의 공백 문자로 한다는 등등일 <span style="font-weight: bold;">일반적인 가이드</span>를 포함합니다. 

HDL에서 코딩 스타일이 중요한 이유는 <a href="http://babyworm.net/tatter/93" target="_blank">여기</a>에서도 간단히 말씀드렸습니다만, 생각하면서 따져나가야 하는 약간은 미묘한 문제들을 쉽게 (머리쓰지 않고 기계적으로.. 혹은 습관적으로) 해결할 수 있는 방법이 되는 경우가 많기 때문입니다. 또한, HDL의 경우 궁극적으로 “하드웨어를 만들기 위한 언어”이므로, 어떤 방식으로 기술하는 것이 로직 합성기에서 가장 잘 이해하도록 만들어서 원하는 하드웨어의 형태로 가장 효과적으로 만들어질 수 있도록 잘 기술하는 것이 필요한 것이지요.

대부분의 문제는 좋은 코딩스타일로 해결 가능합니다. 그리고, 코딩 스타일과 코딩 가이드를 적절히 조합한 문서가 제 블로그에서 <a href="http://babyworm.net/tatter/43" target="_blank">몇번 소개해 드린바 있는</a> Reuse Methodology Manual 입니다. 

하지만, 가끔은 코딩 스타일로 부족할 때가 있지요. 이럴 때 보통 synthesis directive를 줍니다.<br>
synopsys툴은 ‘//synopsys 어쩌구’.. synplify는 ‘//synthesis’ 로 시작되고, verilog 2001에서는 이 synthesis directive주는 방법이 통일 되었지요.. 그래도 저는 synopsys를 사용할 때 //synopsys 어쩌구를 계속 사용하고 있습니다..  ^^;

가장 유명한 synthesis directive는 바로 <a href="http://www.donny.co.kr/tt/6" target="_blank">Donny님의 posting</a>에 나온 SNUG99논문(Sunburst의 Cumming씨 논문으로 기억되는데요..Cumming씨의 SNUG논문들은 synopsys툴을 이용해서 verilog를 사용하시는 분들에게 아주 좋은 아이디어를 많이 제공해 줍니다. – 설계적인 측면이 아니라 코딩의 기술적인 측면에서 말이지요)에서 언급된 case문을 지배하는 evil twins이지요.<br>
case문에서 parallel case는 MUX와 같이 priority가 없는 로직을 만드는 순서 없는 case를 만들어 낼 때 사용이 되고, full case는 그야 말로 fully covered case를 나타내지요.. 근데, 좋은 약도 남용하면 독이 되듯, 이 좋아보이는 synthesis directive도 잘 알지 못하고 쓰면 오히려 독이 되어 불필요한 latch를 만들 수도 있는 법이지요. 자세한 것은 도니님이 남겨주신 문서를 참조하세요. ^^;

제가 회사에서 강조하고 있는 건, “합성시에 case문에 대한 분석이 auto로 나오도록 만들 것입니다.”<br>
auto 로 나온다는 것은 코딩 자체에서 “parallel case”혹은 “full case”를 cover 하고 있다는 의미이거든요. 즉, one-hot FSM과 같이 특별한 케이스로 directive의 사용을 제한하고 있지요. 

이런 코딩 스타일은 궁극적으로 설계자들에게 불필요한 고민을 줄여주어, 1분이라도 시간을 더 확보하게 함으로써 삶의 질을 높일 수 있는 기회가 될 수 있겠습니다. (혼자만의 논리적 비약일까요?)<br>
귀찮고, 당연한 이야기 같더라도 코딩 스타일.. 꼭 숙지하세요. 

p.s. 여담인데, 저의 경우 excel도 훌륭한 코딩 툴로 사용됩니다. 약간 복잡한 case를 다룰때 말이죠 ㅎㅎ, csv format으로 뽑아내는 재미가 쏠쏠하죠.
