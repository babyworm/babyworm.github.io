---
title: VP8 and WebM
author: babyworm
type: post
date: 2010-05-21T15:14:00+00:00
categories:
  - 'News on SoC &amp; IP design'
tags:
  - CODEC
  - VP6

---
Google에서 발표한 <a href="http://x264dev.multimedia.cx/?p=377" target="_blank">VP8에 대한 분석자료가</a> x264 사이트에 올라와서 읽어봤습니다. 

짧게 이야기하자면 

* H.264 BP나 VC-1보다는 약간 좋아보인다.  
* H.264 HP에는 좀 많이 떨어진다.  
* H.264와 비교하면 H.264 BP에 좀 더 괜찮은 Entropy coder를 장착한 정도로 보인다. (bool coder의 지저분함을 생각하면.. 흠.. 본문에도 나오지만, 구현하기 더럽&#8230;여하튼)  
* 기존에 open되어 있던 Theora나 Dirac 보다는 훨씬 좋다. (Theora의 VP3를 기반으로 나름의 최적화를 한것이므로 당연한 것이겠는데, Dirac은 생각보다 훨씬 안 좋았나보다..)  
* 속도는 끔찍  
* WebM은 실제로 Matroska 컨테이너임.

느낌은 그간 On2에서 H.264보다 훨씬 좋다고 홈페이지에서 자랑하던 것은 역시나 구라였군..
