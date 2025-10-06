---
title: multiple port net의 fixing
author: babyworm
type: post
date: 2006-11-02T08:10:41+00:00
url: /archives/161
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - Assign
  - feedthrough net
  - multiple port
  - synopsys
  - 설계
  - 초보

---
오늘은 HDL을 이용해서 설계하시는 초보자 분들께서 많이 실수하시는 feedthrough net 문제에 대해서 이야기하고, 이를 synopsys에서 해결하는 방법에 대해서 간략히 설명하겠습니다. 

HDL을 가지고 예술을 하는 것이 아니라면, 최종적으로 구현에 목적을 두어야 한다는 것은 자명합니다.  
따라서, 합성 도구에서 좀 더 잘 받아들일 수 있는 형태로 코드를 만드는 것이 더 좋은 결과를 보일 것이라는 것도 당연하겠지요.

초보분들중에 설계하실때 module로 필요하지 않은 포트를 무조건 많이 만들어두고, 해당 포트를 다시 (이름만 바꿔서) 출력으로 보내는 경우가 간혹 있습니다. 

예를 들어 별 이유없이 ina를 받고, 이를 outa로 출력하는 것이지요.. 

<div style="border-right: #90e0ff 1px dotted; padding-right: 10px; border-top: #90e0ff 1px dotted; padding-left: 10px; padding-bottom: 10px; border-left: #90e0ff 1px dotted; padding-top: 10px; border-bottom: #90e0ff 1px dotted; background-color: #d2f2ff">
  [CODE]assign outa = ina;[/CODE]
</div>

이런 경우는 (ina가 다른 곳에서 사용되더라도..) 원래 outa라는 출력 자체가 별 의미가 없는 상황입니다. 모듈 외부에서 ina를 연결하면 될테니까요.. 그런데, 간혹 이런 것을 사용하시는 분들이 있습니다.  
이게 왜 문제가 되냐하면, assign문에 의하여 부가적인 로직의 사용없이 전달되는 &#8220;feedthrough net&#8221;의 경우 verilog netlist상에서 assign으로 표현되고, 이는 backend P&R도구에서 대부분 문제를 일으킵니다.  
동일한 이름의 넷이 서로 다른 포트에 붙어있는 경우니까요.

따라서, synopsys design compiler에서는 이러한 것을 해결하기 위해서 multiple port라는 것을 지정하고, 필요한 경우 이를 fix할 수 있도록 하고 있습니다. 

우선 synopsys design compiler에서 multiple port라 정의되는 넘들의 종류는 아래와 같이 2가지 입니다.  
1) feedthrough net (모듈상의 입력이 바로 출력과 연결되는 net. 위의 예입니다.)  
2) multiple port net (logic의 출력이 1개 이상의 출력 포트와 연결되는 net)

이 두 가지 경우 모두 synopsys에서는 netlist를 기록할때 assign문을 이용하게 됩니다.  
그런데, 앞에서 설명하였듯이 backend툴들이 assign문과 동작을 잘 안하는 경우가 많기 때문에, 기본적으로 backend tool과 연동하는 netlist의 경우 assign을 사용하지 말것이 권장되고 있습니다.  
이러한 문제를 없애기 위해서 가장 좋은 방법은 의미 없는 logic을 중간에 삽입하는 것이겠지요..

따라서, 이 경우 set\_fix\_multiple\_port\_nets 라는 컴파일 옵션을 사용하게 됩니다.  
이 옵션에서는 대상을 선택하기 위한 3가지 옵션이 있습니다. 

<div style="border-right: #cccccc 1px solid; padding-right: 10px; border-top: #cccccc 1px solid; padding-left: 10px; padding-bottom: 10px; border-left: #cccccc 1px solid; padding-top: 10px; border-bottom: #cccccc 1px solid; background-color: #e7e7e7">
  [CODE]-feedthrough : feedthrough에 대하여 fix<br /> -outputs : mutipleoutput에 대한 fix<br /> -all : 두 가지 모두 [/CODE]
</div>

그리고, 어떤 방식으로 해결할 것인지 정하는 2가지 옵션이 있습니다. 

<div style="border-right: #cccccc 1px solid; padding-right: 10px; border-top: #cccccc 1px solid; padding-left: 10px; padding-bottom: 10px; border-left: #cccccc 1px solid; padding-top: 10px; border-bottom: #cccccc 1px solid; background-color: #e7e7e7">
  [CODE]-constants : 필요한 경우 logic을 duplicate<br /> -buffer_constants : buffer의 삽입[/CODE]
</div>

따라서 일반적으로는 아래와 같은 명령을 준다면, feedthrough에 대한 문제를 synopsys에서 대부분 해결해 주게되니, 합성 스크립트상에 반드시 추가시킬것을 권장합니다. 

<div style="border-right: #cccccc 1px solid; padding-right: 10px; border-top: #cccccc 1px solid; padding-left: 10px; padding-bottom: 10px; border-left: #cccccc 1px solid; padding-top: 10px; border-bottom: #cccccc 1px solid; background-color: #e7e7e7">
  [CODE]set_fix_multiple_port_nets -all -buffer_constants[/CODE]
</div>