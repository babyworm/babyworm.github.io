---
title: Verilog 관련 검색에 대한 친절한(?) 답변과 리퍼러 로그..
author: babyworm
type: post
date: 2006-11-10T08:26:03+00:00
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - AMD
  - arm
  - EISC
  - PLI
  - processor
  - tcl/tk
  - verilog HDL
  - 리퍼러 로그
  - 프로세서

---
요즘에 리퍼러 로그를 보니, 검색을 통하여 들어오시는 분들이 상당하시군요..  
(덕분에 gzip 플러그인을 통해 전송량을 절반으로 줄여놨었지만, 다시 트래픽이 차오르고 있습니다. ㅠㅠ; 물론, 많은 분들이 찾아주시는 건 좋은 일이지요.. 이 분야에 관심 있는 분들이 많다는 것이니까요..)

이 포스팅은 리퍼러 로그에 남은 검색어를 통하여 살펴본, 제 블로그에 방문하시는 분들이 관심을 가지는 것에 대한 친절(?)한 답변들입니다. ^^;

**verilog 관련  
** 가장 많은 검색어는 verilog/VHDL 입니다. 요즘에 이걸로 수업받으시는 분들이 많고, 요즘이 term project 철이라서 검색 순위가 급증하고 있는 것이 아닌가 생각합니다. 

*** Verilog와 VHDL중에 어떤것이 더 좋은가..  
** 둘 다 좋은 언어입니다. verilog가 &#8220;설계&#8221;라는 목적에 좀더 부합하고, VHDL이 &#8220;검증&#8221;에 더 편리한 기능을 제공합니다. 개인적으로 생각하기에 verilog가 설계만 따진다면 더 편하다고 생각합니다. 

*** VHDL -> verilog변환, verilog ->VHDL 변환  
** 가끔 뉴스 그룹에서 이거 변환 프로그램 찾으시는 분들도 봤는데, vhdl2v 같은 전용 변환 프로그램이 있기는 합니다만, 시도해보시면 상당한 스트레스를 받을 것이라 생각합니다.&nbsp; ESNUG에 나온 내용을 붙이자면, 잘 안된다! 입니다.

