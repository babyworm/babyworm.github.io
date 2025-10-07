---
title: Synchronizer 시뮬레이션 문제
author: babyworm
type: post
date: 2008-12-29T02:07:29+00:00
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - meta stable
  - Modelsim
  - NCverilog
  - synchronizer
  - 디지털 설계

---
디지털 로직하는 사람들한테 타이밍 관련된 문제에서 가장 골치 아픈 것이 metastable 문제이라고 말씀 드렸었습니다. 사실, [metastable을 피하는 방법은 예전에 한번 posting한][1] 적이 있는데요.

요즘 IT-SoC의 온라인 강의를 듣다 보니 관련 내용이 있어서 간단한 팁을 하나 올립니다.

Metastable을 피하는 가장 머리가 편한 방법은 2개의 F/F을 직렬로 사용하는 2-flop 방법입니다(절대적이지 않지만, 범용적으로 사용할 만한 방법이죠). 저렴한 방법으로는 하나의 F/F을 사용하는 1-flop 방식도 있습니다만, 1-flop 방식은 첫 번째 F/F이 공교롭게 meta level에 걸리는 경우 뒷부분의 회로가 영향을 받아서 망가질 수 있는 단점이 있지요 (따라서, 정해진 조건에서만 가능합니다.).

여하튼, 비동기적인 방법(stoppable clock과 같은 방식)을 사용하지 않는 경우에는 F/F을 부가하는 것이 가장 간단한 방법이라는 것이죠.

그런데, 1-flop이던 2-flop이던 F/F을 이용하여 동기화기(synchronizer)를 만들고 이 회로에 대한 타이밍 시뮬레이션 할 때, 동기화기로 사용한 F/F이 setup/hold timing을 만족하지 못하는 경우 F/F의 출력이 unknown으로 되어 전체 시뮬레이션이 망가지는 경우가 있다는 점이지요.

이 부분에 대하여 요즘 듣고 있는 강좌에서는 해당 Synchronizer를 instance할 때 특별한 이름(synchronizer)을 주고 이 부분에 대한 SDF를 조작해 주는 방법을 이야기했는데요.. 사실 좀 귀찮죠.. SDF 뽑은 다음에 조작하려면 손으로 하던지(설마요..^^;), scripting을 해야 하는데 말이죠.

쉬운 방법은 system_task를 사용하는 겁니다.

VerilogXL이나 NCverilog에서는 다음과 같은 명령이 있습니다. (Modelsim은 안써봐서 모르겠습니다.)

```
$disable_warnings(&#8220;timing&#8221;, hierarchy_path);
```

잠시 구글링 해보니 Modelsim에서는 다음과 같이 하면 되는 군요.

```
tcheck –off hierarchy_path
```

실제적으로 사용할 때는 synchronizer에 대하여 timing체크를 안하도록 하는 명령을 disable\_path같은 곳에 주욱 나열하고 필요한 경우에 include해서 사용하는 거죠. 사실 이 disable path list는 false\_path 잡을 때도 사용이 되겠지요.
