---
title: 프로젝트 관리
author: babyworm
type: post
date: 2006-06-20T14:00:04+00:00
categories:
  - 'SoC &amp; IP design'
tags:
  - 프로젝트

---
원래 프로젝트 관리라는 것이 소프트웨어 공학 부분에서 상당히 중요한 요소였는데, 이제는 하드웨어쪽에서도 소프트웨어 공학적인 프로젝트 관리가 중요시 되고 있다.

2년전인가 PMP(Portable Multimedia Player 가 아니라 Project Mangement Professional이다) 자격증을 취득해볼까 하고 생각했던 적이 있었는데, 당시에 졸업에 바빠서 자격증 취득에까지 다다르지는 못했지만, 여러면에서 많은 도움을 받고 있다.

WBS작성이나 일정 차트 작성 등등에서..

이번에 새롭게 프로젝트를 기획하고 시작하면서, 몇가지 정한것..

1. CVS 사용
&nbsp; 지난 프로젝트에서 사용한 후에 성공적으로 적응되었고, 이제는 사내에서도 전체적으로 사용하고 있다.
&nbsp;지금은 모든 소스코드에 대하여 CVS를 사용하는 건 당연한 것이고, 개인적으로는 문서작업을 LaTeX으로 바꾸면서 문서도 모두 CVS를 사용하고 있다. CVS를 개발한 손에 은총이 있기를~!

2. Bug tracking system
&nbsp; 아직 설정은 안했는데 bugzilla를 사용할 예정이다.

3. Coding Style의 통일 (Lint Tool based)
&nbsp; perl로 만들 예정이다. 예전에 프로젝트에서도 가이드를 했었는데, 전반적으로 성공율은 한 70% 정도랄까..
&nbsp; 자신이 가진 코딩 스타일을 잘 바꾸지 못하는 사람도 있는 법이니..

4. 자동화된 build, checking system
&nbsp; 이건 shell script로..

어제 프로젝트를 kick-off 했는데, 이번에는 지난번 프로젝트의 경험을 살려서 &#8220;제한된 시간안에 요구사항을 완결할 수 있도록&#8221; 잘 해볼 예정이다.