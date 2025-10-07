---
title: Cygwin에서 RXVT를 default terminal로 사용하는 방법
author: babyworm
type: post
date: 2008-11-25T07:17:26+00:00
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - cygwin
  - RXVT

---
매우 간단한데 비교적 많은 분들이 모르는 듯 하여서..(회사 친구들도 제법 모르고..)

-     cygwin 설치시 rxvt를 같이 설치합니다. (뭐, 나중에 setup 에서 추가 설치해도 관계 없습니다.
-     cygwin.bat을 수정한다.


```bat
@echo off
C:
chdir C:\cygwin\bin
set TEXMFCNF=/usr/share/texmf-local/web2c
set CYGWIN=tty
C:\cygwin\bin\rxvt.exe -bg black -fg white -fn *바탕체-*-16-* -mcc -ls -g 100x55 -e bash --login -is
```

-    위의 부분에서 핵심은 &#8211;login 을 사용한다는 것. 폰트는 편한거 골라쓰세요.

rxvt를 현재 디렉토리에서 다시 띄우는 경우에는 .bash_profile에서 다음과 같이 설정하면 된다.

```
alias rxvt=’rxvt -bg black -fg white -fn *바탕체-*-16-* -mcc -ls -g 100×55 -e bash -i’
```


뭐, 위와 같이 별다를 것 없다.

RXVT는 cygwin 기본 터미널보다 유연합니다.. 이런건 많은 이야기가 필요없고, 단지 써보시면 아십니다. ^^;
