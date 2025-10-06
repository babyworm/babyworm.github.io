---
title: 새로운 EISC processor
author: babyworm
type: post
date: 2008-12-06T07:31:19+00:00
url: /archives/1325
categories:
  - Microprocessor
tags:
  - EISC processor
  - 마이크로 프로세서
  - 보도 기사

---
저희 팀에서 이번에 새로 만든 EISC processor인 Empress에 대한 기사가 많이 나오고 있습니다. 단신을 제외하고도 꽤 많이 나왔군요. 

 

<div>
  <table style="border-collapse:collapse; background: #dbe5f1" border="0">
    <colgroup> <col style="width:637px"/></colgroup> <tr>
      <td style="padding-left: 7px; padding-right: 7px; border-top:  solid black 0.5pt; border-left:  solid black 0.5pt; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt">
        <ul style="margin-left: 40pt">
          <li>
            <a href="http://www.dt.co.kr/contents.html?article_no=2008120502011032740002"><span style="font-family:맑은 고딕; font-size:9pt">에이디칩스, 32비트 프로세서 코어 개발</span></a><span style="font-family:맑은 고딕; font-size:9pt"><span style="color:#444444"> [디지털 타임즈:12/5]</span><br /> </span>
          </li>
          <li>
            <a href="http://www.etnews.co.kr/news/detail.html?id=200812040228"><span style="font-family:맑은 고딕; font-size:9pt">에이디칩스, 모바일용 프로세서 코어 개발</span></a><span style="font-family:맑은 고딕; font-size:9pt"><span style="color:black"> [전자신문:12/5]</span><br /> </span>
          </li>
          <li>
            <a href="http://www.etnews.co.kr/news/detail.html?id=200812040067"><span style="font-family:맑은 고딕; font-size:9pt">에이디칩스,32비트 EISC 마이크로 프로세서코어 개발</span></a><span style="font-family:맑은 고딕; font-size:9pt"><span style="color:black"> [전자신문:12/4]</span><br /> </span>
          </li>
          <li>
            <a href="http://www.moneytoday.co.kr/view/mtview.php?type=1&no=2008120411381354940&outlink=1"><span style="font-family:맑은 고딕; font-size:9pt">에이디칩스, 32비트 ESIC칩 코어 개발 완료</span></a><span style="font-family:맑은 고딕; font-size:9pt"><span style="color:#202162"> [머니투데이:12/4]</span><br /> </span>
          </li>
          <li>
            <a href="http://www.moneytoday.co.kr/view/mtview.php?type=1&no=2008120318370437665&outlink=1"><span style="font-family:맑은 고딕; font-size:9pt">에이디칩스, 32비트 프로세서 신기술 개발</span></a><span style="color:#202162; font-family:맑은 고딕; font-size:9pt"> [머니투데이; 12/4]</span>
          </li>
        </ul>
      </td>
    </tr>
  </table>
</div>

 

일단 정말 승질 머리 디러운 팀장의 강력한 태클과 갈굼을 이겨내고 좋은 결과를 거둔 팀원들에게 최고의 찬사를 보내고 싶습니다. 짝짝짝~! (제가 그 팀을 알아서 하는 이야긴데, 제가 그 팀장 밑에 있었으면 아마 회사 때려쳤을 겁니다. ㅋㅋㅋ) 

여하튼, 새로운 프로세서에 많은 관심이 보여지고 있다는 점에서 상당히 기쁘긴 하지만, 대부분의 기사가 속도에 방점을 찍는 관점에서 많이 기술되어 있다는 점은 약간 아쉬운 점이지요. 사실 속도를 높이는데 여러 가지 요인이 있겠지만, 마이크로 아키텍쳐적인 접근을 제외한다면, 가장 중요한 것이 좋은 공정 + 좋은 cell library + 좋은 macro block을 사용하는 것이 중요합니다. 근데, 저희는 그다지 큰 회사가 아닌 관계로 좋은 공정은 물론이요 좋은 cell library(고속 cell library는 따로 비용 청구가 되지요)나 좋은 macro(특히 cache tag에 사용되는 CAM이 아닌 일반 High density single port SRAM을 사용하게 되면 속도차이가 심하죠..)를 사용하는 것이 비용의 문제로 쉽지 않다고 인식하고 있습니다. 따라서, 속도는 마이크로 아키텍쳐에서 할 수 있는 수준까지만 잡아놓자는 것이 저의 일관된 접근 방법입니다. 

이번 Empress 프로세서는 단순한 MHz 단위의 클럭 속도보다는 면적이나 전력 소모를 줄이고, 클럭당 명령어 수를 높일 수 있는 방법, 그리고 자바 언어 가속 기술에 무게를 두고 만든 버전입니다. 그래서, 적은 면적(대략 동급 ARM의 절반 크기)에서 좀더 정교한 분기 예측기와 loop 처리 기법, out-of-order completion 방법, non-blocking cache등의 주요 기술을 저희 프로세서를 위하여 개발하는데 공을 많이 들였습니다. 물론 부족한 부분이 아직 많아서 좀 더 노력해야 할 부분이 많지요. 

보도 자료 상에서도 위의 이야기가 많이 있었는데, 실제적으로는 거의 다루어지지 않아서 좀 아쉽습니다. (기자 분들께서 비 전문가를 위해서 가장 이해하기 쉬운 부분을 발췌하신다는 것은 알고 있습니다만..) 

앞으로도 저희 프로세서는 특별한 일이 없는 이상(예를 들어, 가끔 정말 모르시는 분께서 &#8216;어찌되어도 좋으니 xxxMHz를 맞추어야 한다&#8217;라고 외압을 넣으신다던지..) 단순히 클럭 끌어올리기는 없으며, 1) 명령어 수준의 병렬성과 쓰레드 수준의 병렬성을 찾아가는 방향과 2) 자바와 같이 intermediate language를 이용하는 환경을 가속하는 방향으로 발전할 예정입니다. 

특히 2009년, 자바 언어와 2D 벡터 그래픽은 embedded 분야에서 매우 중요한 명제가 될 것으로 예측하고 있습니다. 그래서, 저희 팀에서는 프로세서의 자바 가속뿐 아니라 2D 벡터 그래픽 분야도 같이 병행하고 있지요. 2009년 요맘때쯤 또 한번 재미있는 소식을 전해 드릴 수 있기를 바라고 있습니다. ^^; 

내년 상반기 중에는 사내에서 사용하고 있는 linux수준의 OS 구동이 가능한 시스템 수준의 시뮬레이터인 ESCAsim(EISC System Cycle Accurate Simulator)의 소스 코드를 좀 정리해서 Open Source로 배포하는 것도 계획 중이며, IDEC과의 작업도 성공적으로 진행 중에 있고, EISC 개발 지원을 위한 Community site도 준비 중에 있습니다. 

사람도 없는데, 참.. 벌이는 일은 많고 해서 걱정이긴 합니다. 어려울 때 한발자국 더 뛰는 사람이 내일을 기약할 수 있을 것이라 믿고, 힘들지만 몸땡이를 더 굴려보렵니다.