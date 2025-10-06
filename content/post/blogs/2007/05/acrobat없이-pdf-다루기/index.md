---
title: Acrobat없이 pdf 다루기.
author: babyworm
type: post
date: 2007-05-28T11:14:54+00:00
url: /archives/280
categories:
  - 개인적인
tags:
  - PDF
  - PDF 합치기

---
요즘은 많은 회사에서 pdf 파일을 만들어내고 있습니다. 

pdf 생성 프로그램으로 가장 유명한 건 Acrobat인데, 국내 법인이 아주 &#8220;바보&#8221; 같은 관계로 회사에서도 저는 Acrobat을 되도록 사용하지 않고 있습니다.  
Word문서를 Hyperlink가 가능한 PDF로 만들때만 문서 편집용 PC에 깔린 넘을 쓰기는 합니다만, 요즘들어서는 이런 목적으로도 Acrobat을 사용하는 일이 없어져 버렸습니다. 

가장 큰 이유는 저희 팀 내부적으로 LaTeX을 문서화 도구로 사용하면서, 고품질의 PDF 문서를 LaTeX를 통하여 얻을 수 있게 되었다는 점이겠습니다. 

LaTeX의 사용만이 PDF를 얻을 수 있는 방법은 아닙니다.  
Hyperlink가 그리 큰 문제가 되지 않는 파워포인트나, 엑셀의 경우 그냥 프린터에 PS 출력이 가능한 프린터(저는 대부분 Apple LaserWriter 시리즈중의 하나를 선택합니다) 드라이버를 설치하고, 파일로 출력 포트를 지정하여 PS 파일을 얻을 수 있지요. (일반적으로 파일로 출력하면, XXX.prn 형식으로 나오는데 이를 그냥 XXX.ps로 바꾸면 됩니다.)  
여기에 <A href="http://www.cygwin.com/" target=_blank>cygwin</A>을 설치하면 설치되는 ps2pdf 유틸리티를 이용하면, 상당한 수준의 PDF파일을 얻을 수 있지요..

<DIV style="BORDER-RIGHT: #90e0ff 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #90e0ff 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #90e0ff 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #90e0ff 1px dotted; BACKGROUND-COLOR: #d2f2ff">
  ps2pdf xxx.ps
</DIV>

그래도, 가끔 Acrobat이 필요한 경우가 있었는데, 바로 PDF파일을 합칠때 였습니다.  
하지만, 이것도 더 이상 사용하지 않게 되었으니, 바로 <A href="https://www.cs.tcd.ie/Shane.OConchuir/Misc/MergingPDFs.html" target=_blank>gsview32를 이용하여 pdf를 합칠 수 있다는 문서를 </A>보게 되었기 때문입니다.  
<A href="http://www.cs.wisc.edu/~ghost/" target=_blank>ghostscript</A>는 PS파일을 보기 위하여 거의 필수적으로 설치해야 하니, 뭐 다들 설치하셨겠지요.

다음 예는 위의 페이지에서 가지고 온 예제로써, 1.pdf, 2.pdf, 3.pdf를 순서대로 합쳐서 Merged.pdf를 만드는 예입니다. 

<DIV style="BORDER-RIGHT: #90e0ff 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #90e0ff 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #90e0ff 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #90e0ff 1px dotted; BACKGROUND-COLOR: #d2f2ff">
  <FONT face=Courier size=2>gswin32 -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=Merged.pdf -dBATCH 1.pdf 2.pdf 3.pdf</FONT><br />
</DIV>

Acrobat이 점점 멀어지는 군요..  
회사에 와서 &#8220;Acrobat없이 어떻게 PDF를 만드냐! 나는 그런것 들어본적도 없다&#8221;고 무식을 자랑하던 한국 Adobe의 법률 대행사가 기억나는군요..