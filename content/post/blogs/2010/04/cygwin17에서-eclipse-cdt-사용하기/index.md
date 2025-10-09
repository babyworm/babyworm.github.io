---
title: Cygwin1.7에서 Eclipse CDT 사용하기
author: babyworm
type: post
date: 2010-04-10T10:34:45+00:00
categories:
  - 'SoC & IP design : For beginners'
tags:
  - cdt
  - cygwin
  - Eclipse

---
요즘 뭐 좀 할일이 있어서 깔아 쓰고 있는데요.. 

예전에 eclipse CDT를 사용했을 때는 eclipse따로 CDT를 따로 설치해야 했고, CDT도 멋지기는 했어도 아주 매력적인 툴은 아니었는데, 새로 깔아본 CDT는 그때보다 더 멋진 툴이 되어 있군요.<br>
그런데, 문제는 CDT가 cygwin 1.7버전(요즘 배포되는 windows7 호환 버전이죠.)을 사용하면서 cygwin gcc를 정상적으로 인식하지 못한다는 점입니다.<br>
gcc를 인식하더라도, gdb와 연동에 문제가 생긴다거나 하는 문제도 약간씩 있구요.

지금 공식 배포되고 있는 Eclipse Galileo 버전에 붙는 CDT 6.x 버전은 cygwin 1.7 버전과 여러 가지 문제가 있다는 거죠.  </p> 

이 문제의 해결 방법(?)을 결론적으로 말씀 드리자면,<br>
이 문제는 CDT의 다음버전인 7.x대 버전, 즉 Eclipse Helios버전에 들어가는 CDT에서 해결되어 정상적으로 동작할 것입니다. (아.. 이거 무슨 허무개그도 아니고..) 

여하튼, Helios는 6월에 공개를 목표로 한창 작업이 진행중이죠. 지금 받아 볼 수 있는 버전은 milestone 6 버전(Eclipse Helios M6)입니다. (물론, nightly build도 받을 수 있지만 testing에 문제가 있을 수 있으니 아무래도 milestone 버전을 받는 것이 안전하겠죠) </p> 

Cygwin1.7이 깔려 있는 것을 가정하고 말씀 드리죠. 

<ol style="margin-left: 38pt;">
  <li>
    <a href="http://www.eclipse.org/downloads/">http://www.eclipse.org/downloads/</a> 에서 development build 탭을 선택하시고, <a href="http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/helios/M6/eclipse-cpp-helios-M6-win32.zip">Eclipse IDE for C/C++ Developers (83 MB)</a> 를 선택합니다. (이 링크는 몇 일만 지나도 구 버전을 가르키고 있겠죠. 되도록이면 직접 들어가셔서 최신 버전을 다운로드 받으세요)
  </li>
  <li>
    GDB를 정상적으로 사용하시려면 Eclipse의 RSE를 받으셔야 합니다. (이걸 몰라서 한참 동안 고생했습니다.) <a href="http://download.eclipse.org/dsdp/tm/downloads/drops/R-3.1.2-201002152323/">http://download.eclipse.org/dsdp/tm/downloads/drops/R-3.1.2-201002152323/</a> 요기 들어가면 최신까지는 아니더라도 사용하는데 큰 지장 없는 버전을 받으실 수 있습니다.
  </li>
  <li>
    이제 eclipse의 압축을 푸시고, 같은 디렉토리에서 RSE도 압축을 풀어주세요 (음.. 압축 파일 디렉토리 구조를 보시면 아시겠지만, 둘다 eclipse 부터 시작하는 디렉토리 구조를 가지고 있어서 같은 디렉토리에서 풀어 주면 알아서 적절한 위치로 들어갑니다. )
  </li>
  <li>
    eclipse를 실행시키고 workplace(작업할 디렉토리죠)를 지정하고 실행하면 됩니다.
  </li>
  <li>
    즐기세요
  </li>
</ol>

아주 간단하죠. 

아.. 혹시 cygwin1.dll이 있는 [cygwin설치디렉토리]/bin 디렉토리를 윈도우 환경변수상에 path로 지정하지 않았다면 정상적으로 프로그램을 수행시킬 수 없을 수 있습니다. 되도록이면 환경변수상에 path로 설정하세요. (물론 다른 방법도 있지만.. 흠.. 말하는 것이 더 혼동을 드릴지도) </p> 

참고로 Eclipse Galileo버전에 붙는 CDT 6.x를 cygwin 1.7에서 동작하게 하려면 약간 작업이 필요합니다. 

느낌상으로는 디버깅이 정상적으로 될 때도 있고, 잘 연결이 안될 때도 있더군요.. 여하튼. 

여기에 써 있는 것과 같이 레지스트리에 cygwin의 파일 정보를 써 넣어줍니다. <http://dreamlayers.blogspot.com/2010/01/eclipse-incompatibility-with-cygwin-17.html> . cygwin에서 예전에는 레지스트리를 통해서 파일 위치에 대한 정보를 전달했는데, cygwin 1.7에서는 mount를 이용하는 방법으로 변경되면서 이 레지스트리가 사라졌다고 합니다. CDT에서 이 부분을 못 찾는 거죠.

수행을 위한 방법
  1. 위와 마찬가지로 RSE를 설치하시고 windows에서 eclipse를 수행시키세요. 끝. 가끔(많이?) 디버깅이 안되고 thread가 죽을 때가 있습니다. (저만 그런지도.. )
  2. cygwin상에서 eclipse를 수행시키세요. compile과 debugging이 쉽게 이루어지는데, 중간 중간 귀찮은 일이 생깁니다. 
  1. cygwin상의 directory와 윈도우의 directory 이름이 달라서 디버깅시에 소스를 찾을 수 없는 경우가 있는데, windows->preference->C/C++->Debug->Common Source Lookup Path에 가서 Add Path Mapping에서 /cygdrive/c/ … 이렇게 되어 있는 것을 c:\라고 주시면 됩니다. 
  2. clean이 정상적으로 동작하지 않는데, makefile을 확인해보시면 del로 설정되어 있어서 그렇습니다. 별로 큰 일은 아니니
  3. 가끔 잘 안 될때는 그냥 cygwin console에서 직접 해당 디렉토리에 가서 make해 주면 간단하게 해결되는 경우도 많습니다. 

에고.. cygwin 1.7은 머 그렇게 변한게 많은지 쉽지 않군요. 

cygwin 1.7의 gcc는 exe파일이 아닌 gcc-4.exe를 가르키는 symbolic link죠. 만일 minGW 형태로 컴파일하려면 예전에는 gcc –mno-cygwin 이라는 좋은 옵션이 있었는데, 아직 gcc 4 용 minGW가 없어서 해당 옵션이 정상동작하지 않습니다. cygwin에서 minGW로 컴파일하려는 경우에는 gcc-3 –mno-cygwin 명령을 주셔야 하는 거죠. 

쩝.. 대략 귀찮음
