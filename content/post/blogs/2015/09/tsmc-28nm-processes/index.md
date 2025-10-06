---
title: TSMC 28nm processes
author: babyworm
type: post
date: 2015-09-27T15:07:33+00:00
categories:
  - SoC
  - IP design

---
음.. 사실 회사일 때문에 잠시 살펴봤는데.. 도움이 되실 분이 있을수도 있으니.. (대부분의 분들께서 별로 관심이 없겠지만..)

일단 TSMC의 28nm process에는 아래 링크에서 확인할 수 있듯이 다양한 라이브러리가 존재하는데,  HP(High Performance)와 LP(Low Power)는 너무 자명해서 제외하고..

<http://www.tsmc.com/english/dedicatedFoundry/technology/28nm.htm>

아리까리 한 것이 HPM, HPC, HPC+, HPL인데,

  * HPM: High Performance Mobile Computing
  * HPC:  high performance compact mobile computing
  * HPL: low power with high-k metal gates

내용상으로 봤을때는 HPL은 HP에 High-K를 써서 전력을 줄였다. 정도로 정리하면 될 것 같고..

HPM/HPC는 다음 자료에서 볼 수 있는 것처럼, Mobile용도로 만들어진 공정 중에 HPM은 좀 더 성능에, HPC는 좀 더 면적(그리고 전력 역시..)에 최적화된 것이라 이해하면 될 것 같습니다. (실제로도 그런 position이고..)

<https://www.synopsys.com/Company/Publications/DWTB/Pages/dwtb-logic-libraries-tsmc28-hpc-2015q3.aspx>

그런데, 문제는 아래에 소개된 HPC+ 입니다.

[http://community.cadence.com/cadence\_blogs\_8/b/ii/archive/2015/04/12/tsmc-symposium-new-16ffc-and-28hpc-processes-target-mainstream-designers-and-internet-of-things-iot][1]

HPC+의 freq.가 HPM보다 좋게 나온 reporting이 존재하는데.. 일단은 목적상 HPM이 더 좋은 합성 주파수가 나와줘야 할 것 같네요. (혹은 비슷한 정도라도..)

&nbsp;

글과 관계없는 잡설인데..

오랫만에 blog에 들어왔더니,  DAC2015 글을 일부만 써 놓고 publish를 안했네요. 아.. 쩝.. 이거 어쩌지.. 글은 대충 있으니 사진 첨부해서 올해가기 전에 Publish하는 걸로.. (이미 늦을대로 늦었지만..) ㅎ

&nbsp;

 [1]: http://community.cadence.com/cadence_blogs_8/b/ii/archive/2015/04/12/tsmc-symposium-new-16ffc-and-28hpc-processes-target-mainstream-designers-and-internet-of-things-iot
