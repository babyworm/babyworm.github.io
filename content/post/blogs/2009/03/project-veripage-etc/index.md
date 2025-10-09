---
title: Project Veripage etc…
author: babyworm
type: post
date: 2009-03-09T05:14:33+00:00
categories:
  - 'News on SoC & IP design'
tags:
  - SystemVerilog
  - Verification
  - veripage

---

## Quiz
Veripage 라는 곳에서 느닷 없이 뉴스레터를 보내왔는데(그동안 왔을 텐데, 스팸 처리 되었을 가능성이 더 높지만..), 거기에 아래와 같은 문제가 있습니다.

다음에서 Z의 값은 어떻게 될까요?

```verilog
bit c, e, o, r, t;
bit [2:0] v, w;
bit [5:0] x, y;
bit [6:0] z;

v = {<<{c,e,r}};
w = {<<{r,o,c}};
x = {>>{v,w}};
y = {<<3{x}};
z = {>>{y,t}};
```

SystemVerilog를 써 보신 분들은 보신 적이 있으실 streaming concatenation 연산입니다. <br>
간단히 설명드리면, 병합 연산을 수행하되 << 는 병합 순서에 있어서 right-to-left로, >>는 left-to-right로 병합하라는 연산이지요. <br>
`<<N{}`은 N단위로 블록을 잡으라는 의미이구요.

그다지 쓸일은 없습니다만, 가끔 복잡한 assign문을 적어야 할 때 편합니다.<br>
저는 합성해야 할 코드는 호환성 문제를 고려해서 verilog95-가끔 2001 문법도 씁니다만-를 사용하고, 이런 귀찮은 assign은 vi의 매크로를 사용합니다만, 검증만 목적으로 하는 모델링에는 편하겠죠.

여하튼, 그래서 답이 어떻게 될까요? ㅎㅎ

## Veripool Books
Veripage를 오랫만에 가보니 검증 관련 책 추천이 새롭게 많이 되어 있더군요. <http://www.project-veripage.com/books.php> 참고해보세요.

## Quiz2
구독하고 있는 blog중에 art.oriented 님의 <A href="http://minjang.egloos.com/2254472" target=_blank>블로그에 올라온 글</A>입니다. (지난번에 alt.oriented 라고 잘못 적는  우를 범했습니다. 다시 한번 죄송합니다. newgroup인줄 알았는지 ^^;)

```C
typedef struct tagWHATTHE {
  int   data1;
  int   data2;
  char  data[1];
} WHATTHE;
```

여기서 char data[1]의 의미는 무엇일까요?
정답은 위의 글을 참조하시고..

저도 simulator를 만들때 위와 비슷한 동작이 필요한 경우가 종종(이라고 쓰고 ‘많이’라고 읽는) 있는데, 유용한 테크닉이군요.

참고로 EISC 상에서 disassemble 해보니 다음과 같이 접근합니다.  (변수명은 tt, typedef는 test로 했고, malloc은 걍 100 했습니다.) 어떻게 나올지 짐작하는데 대충 도움이 될 것 같아서 올립니다.

```
          test* tt = (test*)malloc(sizeof(test)+100);
          c0000046:       70 a8           ldi     0x70    %R8
          c0000048:       4d df           jal     c00000e4
<_malloc> c000004a:       98 e4           lea     ( %R8     ) %R9

          c000004c <.LM3>:   tt->data1 = sizeof(test) + 100;
          c000004c:       70 a8           ldi     0x70    %R8
          c000004e:       09 18           st      %R8     , ( %R9  + 0x0 )

          c0000050 <.LM4>:   tt->data2 = 1;
          c0000050:       01 a8           ldi     0x1     %R8
          c0000052:       19 18           st      %R8     , ( %R9  + 0x4 )

          c0000054 <.LM5>:   for (i = 0; i < 100; i++) {
          c0000054:       00 a0           ldi     0x0     %R0
          c0000056:       89 e4           lea     ( %R9     ) %R8
          c0000058:       c8 c8           addq    0x8,    %R8
          c000005a <.L5>:     tt->data[i] = i;
          c000005a:       08 30           stb     %R0     , ( %R8  + 0x0 )
```

ldi은 load immediate, jal 은 call과 동일하고, st는 store, lea는 레지스터간의 move, addq는 add immediate입니다.  (stb는 store byte이구요)
<br>
본문에 나왔듯이 캐시 효율로 봐도 이넘이 더 좋을 듯..

쓰고나서 덧글) 테터에서 코드 하일라이트 기능이 엉켰는지 짜증 지대로.. ㅠㅠ;

다시 덧글) Markdown으로 바꾸고 속이 싸악..
