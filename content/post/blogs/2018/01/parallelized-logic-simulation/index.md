---
title: Parallelized Logic Simulation
author: babyworm
type: post
date: 2018-01-09T17:22:51+00:00
categories:
  - CAD tools
  - 'SoC & IP design'
  - verification

---
얼마전부터 parallel simulation이 큰 이슈가 되었습니다. 몇몇 기사에서는 3세대 simulation 기법이라고 이야기하더군요.

Verilog-XL 처럼 interpreter 형태를 1세대로, 2 세대를 finesim, VCS, NCVerilog 처럼 compiled 형태를 2세대로, 그리고, 다수의 processor를 동시에 쓰는 형태를 3세대로 이야기하는 거죠.

그간 simulation에서 multicore를 사용하는 건 별로 없었죠.  정확히는 wave dump나 assertion/coverage check 같은 걸 병렬로 하는 건 있었지만, simulation core 자체를 multicore로 하는게 별로 없었던 거죠.

제 기억에 남는 건 DAC13의 must see list에 있었던 rocketsim이 처음이었던 것 같습니다. GPU를 사용해서 [VCS와 같이 사용했을때 gate level simualtion을 대략 23배 빠르게 해준다는 이야기][1]때문이었죠.

그러다가 조금 조용해졌었는데, [Best EDA Tool 2016 #3][2]에 뽑혔을때 조금 더 많은 이야기를 접할 수 있었고, 작년 DVCON2017에서는 Cadence의 Xcelium(Rocketsim을 인수한 다음 이름을 바꾼 거죠.)과 Synopsys의 VCS FGP(위 link의 Cheetah VCS가 이름을 바꾼 겁니다.)가 본격적으로 마케팅하는 것을 볼 수 있었습니다. 이전에 [DVCON2017에 대해서 적은 글][3]에도 간략하게 적었습니다만, 두 툴간에 신경전(서로 은근히 까는?)도 있었고요.

Xcelium의 경우 GPU기반에서 출발해서 Multi-core 형태로 발전한 상태였고, 배경에는 simulation의 경우 단순한 연산보다 복잡한 연산이 많아서 GPU보다 processor core를 병렬적으로 사용하는게 좋더라.. 는 담당 엔지니어의 설명이 있었습니다.

사실 VCS FGP에 대해서는 비교적 잘 모르던 상태에서 들었는데, VCS 사용자의 경우 “무료”로 사용할 수 있을 것이고 곧 사용할 수 있을 것이다. 라는 부분이 흥미를 끌었죠. 내부적으로 VCS만 사용하고 있어서 말입니다.

다만, 두 툴 모두 RTL sim 보다는 Gate level sim에서 성능 향상이 크며, RTL sim의 경우는 설계에 따라 큰 차이가 있다… 를 깔고 들어갔고, Xcelium의 경우 3~4배까지는 된다고 이야기했던 반면, 당시 VCS FGP는 설계에 따라 2배 정도는 된다는 이야기를 해서 아주 큰 기대는 하지 않고 있었습니다. 보통 이렇게 이야기하면 생각보다 훨씬 안좋은 경우가 많으니까요.

결론적으로 말하자면, Parallel Simulation 쓰라는 이야기를 하고 싶습니다. 설계에 따라 다를테니 뭐가 좋다고 이야기하기 쉽지 않겠지만, core를 3~4개 정도를 사용하는 수준은 분명히 좋아집니다.

제가 테스트해본 설계에서는 main processor 이외에 3개 정도 core를 더 쓰면 대략 2배 정도 빨라지는 결과를 얻었는데, 4개 정도를 넘어가면 core를 더 사용한다고 더 좋아지지는 않았습니다. 아마도 설계에서 얻을 수 있는 병렬성이 이 정도겠죠.

곁다리로, 요즘에 새로운 프로세서들을 사용할 기회가 있어서 같이 테스트 했는데요. 요건 뭐에 걸릴일은 없을테니..

제가 기존에 쓰던 I7-3770K에서의 simulation  time을 100%라고 했을때, 상대 수행 시간입니다. (아래는 parallel simulation이 아닙니다.) 보시면, 적어도 VCS에 있어서는 intel의 8세대 CPU들이 훨씬 빠릅니다. 같은 세대인 Ryzen Threadripper 1950x와 비교해보면 말이죠. (물론, Threadripper의 경우 multicore에 힘을 실은 프로세서죠.). 사실 parallel로 비교해도 16 core짜리 threadripper보다 6core짜리 i7-8700K가 더빠릅니다. 🙂

<table dir="ltr" border="1" cellspacing="0" cellpadding="0">
  <colgroup> <col width="192" /> <col width="100" /></colgroup> <tr>
    <td>
    </td>
    
    <td data-sheets-value="{"1":2,"2":"rel. perf. "}">
      rel. perf.
    </td>
  </tr>
  
  <tr>
    <td data-sheets-value="{"1":2,"2":"i7-3770K "}">
      i7-3770K
    </td>
    
    <td data-sheets-value="{"1":3,"3":1}" data-sheets-numberformat="[null,3,"0%",1]">
      100%
    </td>
  </tr>
  
  <tr>
    <td data-sheets-value="{"1":2,"2":"Ryzen 1950X "}">
      Ryzen 1950X
    </td>
    
    <td data-sheets-value="{"1":3,"3":0.85}" data-sheets-numberformat="[null,3,"0%",1]">
      85%
    </td>
  </tr>
  
  <tr>
    <td data-sheets-value="{"1":2,"2":"i5-8400 "}">
      i5-8400
    </td>
    
    <td data-sheets-value="{"1":3,"3":0.68}" data-sheets-numberformat="[null,3,"0%",1]">
      68%
    </td>
  </tr>
  
  <tr>
    <td data-sheets-value="{"1":2,"2":"i7-8700K"}">
      i7-8700K
    </td>
    
    <td data-sheets-value="{"1":3,"3":0.52}" data-sheets-numberformat="[null,3,"0%",1]">
      52%
    </td>
  </tr>
</table>

Zen+ Archtiecture는 이미 설계가 끝나서 출시 예정이고, Zen2 architecture 기반의 CPU들이 올해 나온다니, 그때는 single thread performance가 얼마나 비교가 될지 궁금하긴 하네요. (사실 meltdown bug 때문에 intel cpu performance가 떨어지긴 하겠습니다만,  그래도 위의 격차를 채우긴 쉽지 않을 것입니다. ) 잡설입니다만, 제 생각에 TLB에 PCIDs를 적용하고 있는 최신 processor들의 경우 약간의 트릭으로 이 버그를 피해나갈 수 있지 않을까 싶은 생각이 드는데요..  프로그램 컴파일을 다시 요구할 수 있는 embedded라면 compiler workaround로 피할 수 있을 것 같은데(예전에 요런 짓을 많이 해봐서..), PC/workstation용으로는 이게 불가능하니 대신 뭔가 해야겠죠? 안그래도 [CES에서 비슷한 이야기][4]가 나온 걸로 봐서는 뭐가 있겠죠.

원래 내용으로 돌아와서, simulation이 목적이라면 아직은 intel CPU를 사용하시라는 점. 할 수 있으면 parallel simulation을 사용하시라는 것. 이 두 가지만 기억하시면 되겠습니다. 🙂

 [1]: http://www.deepchip.com/items/0523-04.html
 [2]: http://www.deepchip.com/items/dac16-03.html
 [3]: http://babyworm.net/archives/1944
 [4]: http://mashable.com/2018/01/08/intel-ces-keynote-spectre-meltdown/