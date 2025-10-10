---
title: PSL을 포함한 새로운 VHDL 표준.. Verilog를 넘을수 있을까?
author: babyworm
type: post
date: 2006-11-16T11:38:27+00:00
categories:
  - SoC
  - IP design
tags:
  - Accellera
  - SystemVerilog
  - Verification
  - verilog HDL
  - VHDL

---
<A href="http://www.eetkorea.com/ART\_8800441907\_480103\_fbe3952720061116\_no.HTM" target=_blank>EEtimes</A>를 보니 VHDL 2006 표준이 <A href="http://www.accellera.org" target=_blank>Accellera</A>에서 승인되어서 IEEE standard 승인을 기다리게 되었다고 합니다.

{{< wikipedia "VHDL" >}}은 제 블로그에서도 몇번 다루었듯이, 초반의 열광적인 지지와는 반대로 설계 언어로서는 Verilog에 비하여 점유율을 높이지 못하고 있었지요. (Gartner Dataquest의 EDA 분석책임자인 Gary Smith 씨에 의하면 오늘날 하이엔드 디자인에서 VHDL 사용이 줄고있다고 합니다. [데이터 출처: <A href="http://www.eetkorea.com/ART\_8800441907\_480103\_fbe3952720061116\_no.HTM" target=_blank>EETimes</A>])

{{< wikipedia "Verilog" >}}의 경우 <A href="https://standards.ieee.org/ieee/1800/7743/" target=_blank>system verilog</A>에서 assertion과 같은 검증 기능과 더불어 몇몇 검증에 관련된 좋은 기능들이 추가 되었으며, verilog 2005 표준에서 system verilog(IEEE-1800)와 기존의 verilog 표준(IEEE-1364 2001)을 합쳐서 IEEE-1364 2005로 개정한 것이지요.

지금 verification guild와 같은 곳을 가보면 verification의 많은 부분이 system verilog 위주로 진행되는 분위기가 감지됩니다. (comp.lang.verilog에서도 그렇구요..)

이러한 verilog의 강공에 대적하기 위해서, VHDL은 assertion language의 표준인 {{< wp PSL >}}(예전에 sugar로 불리웠던)을 VHDL 표준에 과감히 포함시켜 버렸습니다. !

또 다른 주목할 만한 부분은 IP 보호 기능입니다. 사실 이 기능의 경우 verilog에서는 cadence verilog-XL 시절 부터 있었던 기능이지만, tool dependent하기 때문에 약간 문제이기는 했습니다.(verilog simulation에 있어서 verilog-XL이나, NC-verilog와 같은 툴이 거의 표준처럼 사용되고 있는 상황이니 큰 문제는 없겠습니다만..(ESNUG참조))

과연 점점 사용자 계층이 엷어져가는 VHDL이 이번 표준으로 얼마나 사용자를 되 찾아올지 의문입니다.<br>
왜냐하면, Verilog에서는 기본적으로 강력한 구조적 설계 기능에 검증 기능을 더하는 방향으로 확장되고 있는 반면, VHDL은 기본적으로 behavioral design/verification에 (verilog에 비해)적합한 형태였기 때문이지요.<br>
즉, 설계 부분의 편의성에 있어서는 그리 향상된 것이 없어보인다는 것이 좀 아쉽네요..

{{< notice "info" >}}
Systemverilog에 대한 링크는 IEEE SA 링크로 바꾸어두었습니다. eda.org가 accellera 사이트로 바뀌기도 했고..
{{< /notice >}}