---
title: Visual Studio Express 2008에서 OpenGL 사용
author: babyworm
type: post
date: 2009-01-13T10:09:56+00:00
url: /archives/1355
categories:
  - 'SoC &amp; IP design : For beginners'

---
간단한 것이지만, 포맷 할 때마다 까먹는 내용이라서.. 

 

<div>
  <table style="border-collapse:collapse; background: #fbd4b4" border="0">
    <colgroup> <col style="width:637px"/></colgroup> <tr>
      <td style="padding-left: 7px; padding-right: 7px; border-top:  solid black 0.5pt; border-left:  solid black 0.5pt; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt">
        <ol style="margin-left: 38pt">
          <li>
            Freeglut와 GLUT를 받아서 압축을 푼다.
          </li>
          <li>
            모든 h 파일은 C:\Program Files\Microsoft SDKs\Windows\v6.0A\Include 에 복사한다.
          </li>
          <li>
            모든 lib 파일은 C:\Program Files\Microsoft SDKs\Windows\v6.0A\Lib 에 복사한다.
          </li>
          <li>
            모든 dll 파일은 C:\Windows\system32 에 복사한다.
          </li>
        </ol>
      </td>
    </tr>
  </table>
</div>

 

* 당연히 설치되어 있는 Microsoft SDK 버전이나 설치 경로에 따라 디렉토리는 약간씩 다를 수 있다. 

 

OpenVG 관련되서 이런 저런 일을 하다보니 OpenGL을 사용할 일이 많습니다. 참조 구현(reference implementation)이 OpenGL 기반(이라고 하기도 그렇지요. 윈도우 띄우고 점 찍는데만 쓰고 있으니..)이라 관성이 생겨서 계속 쓰게 됩니다. Visual Studio Express는 MS에서 무료로 제공되는 툴이고, OpenGL도 이곳 저곳에 무료 구현이 많이 개발에 필요한 모든 것은 무료로 얻을 수 있지요. 

일단 알고리즘 만들고, 검증차원에서 RI와 같이 돌리면서 이것 저것 헤집고 있는데, OpenVG RI는 일부러 이렇게 만든 것인지 몰라도, 정말 이해하기 쉽게 기본 알고리즘만으로 만들어져서 비효율적입니다. ^^; RI니까 기본적인 알고리즘에 충실하고 결과를 잘 보여주는 것이 목적이었을 테고, 그래서 소기의 목적을 달성한 것이지만, 가끔은 좀 심하다는 생각도 들죠. 혹시라도 이대로 구현하는 분이 있으면 망할 것 같다는 생각. 

이미지 처리 알고리즘도 마찬가지. 

사실 이미지 처리 하드웨어는 많은 회사에서 하고 있기는 한데, 가끔은 알고리즘을 그대로 구현하는 경우가 있습니다. 하드웨어에는 하드웨어에 적합한 알고리즘과 아키텍쳐가 있기 마련인데, 그냥 좋은 알고리즘이니 좋은 하드웨어가 나올 것이라 생각하는 경우가 예상외로 상당히 있습니다(특히 요즘엔, CAD툴들이 좋아져서 behavioral 기술에 아주 가까운 HDL코드도 잘 컴파일을 하니까 이런 경향이 커지는 것이겠지요). 예를 들어 많은 이미지 필터링과 관련 처리가 systolic array같은 간단한 아키텍쳐만 고려해서 알고리즘을 변경하면 상당히 효율적인 경우가 많은데, 프로세서로 처리하듯 연산기를 사용하고, 메모리 접근을 반복하도록 만드는 경우가 생각보다 많습니다. (생각하기야 간단 간단하게 만드는 것이 편하니 이렇게 하는 것이겠지만, 요구되는 메모리 대역폭과 하드웨어 소모를 생각하면 알고리즘을 이해하고 하드웨어로 최적화 할 수 있는 엔지니어를 채용하거나, 알고리즘 작성하시는 분들에게 다양한 하드웨어 아키텍쳐를 이해하도록 하는 것이 필요하겠습니다. 

에구.. 항상 제목과 관계없는 이야기네.. 

 

에.. 엇나간 김에 하나 더.. 괜찮은 무료 음악 사이트… 인디 음악이긴 하지만, 좋은 곡이 많습니다. <http://www.blayer.co.kr/>