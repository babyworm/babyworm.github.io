---
title: Mentor의 verifiaction seminar
author: babyworm
type: post
date: 2007-05-03T11:36:25+00:00
categories:
  - CAD tools
tags:
  - Mentor
  - 세미나

---
Tool Vendor들의 세미나 계절인지라, Mentor도 검증 관련 세미나를 하는군요. 관심있으신 분은 참고하세요.

행사 일정: 5월 16일/ 임페리얼 펠리스 호텔

행사 등록: <http://mentorkr.com/event/200705/form.html>

<IMG height=322 src="https://i0.wp.com/mentorkr.com/event/200705/main2.gif?resize=600%2C322" width=600 data-recalc-dims="1">  

오늘날의 SoC 디자인은 전체 SoC Verification 플로우 측면에서 최적의 효율성과 능률성을  
가져올 수 있는 솔루션을 필요로 하고 있습니다.  

Mentor Graphics는 ESL(electronic system level design) 및 High-level-synthesis technology, 그리고 Advanced verification platform, Assertion-based verification, DFT 등의 업계 선도적인 verification 솔루션들을 통하여, 디자인 효율 및 생산성을 향상시키기 위한 다양하고  
새로운 기술과 방법론을 데모와 함께 선 보일 예정입니다.  

꼭 참석하셔서 Mentor Graphics의 **  
****최신 Design & Verification 솔루션******들을 만나보시기 바랍니다.  

**행 &nbsp;/사 &nbsp;/일 &nbsp;/정**  

09:30 &#8211; 10:00- 행사 등록  

10:00 &#8211; 10:20- Welcome / Opening; Johnny Chang  

10:20 &#8211; 11:10- ESL &#8211; Embracing the differences is key to design success;&nbsp; Gary Dare  

11:10 &#8211; 12:00- Catapult synthesis &#8211; A Proven Methodology for DSP Hardware Creation; Dan Gardner  

12:00 &#8211; 13:00- Lunch  

13:00 &#8211; 13:50- Advanced Functional Verification Platform; ED&C  

13:50 &#8211; 14:05- Break / Coffee  

14:05 &#8211; 14:55- Finding the toughest bugs with 0-In Verification;Rindert Schutten  

14:55 &#8211; 15:45- From ATPG to Compression and Yield Improvement;T.P.Tai  

****&#8212;&#8212;&#8212;&#8212;&#8212;&#8212;&#8211;****

사실 mentor의 경우 SystemVerilog에 무게를 두고 VMM을 밀고 있는 synopsys나 SystemC에 무게를 두고 있는 cadence에 비하면 약간은 중립적인 입장을 취하고 있는 기분입니다.

실제적으로 [AVM][1](Advanced Verification Methodology)이라고 불리는 Mentor의 Verification Kit은 SystemVerilog와 SystemC를 모두 지원할 수 있도록 되어 있지요. 

문서나 Technical Report/Paper도 비교적 다른 회사에 비하여 얻기 쉽고 말입니다. 오랫만에 갔더니만 AVM Cookbook도 새버젼이 나와 있고, [용어도 잘 정리해서 문서][2]로 만들어놨더군요. 

처음 검증을 시작하시는 분들에게는 참 도움을 많이 주는 회사인건 맞는 것 같습니다. 이제 남은 건 분발 뿐인가요.. ^^;

p.s.  
얼마전 Modelsim SE도 systemVerilog를 지원하신다는 분이 계셨는데, 찾아보니 NCVerilog와 마찬가지로 SystemVerilog Design 부분만 지원하는 것이더군요. 제가 필요한건 SystemVerilog Verification 분야거든요.. Assertion이라던지 모델을 이용해서 작업을 해볼 예정이라.. ^^;&nbsp; 참고적으로, Questa는 SystemVerilog Verification을 지원하는 군요.. 관련 자료는 <A href="http://www.mentor.com/products/fv/abv/questa\_afv/upload/QuestaCompare06-06.pdf" target=\_blank>여기</A> 있습니다.  
툴 구매가 이루어지기 전에는 일단 예전처럼 C++/PLI를 사용하는 방향으로 작업할 예정입니다. 왠지 SystemVerilog관련 verification책은 좀 일찍 산 듯 한 느낌이 ㅠㅠ;

 [1]: http://www.mentor.com/products/fv/_3b715c/
 [2]: http://www.mentor.com/products/fv/upload/fv_glossary.pdf
