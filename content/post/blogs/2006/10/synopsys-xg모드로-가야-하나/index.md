---
title: Synopsys XG모드로 가야 하나..
author: babyworm
type: post
date: 2006-10-31T14:20:12+00:00
url: /archives/156
categories:
  - CAD tools
tags:
  - Design Compiler
  - DFT compiler
  - synopsys
  - XG mode

---
사실 logic synthesis에 있어서 synopsys design compiler가 가지고 있는 비중은 정말로 큽니다.

ASIC designer가 거치는 전체 설계 flow에서 logic synthesis는 어찌보면 implementation의 시작지점이기 때문에 아주 중요합니다.  
거기서 만들어진 netlist의 질, 지정된 constraint들이 이후의 툴들에 얼마나 효과적으로 반영될 수 있는가.. 등등..

Synopsys가 design compiler라는 툴로, 이 logic synthesis를 잡아버리면서 (90%이상의 점유율이랍니다.. 완전 독점에 가깝지요..), 이 강력한 파급력으로 DFT, Floorplan, P&R까지 이전의 강자들을 무너트리고 있는 상태입니다.

물론, 다른 회사들도 이 황금어장을 그냥 놓아둘수 없었던지, cadence는 build gates라는 툴로, mentor는 percision으로, synplicity는 synplify AISC으로 대항하고 있지만.. 흠.. 안타깝게 아성은 무너지지 않고 있으며 오히려 더 견고해지고 있는 느낌입니다. 

여하튼..

지난번에 synopsys의 topographical synthesis에 대하여 잠시 말씀드렸었는데..오늘 말하려 하는 것은 synopsys가 2004.06버젼부터 선보인(혹 틀릴수도 있어요..) XG 모드라는 것입니다. 

처음에 XG모드는 memory를 더욱 효율적으로 사용하고, 더 빠르게 분석할 수 있도록 하자는 목적으로 기존의 DB형식을 대치하려 개발된 synopsys의 내부 표현 저장방식입니다. 

저는 개인적으로 예전에 XG모드를 썼다가 크게 덴 적이 있습니다.  
온갖 수사로 포장된 2004.06에서의 XG모드&#8230; SNUG에 tutorial로 설명된 것으로 보고 혹~ 해서 얼마간 썼었는데..DB모드에서는 정상적으로 합성되는 verilog HDL 소스들이.. 죽기도 하고, 운좋으면 합성되는데 netlist가 이상하기도 하고&#8230; 온갖 고생을 시겼었습니다. 

그 이후 사실 쳐다보지도 않고 있지요..^^; (소심해서..)  
새로 구입한 Design Compiler 2006.x 버젼은 실행시키면 바로 XG,TCL모드로 뜨는데, 일부러 db_mode로 띄워서 쓸 정도니까요..

그런데, 얼마전에 DFT compiler 교육에 교양삼아 참가했었는데, XG모드 이야기가 나오더군요..  
뭐, 여러가지 &#8220;XG 좋네~ 쓰세요~&#8221; 이런류의 이야기 말미에.. &#8220;<font size="3"><strong>2007년부터 DB 모드는 없어집니다</strong></font>.&#8221; 

<div style="width: 452px" class="wp-caption aligncenter">
  <img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile7.uf.205C144F4D6A7AA4310AB1.jpg?resize=442%2C331" width="442" height="331" alt="" data-recalc-dims="1" />
  
  <p class="wp-caption-text">
    캬아악~! DB모드가 없어진다구? orz
  </p>
</div>

  
1993년 1월호 마이크로 소프트웨어 커버 기사의 이름이 생각납니다. 

**&#8220;이제는 변화에 순응해야 할때&#8230;&#8221; (C++의 시대가 온다.)  
**  
음.. 이제는 XG모드에 맞춰서 스크립트도 작성해야 겠군요..  
사실 뭐, 바뀐다고 별일 있겠습니까..  
단지, XG모드에 익숙해지고, 믿어가는데 시간이 좀 필요할 뿐이지요.^^;

Synopsys는 꽤 오랜 시간 XG모드로의 전이에 공을 드려왔습니다. 뭐, 여러가지 최적화된 결과를 보이는 모드니까요.. QoR의 관점에서 XG가 월등하다고 보는데, db기반에 익숙한 사람들이 안넘어오니까요..^^;[

<div style="width: 510px" class="wp-caption aligncenter">
  <img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile25.uf.1558C94A4D6A7AA41E0B6D.jpg?resize=500%2C69" width="500" height="69" alt="" data-recalc-dims="1" />
  
  <p class="wp-caption-text">
    XG 모드로 이전하기 위한 모든 정보가 있는 곳.
  </p>
</div>][1]

  
자.. 이제 변화에 순응합시다..

p.s.  
DFT Compiler Lab에서 사용해본 DC-XG 모드는 아주 훌륭하더군요.. 속도도 훌륭하고.. ^^;  
거기 랩하는 동안 시간이 남아 topographical synthesis도 해봤는데.. 초반에 library 분석하는 데 꽤 오랜 시간이 걸리더군요.. 라이브러리 셋팅이 되고나면, 그 다음 부터는 빠릅니다. 

아! 또한가지 design vision 새버젼은 Solaris 버젼을 타더군요.. Solaris 업데이트하시고, DC2006.0x를 깔아야 합니다.

 [1]: http://www.synopsys.com/products/xgmode.html