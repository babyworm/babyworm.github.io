---
title: Project Veripage etc…
author: babyworm
type: post
date: 2009-03-09T05:14:33+00:00
categories:
  - 'News on SoC &amp; IP design'
tags:
  - SystemVerilog
  - Verification
  - veripage

---
1.  
Veripage 라는 곳에서 느닷 없이 뉴스레터를 보내왔는데(그동안 왔을 텐데, 스팸 처리 되었을 가능성이 더 높지만..), 거기에 아래와 같은 문제가 있습니다.  
  
다음에서 Z의 값은 어떻게 될까요?  
  
<SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 13px arial; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: collapse; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">bit c, e, o, r, t;  
bit [2:0] v, w;  
bit [5:0] x, y;  
bit [6:0] z;  
  
v = {<<{c,e,r}};  
w = {<<{r,o,c}};  
x = {>>{v,w}};  
y = {<<3{x}};  
z = {>>{y,t}};  
  
  
SystemVerilog를 써 보신 분들은 보신 적이 있으실 streaming concatenation 연산입니다.  
간단히 설명드리면, 병합 연산을 수행하되 << 는 병합 순서에 있어서 right-to-left로, >>는 left-to-right로 병합하라는 연산이지요.  
<<N{}은 N단위로 블록을 잡으라는 의미이구요.  
그다지 쓸일은 없습니다만, 가끔 복잡한 assign문을 적어야 할 때 편합니다.  
저는 합성해야 할 코드는 호환성 문제를 고려해서 verilog95-가끔 2001 문법도 씁니다만-를 사용하고, 이런 귀찮은 assign은 vi의 매크로를 사용합니다만, 검증만 목적으로 하는 모델링에는 편하겠죠.  
  
여하튼, 그래서 답이 어떻게 될까요? ㅎㅎ  
  
  
2.  
Veripage를 오랫만에 가보니 검증 관련 책 추천이 새롭게 많이 되어 있더군요. <http://www.project-veripage.com/books.php>&nbsp;참고해보세요.  
  
3.  
구독하고 있는 blog중에 art.oriented 님의 <A href="http://minjang.egloos.com/2254472" target=_blank>블로그에 올라온 글</A>입니다. (지난번에 alt.oriented 라고 잘못 적는&nbsp; 우를 범했습니다. 다시 한번 죄송합니다. newgroup인줄 알았는지 ^^;)  
  
<SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 12px/19px Verdana; TEXT-TRANSFORM: none; COLOR: rgb(51,51,51); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: separate; TEXT-ALIGN: justify; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">typedef struct tagWHATTHE {  
&nbsp; int &nbsp;&nbsp; data1;  
&nbsp; int &nbsp;&nbsp; data2;  
&nbsp; char &nbsp; data[1];  
} WHATTHE;  
  
</SPAN>여기서 char data[1]의 의미는 무엇일까요?  
정답은 위의 글을 참조하시고..  
  
저도 simulator를 만들때 위와 비슷한 동작이 필요한 경우가 종종(이라고 쓰고 &#8216;많이&#8217;라고 읽는) 있는데, 유용한 테크닉이군요.  
  
참고로 EISC 상에서 disassemble 해보니 다음과 같이 접근합니다.&nbsp; (변수명은 tt, typedef는 test로 했고, malloc은 걍 100 했습니다.) 어떻게 나올지 짐작하는데 대충 도움이 될 것 같아서 올립니다.  
  
test\* tt = (test\*)malloc(sizeof(test)+100);  
c0000046: &nbsp; &nbsp; &nbsp; 70 a8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ldi &nbsp; &nbsp; 0x70 &nbsp;&nbsp; %R8  
c0000048: &nbsp; &nbsp; &nbsp; 4d df &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; jal &nbsp; &nbsp; c00000e4 <_malloc>  
c000004a: &nbsp; &nbsp; &nbsp; 98 e4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; lea &nbsp; &nbsp; ( %R8 &nbsp; &nbsp; ) %R9  
</SPAN><SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 13px arial; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: collapse; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">  
c000004c <.LM3>:  
&nbsp; tt->data1 = sizeof(test) + 100;  
c000004c: &nbsp; &nbsp; &nbsp; 70 a8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ldi &nbsp; &nbsp; 0x70 &nbsp;&nbsp; %R8  
c000004e: &nbsp; &nbsp; &nbsp; 09 18 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; st &nbsp; &nbsp;&nbsp; %R8 &nbsp; &nbsp; , ( %R9&nbsp; + 0x0 )  
  
</SPAN><SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 13px arial; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: collapse; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">c0000050 <.LM4>:  
&nbsp; tt->data2 = 1;  
c0000050: &nbsp; &nbsp; &nbsp; 01 a8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ldi &nbsp; &nbsp; 0x1 &nbsp; &nbsp; %R8  
c0000052: &nbsp; &nbsp; &nbsp; 19 18 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; st &nbsp; &nbsp;&nbsp; %R8 &nbsp; &nbsp; , ( %R9&nbsp; + 0x4 )  
  
</SPAN><SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 13px arial; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: collapse; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">c0000054 <.LM5>:  
&nbsp; for (i = 0; i < 100; i++) {  
c0000054: &nbsp; &nbsp; &nbsp; 00 a0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ldi &nbsp; &nbsp; 0x0 &nbsp; &nbsp; %R0  
c0000056: &nbsp; &nbsp; &nbsp; 89 e4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; lea &nbsp; &nbsp; ( %R9 &nbsp; &nbsp; ) %R8  
c0000058: &nbsp; &nbsp; &nbsp; c8 c8 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; addq &nbsp;&nbsp; 0x8, &nbsp;&nbsp; %R8  
</SPAN><SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 13px arial; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: collapse; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">  
c000005a <.L5>:  
&nbsp; &nbsp; tt->data[i] = i;  
c000005a: &nbsp; &nbsp; &nbsp; 08 30 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; stb &nbsp; &nbsp; %R0 &nbsp; &nbsp; , ( %R8&nbsp; + 0x0 )</SPAN><SPAN class=Apple-style-span style="WORD-SPACING: 0px; FONT: 13px arial; TEXT-TRANSFORM: none; COLOR: rgb(0,0,0); TEXT-INDENT: 0px; WHITE-SPACE: normal; LETTER-SPACING: normal; BORDER-COLLAPSE: collapse; orphans: 2; widows: 2; -webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: 0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0">  
  
ldi은 load immediate, jal 은 call과 동일하고, st는 store, lea는 레지스터간의 move, addq는 add immediate입니다.&nbsp; (stb는 store byte이구요)  
본문에 나왔듯이 캐시 효율로 봐도 이넘이 더 좋을 듯..  
  
  
쓰고나서 덧글) 테터에서 코드 하일라이트 기능이 엉켰는지 짜증 지대로.. ㅠㅠ;</SPAN>