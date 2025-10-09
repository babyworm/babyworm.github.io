---
title: babyworm의 2008-10-25 북마크
author: babyworm
type: post
date: 2008-10-24T18:01:00+00:00
categories:
  - bookmark

---
- <a href="http://www.govtech.com/gt/421371?id=421371&topic=290174&full=1&story_pg=1" class="blog-margarin-link"><font class="blog-margarin-link-text">Gartner: Top 10 Strategic Technologies for 2009</font></a>
  -  특별한 것은 없지만, 의미가 있기는 합니다.
  -  Virtualization과 Cloud Computing은 당연하고, Servers-Beyond Blades는 특화되고 있는 경향이니 그럴듯 하고, Web-Oriented Architectures와 Enterprise Mashups은 전문 분야가 아니지만, personal computing 영역에서 충분히 검증되었으니 enterprise 영역으로 갈때가 되었고..
  -  Specialized Systems은 응용 분야에 특화된 이종 시스템이 나올 거라는데, 이건 저도 하고 있는 일이지요.
  -  Social Software and Social Networking는 글쎄요. 일단 돈은 되겠지만 약간 퇴조하는 느낌이 있는지라..
  -  Unified Communications은 major player로 몰릴것이라는 이야기인 듯 하고, Business Intelligence이건 의사결정 지원 시스템으로 보이고, Green IT 어찌 보면 지속적인 대세


- <a href="http://www.ibm.com/developerworks/kr/library/au-threadingpython" class="blog-margarin-link"><font class="blog-margarin-link-text">파이썬을 사용한 실전 스레드 프로그래밍</font></a>
  - 파이썬이 GUI 만들기 편하다는 이유로 PLI에서 TCP 서버를 만들고 다중쓰레드 처리를 간혹 하는데, 가끔 OS에 따라 다른 동작을 보일때가 있지요. 도움이 될지도..
- <a href="http://www.ibm.com/developerworks/kr/library/l-threading.html" class="blog-margarin-link"><font class="blog-margarin-link-text">리눅스 스레드 모델 비교: LinuxThreads와 NPTL</font></a>
- <a href="http://www.ibm.com/developerworks/kr/library/dwclm/20081014" class="blog-margarin-link"><font class="blog-margarin-link-text">한국 developerWorks : developerWorks Column : 다양성의 시대는 다시 오는가?</font></a>
  - 아이디어를 많이 제공해 주는 아주 좋은 글입니다. Embedded market혹은 application specific해지면서 다양성이 강조될수 있는 여지가 많아지고 있다는 내용이지요.
- <a href="http://www.eetkorea.com/STATIC/PDF/200810/EEKOL_2008OCT21_ACC_EDA_PL_AN_02.pdf?SOURCES=DOWNLOAD" class="blog-margarin-link"><font class="blog-margarin-link-text">Xilinx White paper: Signal Integrity</font></a>
  - 신호 무결성에 관한 xilinx의 문서.
  -  0.13um 이하를 사용한다면, 신호 무결성 문제에서 자유로울 수 없지요.
  -  FPGA의 경우 신호 무결성 문제와 약간 거리가 있는 걸로 알고 있었는데, xilinx에서 문서가 나온건 좀 의아하죠. 그래도 내용은 잘 정리되어 있어요..(FPGA는 신호 무결성 문제가 별로 없다는 것이 결론이긴 하지만 ^^;)
- <a href="http://www.eetkorea.com/STATIC/PDF/200810/EEKOL_2008OCT20_PL_EMS_AN_03.pdf?SOURCES=DOWNLOAD" class="blog-margarin-link"><font class="blog-margarin-link-text">Get Smart About Reset:Think Local, Not Global</font></a>
  - global reset을 localize하는 방법에 대한 문서.
  - 참고로 그림 7의 asynch reset을 synch reset(실제적으로는 asynch assert, synch deassert reset)으로 바꾸는 회로는 회사에서는 다들 쓰는 건데, 학생들은 잘 모르더군요. 생각보다 중요한 회로입니다.
  - global reset을 P&R에서 잡는 것만 생각했는데, 어찌보면 localize reset이 더 쉬운 접근일지도.. FPGA라 민감한 것이겠지요. ASIC공정에서는 P&R에서 delay tree root에 buffer 삽입해서 잡는 방법을 사용하니까 그다지 민감하진 않습니다.
- <a href="http://www.eetkorea.com/STATIC/PDF/200810/EEKOL_2008OCT20_PL_EMS_AN_02.pdf?SOURCES=DOWNLOAD" class="blog-margarin-link"><font class="blog-margarin-link-text">Slave Serial 혹은 SelectMAP 모드 통한 자일링스 FPGA 배치 위해 마이크로프로세서 사용</font></a>
  - 마이크로 프로세서로 FPGA의 configuration을 하는 방법.. board level에서 reconfiguable block을 만들 때 활용할 수 있을지도.