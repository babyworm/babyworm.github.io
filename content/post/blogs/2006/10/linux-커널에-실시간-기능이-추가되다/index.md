---
title: Linux 커널에 실시간 기능이 추가되다!
author: babyworm
type: post
date: 2006-10-13T12:56:03+00:00
categories:
  - 'News on SoC &amp; IP design'
tags:
  - Kernel 2.6.18
  - Linux
  - RTOS

---
[[Embedded system]]에서 많이 사용되는 [[RTOS]]들이 있지만, 고성능 기기들에서 요즘에 관심을 끄는 OS는 아무래도 [[Linux]]와 [[WindowsCE]]가 아닌가 싶습니다.

두 가지는 OS는 desktop에서의 탄탄한 지원을 바탕으로 embedded까지 내려왔는데, 사실 real time기능이 약하다는 단점을 지니고 있었습니다.  
linux의 경우 real time기능을 강화하기 위하여 [[RTLinux]]나 [[montavista]]등의 real time kernel patch가 적용된 버젼들이 있었습니다.

Linux Kernel 2.6부터 embedded processor들에 대한 지원 부분이 본격적으로 강화되면서, [[MMU]]없는 Linux도 가능해졌고(기존에 [[uCLinux]]가 있기는 합니다만..), [EETimes][1]에 따르면 이번에 발표된 2.6.18 kernel에서는 real-time feature가 추가되었다고 합니다.  
추가된 real-time feature로는 우선순위가 역전되는 것을 방지해주는 &#8220;priority inheritance&#8221; 지원, 모든 아키텍쳐에 대한 generic interrupt handling layer의 지원이 있다고 하네요..

저희 회사 소프트웨어팀도 바빠지겠군요.

 [1]: http://eetimes.com/news/design/showArticle.jhtml;jsessionid=XYCAM4WFQKIXKQSNDLRSKHSCJUNN2JVN?articleID=193300230