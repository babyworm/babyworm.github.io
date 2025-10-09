---
title: EISC 관련 기사 하나.. TMA2560-RFID/USN용 센서 노드 칩
author: babyworm
type: post
date: 2006-11-07T14:15:18+00:00
categories:
  - Microprocessor
tags:
  - EISC
  - RFID
  - Sensor Node
  - TMA2560
  - USN

---
제가 설계한 건 아니고, 회사의 simple 32비트 {{< wikipedia "EISC" >}}가 들어간 칩인데.. ETRI와 다목적 {{< wikipedia "RFID" >}}/USN 과 같은 {{< wikipedia "wireless sensor network" >}}의 node및 bridge용으로 만들고 있는 칩입니다.  <br>
뭐, 사실상 직접적인 target은 센서 노드쪽에서 가장 많이 사용되는 ATMEGA128L을 노리고 있는 칩이지요.<br>
최종적으로는 RF 부분과 통합 설계가 될 예정인데, 그중에 1차 버젼입니다. 

이거 담당하고 있는 분은 처음에 이 칩 나왔을때 테스트때문에서 회사에서 매일 매일 죽을려고 했었습니다.  ^^;

Digital과 analog가 섞이는 것도 섞이는 것이고, design house도 좀 말썽이고.. 여러가지 머리 아픈 부분이 있어서 말이죠.. 특히 이 칩같은 경우 저전력 하려고 클럭은 기본이고 파워마져 끊고, main die이외에 EEPROM die와 Flash die를 MCP해 놓아서 테스트가 어려워서 정말 고생했지요..

그래도, 이제 동작하고 신문기사까지 나왔으니 고생한 보람이 있네요…^^;<br>
차선임! 수고하셨소~ 

[#M_기사보기|less..|<br>
[전자 엔지니어에서 퍼왔습니다.]<br>
ETRI(<a href="http://www.eetkorea.com/search/keyword.php?keywords=%C7%D1%B1%B9%C0%FC%C0%DA%C5%EB%BD%C5%BF%AC%B1%B8%BF%F8&ACTION_TYPE=SEARCH&operation=PHRASE&search_mod=advanced§ion=ALL&encode=1&sub_form=quickform" target="_blank">한국전자통신연구원</a>)는 USN용 <a href="http://www.eetkorea.com/search/keyword.php?keywords=%B0%ED%BC%BA%B4%C9+%C1%A6%BE%EE%C0%E5%C4%A1&ACTION_TYPE=SEARCH&operation=PHRASE&search_mod=advanced§ion=ALL&encode=1&sub_form=quickform" target="_blank">고성능 제어장치</a>(<a href="http://www.eetkorea.com/search/keyword.php?keywords=MCU&ACTION_TYPE=SEARCH&operation=PHRASE&search_mod=advanced§ion=ALL&encode=1&sub_form=quickform" target="_blank">MCU</a>) 칩 개발에 성공했다고 6일 밝혔다.<img decoding="async" alt="USN용 고성능 제어장치(MCU) 칩" hspace="7" src="https://i0.wp.com/www.eetkorea.com/ARTICLES/2006NOV/2/EEKOL_2006NOV07_STECH_NP_23.JPG?w=625" align="right" data-recalc-dims="1" /> 

이 칩은 기존의 8비트 프로세서 칩 성능을 32비트로 4배 개선시켰고 메모리도 기존 128KB 수준을 256KB 수준으로 2배 업그레이드 한 것이며 어플리케이션도 다양한 응용분야에서 사용가능 하다고 ETRI는 말했다. 또한 이번 개발을 계기로 USN관련 연구개발에 탄력이 붙을 것으로 전망했다. 

기존의 USN 센서노드는 일상생활에서 흔히 볼 수 있는 온도, 습도의 증감, 화재발생 여부 등 단순신호만을 감지하여 전달 처리할 수밖에 없었지만, 이번에 ETRI가 개발한 칩을 센서노드에 적용시키면 영상정보 전달 및 음성신호 감지 처리까지도 가능하다. 이에 따라 복잡한 센싱 데이터를 센서노드에서 가공 처리하여 전달할 수 있어 다양한 USN 응용서비스 제공이 가능한 게 특징이다. 

즉, 응급상황시 비명을 지르면 주변의 센서가 이를 인식, 센서노드에 정보를 전달해 도움을 청할 수 있고 또는 CCTV의 음영지역에서 센서노드의 설치로 위험신호가 감지되면(호루라기(Whistle)를 불면) 가까운 경찰서에 알려줄 수도 있어 ‘안전귀가 서비스’ 등에도 유용하게 활용될 수 있다. 

ETRI는 정보통신부 “RFID/USN용 센서태그 및 센서노드 기술개발” 사업을 통해 에이디칩스와 공동으로 “USN용 고성능 32비트 MCU TMA2560”을 개발하는데 성공했으며, 상용화 시점은 2007년 하반기로 전망했다. 

아울러 내년에는 개발된 프로세서와 통신기능 칩을 하나의 칩으로 즉, SoC(System-on- Chip)화 할 계획이여서 통합 칩의 크기 또한 계속 줄게 될 것이다고 밝혔다. 

ETRI는 11월 7일부터 코엑스에서 개최되는 ‘RFID/USN KOREA 2006’ 국제 전시회 및 컨퍼런스에 TMA2560 및 본 칩을 이용한 위험감지인식과 산업현장 감시제어 응용 서비스를 옥타컴과 태광이엔시와 공동으로 각각 시연해 보일 예정이다. 

_M#]