[#M_ESNUG내용보기|less..|<http://www.deepchip.com/items/0386-11.html>  
Hello John,

I&#8217;m scrambling my head over this&#8230;

I am using VHDL-2-Verilog translator by ASC.&nbsp; I could not translate my  
functions from VHDL to Verilog &#8212; they are simply skipped!

My VHDL source code has a package which has some function declarations  
(eg. calculate_lrc(data)) and definitions in it.&nbsp; The problem is when I try  
to convert the package or code from VHDL to Verilog, the functions are  
skipped.&nbsp; So the verilog file just has constants and no &#8220;function&#8221;, as if  
there was no function declaration in the original file.

I tried using -Function_Map option but it would only allow me to keep the  
original function call but the parameters are skipped.&nbsp; Also no function  
conversions.

So does ASC&#8217;s vhdl2v not support function and procedure conversions from  
VHDL to Verilog?

&nbsp; &#8211; Rakesh Mehta  
&nbsp; &nbsp;&nbsp; Nortel Networks  
_M#]

대안으로는 verilog나 vhdl이나 동일한 중간 포맷으로 해석해서 사용하는 툴을 쓰는 건데..  
제가 사용해본 것은 Summit design의 visual HDL로 변환하는 것이었는데, 역시 structural 설계는 잘되는데 약간 behavioral하게 설계된건 잘 안되었습니다. 

만일 동작만 보면되고, 안의 내용은 필요없다! 라고 생각하신다면, synopsys에서 합성한 후에 원하는 format으로 netlist를 출력해서 시뮬레이션에 사용하는 것이 제일 속편합니다. 물론, simulation용 라이브러리를 물어야 하지만 말입니다.  
(뭐, 요즘엔 ncsim이나 modelsim이나 모두 VHDL/Verilog를 single kernel에서 시뮬레이트해서 이런 필요는 없겠지만.. 라이센스 문제가 아닌 이상엔 말이죠..) 

*** verilog에서의 #**  
위의 문법은 원하는 만큼 지연을 발생시키는 것입니다. 합성시에는 무시됩니다.

*** verilog에서의 <=과 = 의 차이**  
blocking assignment와 non-blocking assignment를 혼동하시는 분들이 생각보다 많은데요..(저도 verilog 처음에 잘 몰랐습니다.) blocking assignment는 &#8220;시간이 흐르지 않는 상태(흐르지 않게 block하면서)에서 값이 저장된다&#8221;이구요.. non-blocking assignment는 &#8220;시간이 흐르면서 값이 저장된다&#8221; 입니다.  
즉, 아래와 같은 연속된 assign의 경우 위의 blocking을 사용하였을때 d는 a의 값을 가지게 됩니다. 값의 할당 자체에 시간이 소모되지 않도록 하나의 할당이 끝날때까지 시간을 멈추기 때문입니다&#8230;  
그런데, 밑의 nonblocking 예에서는 &#8220;값을 할당하자&#8221;라는 것은 현 시점에서, 값이 갱신되는 것은 delta delay이후에 이루어지게 됩니다. 왜냐하면, 값이 할당되든 안되든 값을 할당하겠다는 3개의 문장을 모두 보고나서 delta delay이후에 값이 갱신되기 때문이죠. 

<div style="border-right: #cccccc 1px dotted; padding-right: 10px; border-top: #cccccc 1px dotted; padding-left: 10px; padding-bottom: 10px; border-left: #cccccc 1px dotted; padding-top: 10px; border-bottom: #cccccc 1px dotted; background-color: #e7e7e7">
  [CODE]b = a;<br /> c = b;<br /> d = c;<br /> &#8212;<br /> b <= a;<br /> c <= b;<br /> d <= c;[/CODE]
</div>

이해 되시려나요?

*** verilog PLI 관련**  
예전에 계속쓰려다 잠시 중단되었는데, PLI 관련 내용은 요즘에 제 작업 관계로 앞으로 1~2개월동안 자주 올라올 확률이 높습니다. 테스트 벤치 생성 유닛과 scoreboard를 C로 만들고 이걸 verilog PLI로 연결할 예정이거든요..  
기대하셔도 좋을듯..

**다른 검색을 통한 리퍼러 로그.**.  
Design Compiler와 VCS, Modelsim에 대한 검색이 많았습니다.  
사실, 툴에 대해서는 소개나, 새소식만 하고 있어서 별다른 내용이 없었는데 말이죠.. ^^;  
참.. 시뮬레이션 하는 방법은 quick reference guide를 살펴보시면 쉽게 하실 수 있습니다. ^^;

프로세서에 대한 검색으로 들어오신 분들도 많았습니다. intel, AMD, ARM, calmRISC, M-Core, EISC(감사합니다.)  
블로그에 좀더 프로세서에 관련된 좋은 내용을 적을까 싶기도 한데.. 이쪽 분야 하시는 분이 워낙 적어서 누가 관심이 있을까.. 라는 씨니컬한 마음이 될때도 있습니다. ^^;

아.. 특이한것이 virtual UART를 검색해서 들어오신 분이 계시던데..  
제가 이 블로그에서 PLI + TCL/TK를 조합한 virtual UART라는 걸 만든적이 있다고 말씀을 드린적이 있는데, 검색해서 들어오신분은 아마 회사분이 아니실까 생각합니다. 회사분이시라면 인트라넷에 올라간 virtual UART 관련 메뉴얼을 참조하세요.. 소스코드와 작성법이 다 있으니까요..^^;

찾아주신 분들 모두 감사드립니다.<img decoding="async" alt="" src="https://i0.wp.com/babyworm.net/tatter/plugins/emoticons/emoticons/red(86).gif?w=625" data-recalc-dims="1" />