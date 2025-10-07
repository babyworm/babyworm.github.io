---
title: DVCon의 결과..
author: babyworm
type: post
date: 2009-02-15T23:06:05+00:00
categories:
  - 'News on SoC &amp; IP design'
tags:
  - DVCON
  - SystemVerilog
  - verilog HDL

---
질문 게시판의 내용이지만, 답변은 여기에 ^^;

<http://theasicguy.com/2009/01/27/dvcon-survey-results-what-do-they-mean/>&nbsp;에 DVCon Survey 결과가 있었습니다. DVCon은 가끔 언급했지만, verification 부분에서 가장 큰 행사 중의 하나이지요. <A href="http://www.deepchip.com/" target=_blank>ESNUG</A>에서도 곧 여러가지 설문 결과나 행사 기간동안 가장 많이 팔린 책들에 대한 언급이 있을 텐데요.. 올 한해 책 지름의 기반이 되겠지요.

여하튼, 설문의 결과는 예상대로.. 라고 말씀드릴 수 있습니다.

Design Language로는 Verilog HDL 이 대세
검증에 있어서는 SystemVerilog가 대세

요약하면 이렇게 되는 거죠..

사실 <STRIKE>SystemVerilog가 다음 Verilog HDL에 통합될 예정이기</STRIKE> SystemVerilog가 Verilog HDL로 통합 되었기 때문에 전체적으로 VerilogHDL이 휩쓸고 있다고 볼 수 있습니다.

설계 언어로서 Verilog HDL이 각광 받는 건 사용하기 편해서이기도 하고, 많은 검증된 툴이 존재한다는 점 때문이기도 합니다.

SystemVerilog가 검증 언어로서 각광 받는 이유는 verilog로 부터 물려받은 design 부분의 feature이외에 검증을 위한 assertion, coverage, interface에 대한 지원이 이루어져 있기 때문입니다.

특히 high level modeling에 있어서는 C를 따라갈 수 없겠지만, assertion에 있어서는 완전히 PSL을 밀어내버린 거죠.

이렇게 verilog HDL family가 전체 설계/검증 flow를 장악한 이유는 자명합니다. 한가지로 통합하여 사용할 수 있는 언어가 있으면 다른 언어를 배우고자 하는 사람이 적어지는 건 당연하죠.. 게다가 기존에 알고 있던 문법에 몇 가지 불편했던 부분이 추가되고 , 새로운 개념은 완전히 새롭게 문법이 들어오는 형태로 개선되고 있으니 기존 사용자를 잘 흡수한 것이죠.

매년 나온 Survey Result를 생각하면 나중에 좀더 다양한 아이템에 대한 Survey 결과가 나올 것이라고 봅니다만, 설계나 검증에 종사하시고자 하시는 많은 분들께 verilog HDL을 권할 수 있겟습니다.

(추가)
근데, 더 흥미로운 설문은 (아직 샘플의 수가 너무 적어서 뭐라 말씀드리기 힘듭니다만..), 어떤 Verification methodology를 사용할 예정이냐.. (<http://www.doodle.com/participation.html?pollId=u5ust5s73h8y9r62>&nbsp;)는 설문이네요.

제 개인적으로 VMM은 좀 툴에 대해서 까다로워서 원래 좀 그랬고, Teal/Truss는 PC에서 돌리기 힘들어서 확산은 힘들것 같았고..(게다가 PLI/DPI 기반이라는 건 컴파일 할때 험난한 여정을 의미하죠..뭐 SystemC도 마찬가지지요.. 이런 C/C++ 기반의 방법들은 gcc 버전에 민감하게 만들어지면 고생길이 열립니다..특히 C++과의 연결은.. ).. <br>
여하튼 생각보다 OVM이 지지를 많이 받고 있군요.. 시뮬레이션에 많이 사용되는 cadence와 mentor의 연합이니 그럴 수 있겠다는 생각이 (반면에 약간 툴 버젼을 가리는 것은 아깝습니다. &#8211; 물론 지원되는 system verilog 문법 때문에 어쩔 수 없겠습니다만..)

p.s.
2월 들어 첫 딸 돌잔치 준비를 열심히 하느라 집에서 블로그에 들어올 시간이 없었습니다. ^^;
돌 사진 찍은 거 보정하는 것과 성장 동영상 만드는 것을 미뤄두고 있다가 2월 내내 꼬박 퇴근 후 시간을 투자해야 했으니까요.
이제 좀 여유로워졌으니 다시 글이 올라갈 것이라고 생각 해 봅니다. (천성이 양치기 소년이라.. 믿을 수 있을지는..)
