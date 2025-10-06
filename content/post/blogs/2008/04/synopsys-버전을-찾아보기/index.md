---
title: Synopsys 버전을 찾아보기..
author: babyworm
type: post
date: 2008-04-11T00:30:35+00:00
url: /archives/763
categories:
  - CAD tools
tags:
  - Design Compiler
  - synopsys

---
Solvnet newsletter으로 보내진 <a href="https://solvnet.synopsys.com/retrieve/021023.html?charid=techupdate&tuid=329" target="_blank">reference script</a>를 보다보니, 세상이 많이 바뀌긴 한거 같습니다. ^^;

<a href="http://www.donny.co.kr/tt/17" target="_blank">Doony님께서도 블로그에 </a>쓰셨습니다만, 저희도 Synopsys의 Design Compiler에 대한 의존도가 높다보니, Reference Methdology에 대하여 관심을 가지지 않을 수 없지요.

Design Compiler를 여러가지 버젼을 혼용하는 환경에서는 하나의 스크립트로 통합하여 사용하는데 어려움을 겪을 수도 있는데요.. (음.. 실제적으로 한 회사내에서 혼용하는 경우는 적겠지만, 저희 같은 경우는 IP 제공이 주된 업무이다보니, 버전을 적게 타는 스크립트를 주로 생각하게 되죠..)

이때는 compatibility\_verion 이라는 synopsys의 내부 변수를 살펴보면 되죠. (printvar compatibility\_verion 하면 현재 구동중인 버전을 알수 있어요. ) 근데 예전에는 이 버전의 형식의 그냥 숫자라서 여러 연산이 가능했는데, 이제는 Y니 A니 SP니 이런 영문자가 들어가서 좀 따지기 귀찮죠.. (여기에 대해서는 밑에)

이 변수를 어떻게 쓰느냐하면, 버전에 따라 지원하는 명령을 바꿀수 있도록 지원하는 거죠.  
예를 들어 shell\_is\_in\_upf\_mode나 shell\_is\_in\_xg\_mode, shell\_is\_in\_topographical\_mode와 같은 환경에 대한 명령은 synopsys version이 올라가면서 추가된 것이라 예전 버젼에서 돌리면 에러가 발생합니다. 뭐, 덤덤히 그냥 지우고 돌리세요 해도 되지만 ^^;

이런 경우에는 다음과 같이 버젼 체크를 통해 간단히 벗어날 수 있지요.. 음.. 더 좋은 방법이 있을수도 있지만, 제가 잘 모르는 관계로.. ㅋㅋ

<pre lang="perl">if {[string match {*2007*} $compatibility_version]} {
        set DC_SUPPORT_UCF        "true"
                set DC_SUPPORT_TOPO_MODE  "true"

} else if {[string match {*2006*} $compatibility_version]} {
        set DC_SUPPORT_UCF "false"
                set DC_SUPPORT_TOPO_MODE "true"
} else {
        set DC_SUPPORT_UCF "false"
                set DC_SUPPORT_TOPO_MODE "false"
}

if { $DC_SUPPORT_TOPO_MODE == "true" } {
        if {[shell_is_in_topographical_mode]} {
                ...

        }

}</pre>

Design Compiler에서 TCL을 지원하면서 여러가지 편해졌습니다. file system 조작도 file 명령어를 쓰면 되고, 문자 대치하는 것도 훨씬 쉬워지고요.. ㅎㅎ<br /><br />여담입니다만, 텍스트 큐브로 업그레이드하면서, 소스 하이라이팅 기능과 박스 넣기가 좀 이상해져서, 이쁜 모양으로 소스코드 보여드리기가 상당히 힘드네요.. 집에서 컴퓨터 만질 시간이 생기면  한번 손을 봐야 겠습니다.