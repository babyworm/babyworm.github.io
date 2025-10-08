---
title: Perl을 이용해서 검증할때 유용한 팁
author: babyworm
type: post
date: 2007-06-04T14:46:20+00:00
categories:
  - verification
tags:
  - PERL
  - Verification
  - verilog HDL

---
뭐랄까요.. 요즘 이런 저런 일로 바쁘다보니, 사람이 좀 얇팍하게 글을 쓰게되네요. 🙂
(퇴고 없이 그냥 온라인에서 쓰는 글이라 앞뒤가 없을지도 모르겠습니다.)

오늘은 여러분들께서 perl을 이용해서 Verilog HDL을 위한 testbench를 작성할 때 간단히 명령어 해석기를 만들어 사용하는 방법을 알려드리죠.

이 방법은 제가 JTAG을 위한 protocol을 만들다가 생각해낸 방법인데요.. 아주 유용하게 쓰고 있습니다.
얼마전 AXI FileReader와 같은 간단한 명령어 해석기가 필요할 때도 쉽게 적용할 수 있구요.

예를들어, JTAG을 위한 몇몇 명령을 만들고, 이 명령을 이용해서 HDL model을 위한 신호 입력으로 변환시키는 과정을 생각해 봅시다.

1. 필요한 함수를 정합니다.
대충 다음과 같은 함수를 쓸 수 있겠지요?

``` C
rtnval = get_id();
do_intest(serin);
do_extest(serin);
```


2. 해당 함수를 perl에서 subroutine으로 만들어갑니다.
뭐, subroutine을 만드는 방법은 쉽죠?

3. 이 부분이 제일 중요한데요..

```
xxx.pl
```

이런식으로 처리하려면, 중간에 다음과 같은 루틴을 넣어줍니다.

``` perl
do “$ARGV[0]”;
```

위의 한 행은 해당 파일(`$ARGV[0]`)에 지정된 &#8220;perl&#8221; 명령어들을 읽어와서 해석하는 부분입니다.
<br>
즉, 여러분께서 &#8220;filename.input&#8221; 이라는 입력 파일에 앞에서 작성한 subroutine을 &#8220;명령어 사용하듯&#8221; 적어두면, 이것이 perl script에서 읽혀서, &#8220;명령어를 해석하듯&#8221; 동작하게 됩니다.
<br>
이렇게 함으로써, 파싱하는 부분을 생략하고도, 그럴듯하게 명령어 해석기처럼 하나의 perl 스크립트를 만드는 것이 가능합니다.

이제 이러한 perl script에서 어떻게 HDL 테스트 벡터를 만들어내는지 생각해 봅시다.
<br>
간단히 생각할 수 있는 것은 두 가지 인데요.
<br>
첫번째는 ROM file형태로 만들어버리고, verification을 위한 testbench에서는 $readememh()를 써서 읽은 다음에 한 클럭에 하나의 신호 그룹을 뿌리는 방법이구요..
<br>
두번째는 각 subroutine에 printf FOUT 과 같은 file output을 사용해서, 간단한 verilog testvector를 만들어내고, 이를 verification을 위한 testbench에서 ``` `include "xxx" ``` 명령을 이용해서 읽어들이는 방법입니다.

둘 다 간단하죠?

한 마디로, perl을 이용하면 C로는 어렵게 해야 할 일이 아주 아주 편해지는 일이 많습니다. 그래서 verification engineer들에게 perl과 같은 scripting 언어가 사랑받는 것이겠죠.
