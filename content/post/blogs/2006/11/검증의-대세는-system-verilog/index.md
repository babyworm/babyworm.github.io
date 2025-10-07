---
title: 검증의 대세는 system verilog?
author: babyworm
type: post
date: 2006-11-28T14:29:08+00:00
categories:
  - verification
tags:
  - SystemVerilog
  - testbench
  - Verification
  - 검증

---
검증 작업을 시작했다는 <A href="http://babyworm.net/tatter/98" target=_blank>포스팅</A>을 얼마전에 했었습니다.  
뭐, 일단 검증 시나리오 짜고, function coverage 전략 세우고.. 이런것 부터 시작했습니다만..

verilog로 약간 검증 마인드로 이런 저런 것을 작성하다보니, synthesizable subset의 틀이 얼마나 옭죄고 있었나라는 생각이 심각히 들더군요..

verilog 표준에서 정의된 동작에 대해서 어느정도는 알고 있다고 자부하고 있었는데, 좀더 깊이 알게 되는 기회가 되고 있는 것 같습니다. 얼마전 gil님께서 class와 비슷한 verilog를 말씀하신 이유도 납득이 가구요..  
<img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile2.uf.126FBF4C4D6A7ABB144ED5.jpg?resize=200%2C273" class="alignright" width="200" height="273" alt="사용자 삽입 이미지" data-recalc-dims="1" />  
하지만, verilog는 추상화 레벨을 높이기에 약간 무리가 있기는 하더군요.. 물론, 어짜피 regression vector쪽에는 PLI위주로 가게될 것으로 구상해두었지만, 일반적인 경우에는 PLI사용을 꺼리시는 분들도 있는 관계로 왠만하면 verilog만으로도 어느정도 coverage를 보일 수 있도록 구상하고 있는데&#8230; 약간 까다로운 점이 있습니다. 

그래서, 대안 처럼 생각하고 있는 부분이 SystemVerilog인데, 아직 제가 본격적으로 공부해본것이 아니라 스펙 수준에서 표준 문서만 한번 훓어본 정도에서 멈추어 있던 상태라 약간 깨름직 했었습니다.  
그런데, <A href="http://verificationguild.com/" target=_blank>verification guild</A>에서도 그렇고, comp.lang.verilog도 그렇고 system verilog에 대한 내용과 비중이 점점 높아가는 것을 알 수 있겠더군요.

사실 verification guild의 guild master가 vmm-sv의 저자이기도 하니까 그렇겠지요..  
하지만, writing testbench 책이 HVL이 아닌 system verilog만을 이용해서 다시 작성할 수 있을 정도로 system verilog의 verification기능이 강력하다는 것은 아무래도 끌리는군요.  
(옆에 보이는 책이 writing testbenches using systemverilog책이 바로 <A href="http://babyworm.net/tatter/66" target=_blank>예전에 제가 다시 읽고 있다는 </A>writing testbenches의 새 버젼이지요. 요즘에 가장 사고 싶은 책입니다. 하지만, 가격이&#8230; 가격이.. orz)

Verification Methodolgy Manual for SystemVerilog와 같은 책이 나온것도 사실 system verilog가 대세가 되는 것 아냐? 라는 생각을 가지게 하는 이유이기도 하지만 말입니다. (또한권의 가장 사고 싶은 책입니다. 역시 가격이.. 에휴&#8230; )<img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile29.uf.152829494D6A7ABA15292B.jpg?resize=301%2C235" class="alignleft" width="301" height="235" alt="사용자 삽입 이미지" data-recalc-dims="1" /> 이 <A href="http://www.vmm-sv.com/" target=_blank>책의 홈페이지</A>에는 system verilog를 이용한 verification에 대한 개략적인 정보는 얻을 수 있습니다. 

사실 초기에 저는 cadence의 SCV를 필두로한 systemC에 대항하기 위해서 synopsys가 선택한 카드가 system verilog일 것이라는 곱지 않은 시선을 가지고 있었습니다.  
하지만, 요즘에 와서는 system verilog를 native로 지원하는 simulator들이 속속 등장하고 verilog표준에 system verilog가 포함될 것으로 예정되어 있는 상태이니.. 정말 systemverilog가 HVL을 대체할 정도로 강력하다면, 대세가 될 확률이 높아지겠지요.

여하튼, 지금 가지고 있는 system verilog for design(stherland저)책이라도 한번 봐둘 필요는 있을 것 같습니다. ^^;  
사실 예전에 이 책 봤을때는 systemverilog에 대해서 약간 실망을 했었는데, 검증의 측면에서는 어떨지 한번 공부해 봐야겠습니다. 

이 부분은 역시 작업 마치면 한번 정리하죠..나~~~중에
