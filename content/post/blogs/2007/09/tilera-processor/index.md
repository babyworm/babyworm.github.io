---
title: Tilera Processor.. 병렬성을 통한 성능 향상
author: babyworm
type: post
date: 2007-09-13T12:13:42+00:00
categories:
  - Microprocessor
tags:
  - TILE64
  - 마이크로 프로세서

---
ISSCC&#8217;07에서 Intel에서 80개의&nbsp; core를 집적한 Tera-FLOPS급 프로세서를 발표했었지요. 이번 HOT Chips 19에서는 Tilera라는 회사에서 TILE64 프로세서를 발표한 것이 화제가 되었습니다. 약간 비스므리한 과제를 기획하고 있어서 관심있게 몇 가지 프로젝트를 지켜보고 있었는데, TILE64는 사실 제가 알고 있던 프로세서는 아니었지요.

이는 NoC(Network-on-a-Chip)에 기반을 두고, 다수의 프로세서를 묶은 형태로 볼 수도 있겠는데요 (이런 프로세서가 처음은 아니지요. 기존의 intel의 network processor들이 이런 형태를 가져간 적이 있습니다). 사용하려는 application의 task parallelism이 상당한 경우에 유용한 형태라 볼 수 있습니다. 

<IMG src="https://i0.wp.com/journal.mycom.co.jp/articles/2007/09/09/hotchips1/images/005.gif?w=625" data-recalc-dims="1" /> &nbsp;

[TILE64의 구조; 일본 MYCOM에서 Tilera의 것을 인용한 것을 재인용합니다.]

이렇게 다수의 프로세서를 집적하는 경우, processor 개개의 속도보다는 area와 전력 소모가 중요한 요소가 됩니다. 프로세서의 속도를 올리는 것 보다 프로세서의 수를 증가시켜 성능 향상을 도모하는 것이니까요.

사실, 성능 향상에는 clock frequency를 증가시키는 것이 더 유용할 수 있습니다.(예전에 speed-demon approach를 말씀드린 것 처럼) 어짜피 전력 소모는 동작 주파수에 비례하니, 전력소모가 급증하지도 않을 테구요. 클럭 주파수를 2배 올려서 얻는 전력의 불이익보다, 코어 2개를 써서 얻는 전력의 불이익이 클 수도 있겠지요? 클럭 주파수를 2배로 올리면 performance가 2배가 되는데, 코어 2개를 쓰더라도 parallelism이 없으면 소용 없으니 말입니다. 

그럼에도 왜 클럭 주파수를 높이지 않고 multicore를 사용할까요?

우선, 클럭 주파수를 높이는 것이 그렇게 녹녹하지 않다는 것이지요. 클럭 주파수를 높이기 위하여 합성을 심각하게 하면 area는 exponetial로 증가하며, 클럭 주파수를 높이기 위해서 미세 공정을 적용하면서 leakage current가 심각한 문제로 나타나고, 클럭 주파수를 높이기 위해서 dynamic gate를 쓰다보니 clock frequency 조절에 문제가 생기고, 클럭 주파수를 높이기 위해서 pipeline을 깊게 만들다보니 명령어 처리 효율(insturction per cycle:IPC)이 떨어지고, 이를 회복하려다보니 복잡한 dynamic branch prediction을 적용시켜야 하고.. 등등등..

클럭 주파수를 높이기 위해서 얻는 이득보다, 잃는 것이 많아지고 있는 것이지요. 즉, (parallelis이 어느 정도 존재한다면) 느린 코어를 여러개 쓰는 것이 유리한 시점까지 와버린 거라고 볼 수 있습니다. 문제는.. task 수준의 parallelism을 얻을 수 있는 application이 (현재로서는) 통신과 미디어 처리 부분이라는 것입니다. 이 문제의 극복은 쉽지 않아보이긴 합니다 ^^;
