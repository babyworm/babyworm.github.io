---
title: 이런 저런 뉴스 모음
author: babyworm
type: post
date: 2007-06-08T03:48:09+00:00
url: /archives/283
categories:
  - 'News on SoC &amp; IP design'
tags:
  - arm
  - MIPS
  - Tensilica
  - Xtensa

---
전자 엔지니어 뉴스 중 흥미 있는 뉴스 몇 가지..

  


  


  * **시높시스, 스웨덴의 ASIC 프로토타이핑 회사 인수  
** (<A title=http://www.eetkorea.com/ART\_8800467221\_839575\_NT\_77236ec4.HTM?click\_from=RSS href="http://www.eetkorea.com/ART\_8800467221\_839575\_NT\_77236ec4.HTM?click\_from=RSS">http://www.eetkorea.com/ART\_8800467221\_839575\_NT\_77236ec4.HTM?click_from=RSS</A>)  
    FPGA기반의 ASIC 프로토타이핑 회사란 거의 emulation이 아닌가 싶은데.. 여하튼 빠른 coverage를 위해서 도움이 될 것이라 생각합니다. 지난번 synopsys-verification seminar때 emulator관련 회사가 참석한 것도 이런 맥락이 아닌가 생각되구요
  


  * **텐실리카, 서울대 SoC 사업단과 한국과학기술원에 엑스텐사 공급  
** (<A title=http://www.eetkorea.com/ART\_8800467058\_1134551\_NT\_5f5961d4.HTM?click\_from=RSS href="http://www.eetkorea.com/ART\_8800467058\_1134551\_NT\_5f5961d4.HTM?click\_from=RSS">http://www.eetkorea.com/ART\_8800467058\_1134551\_NT\_5f5961d4.HTM?click_from=RSS</A>)  
    텐실리카(Tensilica) Xtensa 프로세서의 선전이 눈부십니다. 🙂 프로세서 하는 입장에서 텐실리카의 방향성은 아주 좋다고 생각하지요. 단지, 저희 회사와 약간 방향이 다르긴 한데.. 이런 기사를 볼때 마다 분발하게 됩니다. 아직까지는 인력이나 방향성이 탄력을 받은 상황이 아니니 비교는 어렵겠습니다만.. 올해부터 향후 3년 동안의 EISC processor를 눈여겨 봐 주십시오 ^^;
  


  * **ARM-LG전자, 2009년 미국 디지털 방송 대비 라이선스 체결  
** (<A title=http://www.eetkorea.com/ART\_8800466903\_480703\_NT\_f5fac31d.HTM?click\_from=RSS href="http://www.eetkorea.com/ART\_8800466903\_480703\_NT\_f5fac31d.HTM?click\_from=RSS">http://www.eetkorea.com/ART\_8800466903\_480703\_NT\_f5fac31d.HTM?click_from=RSS</A>)  
    이 이야기는 선배에게 얼마전에 들었는데, 뉴스화 되었군요. ARM9EJS 프로세서는 상당히 잘 만든 프로세서임에 틀림없습니다. 효과적인 Java지원도 그렇고, 폭 넓은 소프트웨어 지원도 그렇고.. DSP에 있어서는 그리 좋다는 느낌을 받지는 못하고 있는데, 그래도 수많은 3rd party사들이 DSP library를 만들어내고 있으니 아주 부럽죠. 제가 만들고 있는 32bit EISC processor가 ARM9급 시장에 targeting하고 있어서 ARM9EJS와의 benchmark를 가끔해보는데, assembly 코드로 DSP 코딩을 하는 경우(ARM도 assembly로 된 DSP library를 쓰고)에는 동 클럭에서 더 좋게 나오기는 합니다만.. 전반적으로는 ARM9EJS의 클럭 스피드가 높으니, 저희것이 좋다고 할수는 없는 상황이죠. ^^; 국내 업체들의 지원하에 ARM의 시장 지배력이 점차 높아지는 것이 달갑지는 않은 상황입니다. 🙂
  


  * **MIPS, 주목 받는 첨단 IP 코어 발표  
** (<A title=http://www.eetkorea.com/ART\_8800466897\_839585\_NP\_820c116d.HTM?click\_from=RSS href="http://www.eetkorea.com/ART\_8800466897\_839585\_NP\_820c116d.HTM?click\_from=RSS">http://www.eetkorea.com/ART\_8800466897\_839585\_NP\_820c116d.HTM?click_from=RSS</A>)  
    MIPS에서 새로 나온 MIPS74K이야기인데요.. Microprocessor Report에서도 대대적으로 보도하고 있는데, 가장 큰 이유가 dual issue out-of-order superscalar processor라는 점이에요. 사실 superscalar processor가 embedded에 나타난건 예전부터 있었지요(MIPS 사의.. 음.. 기억이 안나는데..4x던가요? 그넘이 한 5년정에 발표된걸로 기억하고, 얼마전에 ARM의 Cortex A8도 있구요).  
    시장은 이제서야 열리는 거 같은데.. 그 동안 in-order형태였는데, 74K는 out-of-order라는 점에서 주목 받는 것이겠습니다. embedded에서 dual issue 이상 가지는 않을 거라 생각해요.. 대부분 benchmark에서 superscalar가 dual issue일때 가장 가격 효율성이 있으니까요.. 🙂