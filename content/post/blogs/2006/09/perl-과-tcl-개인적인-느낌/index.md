---
title: perl 과 tcl.. 개인적인 느낌..
author: babyworm
type: post
date: 2006-09-12T10:15:53+00:00
categories:
  - 'SoC &amp; IP design'
tags:
  - PERL
  - tcl

---
&nbsp;아마도 ASIC 엔지니어,그리고 경력이 좀 된다면 다들 간단한 쉘 프로그래밍이나, perl이나 tcl 정도는 다룰줄 아시리라 생각합니다.

부끄럽게도 저는 정말 간단한 정도의 할 줄 알다가, 1~2년 전부터 TCL을.. 1년전부터 perl을 좀 제대로 쓰고 있습니다. <br>
예전에 했던 TCL은 사실 TK때문에 했던 것이라 상당히 간단한 수준이었고, 요즘에는 synopsys툴을 비롯한 많은 CAD툴에서 TCL 기반의 scripting을 지원하는 관계로 자주 쓰게 되었습니다.<br>
잘쓰던건 아니지만, 예전에 했던 가닥이 있어서 그나마 쉽게 적응했지요.

TCL은 말 그대로 많은 툴에서 지원되고, 툴내에서 프로그래밍에도 편하고, 거기다가 TK라는 강력한 원군의 도움으로 ASIC 엔지니어에게는 이제 &#8220;필수&#8221;언어가 되었다고 생각합니다.<br>
혹, ASIC 엔지니어를 지망하신다면, tcl은 배워두시는 것이 편하실 겁니다.

<img loading="lazy" decoding="async" src="featured_perl.jpg">

perl은 reporting language라는 이름 그대로, 문자 처리에 있어서는 발군!입니다.<br>
사실 예전에는 노가다성 코드를 C로 작성해서 test bech같은것을 만드는 일이 많았는데, 요즘엔 대부분 perl로 처리합니다.<br>
perl에 한번 물들고 나니, 왠만한 작업도 그냥 쉘 프로그래밍 안짜고 perl 기반으로 작업을 하게 된다는 엄청난 중독성이 있더군요.<br>
강력한 정규식의 지원뿐만 아니라 수많은 확장과 간단한 문자열 처리!

설계자들에게는 정말 좋은 언어라고 생각됩니다.<br>
perl과 verilog와의 조합을 위한 여러가지 준비도 <http://www.veripool.com/>에 상당한 수준으로 되어있으므로, 사용하시기에 어려움이 없으실 듯 합니다.

웍에서 perl 가지고 작업하다가.. perl을 찬미하고픈 마음에 갑자기 씁니다.