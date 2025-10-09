---
title: Cell의 VPU, AMD의 ATi GPU 통합
author: babyworm
type: post
date: 2006-12-02T07:31:02+00:00
categories:
  - Microprocessor
tags:
  - AMD
  - ATi
  - cell
  - GPU
  - Integration
  - parallel processing
  - PS3
  - Vector processing
  - XBOX360

---
Cell 프로세서의 초기 형태를 지닌 PS3가 출시 되었습니다. 

이미 여러 블로그에서, PS3와 XBOX360에 대해서 여러 측면에서 분석을 하여주셨는데요.. 저는 나름대로 프로세서 만드는 사람이니 프로세서의 입장에서 설명을 드려볼까 합니다. Cell에 대한 초기 논문과 기사만을 보고 “감”만 잡고 있는 상태이니 그리 좋은 글은 아닐 것입니다만..^^;

**Graphic processor.. 발전..**

초창기 graphic processing이라는 것이 CPU가 전담하고 있던 일이었다는 건 뭐 다 아시는 사실이겠죠.<br>
CGA/EGA/VGA를 거치는 graphic card는 frame buffer에 있는 내용을 모니터로 전달하는 역할(소위 이야기하는 graphic triple DAC의 역할과 DMA정도의 역할)이 주된 일이었습니다. 사실 DMA도 없던 그래픽 카드가 대부분이었지요. 한마디로 CPU가 그림 다 그려주면 이걸 화면에 잘 뿌리는 동작이 제일 중요했고, 그래서 RAMDAC의 속도가 좋은 그래픽 카드를 선택하는 기준이었습니다.<br>
하지만, windows 3.1 운영체제가 많이 배포되면서 그림을 그려야 할 일이 너무도 많아졌죠.<br>
그 시절에 2D graphics accelerator라는 addon카드가 따로 나온적도 있었습니다만, 얼마지나지 않아서 그래픽 카드가 이 기능들을 포함하면서 조용히 사라지게 되었습니다. 이때부터 그래픽 카드는 processing 능력을 지니게 된것으로 보면 될것 같습니다. 사실 2D graphics acceleration이라는 건 별거 없구요.. 좋은 DMA기능에 간단한 조작 기능을 갖춘 것이랄까요.. 이정도 였던 것이 맞을 듯 합니다. 

하지만, 3D 게임이라는 것이 발생하면서 상황은 너무 많이 바뀌게 됩니다. CPU에서 과도한 연산을 수행해야 하는 것이지요. 따라서, CPU에서 처리하는 integer 연산의 일부를 graphics card에서 처리하는 형태로 발전하게 됩니다. 그래픽 연산이라는 것은 기본적으로 데이터의 속성상 parallelism이 매우 뛰어나며, 하나의 처리가 전체 화면에 대해서 적용되므로 SIMD(Single Instruction Multiple Data)/vector processing이 가장 쉽게 적용될 수 있는 연산입니다. 

당연스럽게 integer SIMD unit이 graphics card안에 내장되고, 이후에 floating SIMD unit이 내장되고, 속도를 높이기 위하여 좀더 넓고/깊은 파이프라인이 추가되는 국면을 맞게 됩니다. 이때부터 앞을 다투어 GPU라는 이름을 붙이게 되지요. (graphics processing이 vector processing을 이용하므로 branch가 거의 없다는 특성이 있고, 따라서 CPU에서는 꺼려지는 넓고/깊은 파이프라인을 구성하는 것이 용이합니다. CPU보다 많은 tr을 집적한 graphics processor에 대한 이야기가 많은데, GPU의 경우 처리하는 데이터의 속성상 넓고/깊은 파이프라인을 구성하는 것이 대부분 “항상” 유효하므로, CPU보다 더 많은 집적이 가능한 것입니다.)

**Vector processing은 더 이상 특수한 일부를 위한 기능이 아니다.**

graphic procssing unit에서 강력한 processing 기능을 처리할 수 있게 되었는데, CPU에서는 필요한 경우에 이 강력한 processing기능을 사용하고 싶은 마음이 들겠지요. ^^; 

멀티미디어 측면에서의 graphics processing unit의 유용성에 대해서 이야기해 볼까요?<br>
nVidia에서 Cg라는 언어를 이용해서 자사의 강력한 shader에 존재하는 넓은 파이프의 floating point processing기능을 그래픽 처리 이외의 일반적인 산술연산(실제적인 application은 물리 연산이겠습니다만..)에 사용할 수도 있도록 길을 열어 두었습니다. 

게다가 한발 더 나아가 예전에 올렸던 [peakstream][1]이라는 벤쳐회사는 다양한 floating point 연산을 GPU를 사용하여 수행할 수 있도록 하는 compiler 통합시키는 기술(실제적으로는 library가 더 중요하겠습니다만..)을 선보여서 주목을 받고 있습니다. 

한마디로, 이러한 경향을 예전에 supercomputer에서 수행하던 vector processing이라는 것이 더 이상 **특수한 일부**를 위한 기능이 아닌 시대가 오고 있다는 것을 보여주고 있습니다. 사용자들은 다양한 그래픽 처리를 당연하듯이 사용하고 있고, 좀더 정교한 물리 엔진이 적용된 게임을 하고 있습니다. 

**CPU와 GPU/VPU**

Graphics Processing Unit에서 처리하는 데이터의 양이 많아짐에 따라, CPU와 GPU간에 더욱 더 넓은 대역폭이 요청되는 건 당연한 사실이겠습니다만, CPU에서는 이런 현상을 최대한 줄이기 위해서 local memory를 사용해서 GPU에서 필요한 정보들을 대부분 local memory에 담고 연산하는 방식을 취하게 됩니다. 하지만, graphics application이외의 연산에 GPU를 이용할때는 문제가 그리 쉽게 풀리지 않는 경우가 많이 생깁니다. 그림그려서 monitor로 출력하는 것이 아니라, 다시 main memory로 옮겨야 하고, 그 데이터를 필요한 경우 다시 CPU에서 참조하여 program flow를 결정하는 등의 연산이 필요하게 되므로, CPU와 GPU/VPU간의 데이터 대역폭이 급격히 증가하게 되는 것입니다. 

저도 칩 쟁이입니다만, 칩간의 데이터 교환은 1) pin수의 제약을 많이 받습니다. 즉, 일정 수준 이상으로 대역폭을 늘리는 것이 불가능합니다. 2) PAD를 통과하며 예측 이상의 power를 소모하게 됩니다. 3) offchip에서는 PCB를 통과할 것을 가정해야 하므로 latency가 느려지게 됩니다.<br>
(여담입니다만, 이런 연유로 package에 두개의 core(실은 각각 dual core지만..)를 때려박은 intel core 2 duo extreme이 AMD의 4×4보다 더 좋은 결과를 보일 수 밖에 없습니다. 마찬가지로 추후에 AMD의 real Quad core가 나온다면 이 현상은 역전될 가능성이 아주 높습니다만.. processing core의 능력은 별개이니 어찌될지 모르겠습니다. system 적인 architecture만으로만 따지자면 real Quad가 역전할 가능성이 높은 것이 사실입니다.)

따라서, CPU와 GPU/VPU를 on-chip에 통합하자는 이야기가 나오는 것은 아주 아주 당연한 이야기입니다. 

**칩 좋다고 성공합니까?**

얼마전에 이런 글을 적은 적이 있죠? ([여기][2]).<br>
Processor Architecture로는 Cell이 좋아보입니다. 우선 VPU와 CPU간의 interconnection도 그렇고 상당이 잘 짜여져 있습니다. (예전 standford의 모 프로세서 구조랑 비슷해 보이는데.. 차용한 것인지는 잘 모르겠네요.)<br>
하지만 칩 좋다고 성공합니까?<br>
칩이 아무리 좋아서 사용하는 사람을 힘들게 하면 성공하기 어려울 것입니다. Cell은 SIMD가 아닌 VPU가 general processing/Consumer 시장에 (제대로) 등장한 첫 칩입니다. 

Parallel processor, Multi-processor, VLIW가 세상을 지배할 것이라 말한 것이 벌써 몇십년전입니다. 그렇게 되지 못한 가장 큰 이유는 바로 “parallel processing을 이해하는 programmer의 부재”입니다.<br>
사람이 원래 순차적으로 생각하는 것에 익숙하니, 이를 뜸금없이 parallel processing에 적응해라~!라고 해봤자 별로 효용성은 없는 이야기입니다. [jrouge님의 블로그][3]에서도 이에 대해서 언급하셨는데요.. 

예전과는 좀 다른 희망이 몇가지있기는 합니다. 우선 컴파일러 기술의 진화입니다. 아직 미비하기는 하지만, parallelism을 찾아낼 확률이 높아지고 있지요. 두번째로 가장 중요한 것은, VPU에서 처리하고자 하는 내용이 parallel processing이 가능한 application이라는 것이지요. (사실 parallel programming의 경우 다수의 프로세서에 각각 job을 할당하고 이를 merge하는 형태로 진행되는데, 이때 사용되는 알고리즘들은 순차적인 생각이었을때와 완전히 달라지게 됩니다. 단, cell같은 경우 powerPC와 VPU를 분리한것으로 보아 VPU에서는 다수의 VPU에서는 특정 application만을 사용하겠다.. 라는 생각을 가진 것으로 보입니다. )

예를 들어, 2D/3D의 graphics processing, MPEG과 같은 video encoding/decoding, 물리 연산은 모두 matrix 연산을 기반으로 합니다. Vector processor라는 것이 matrix operation에 특화되어 있기 때문에, 해당 분야에 대한 API를 작성하는 것이 어렵지 않을 것이며, 이를 이용하여 고 수준의 API를 작성하는 것도 생각보다 어렵지 않을 것이라 생각합니다. (물론, 쉽다고 생각하지도 않습니다. 만일 Sony에서 이런 API/Compiler의 제공없이 parallel progrmming을 강요하는 상황이 온다면, 여지 없이 실패할 것입니다.)

CPU/GPU의 통합은 어떨까요?

뭐, 이 상황은 Cell과는 다르죠. 개발자의 입장에서야 같으니까요. 사용자의 입장에서는요?<br>
CPU/GPU의 통합이 처음 있는 일은 아니지요. 저가형에서 간혹 있어왔고(VIA였던지 SiS였던지 기억은 나지 않습닉다만), 연구 수준에서도 있었습니다.(예전에 말씀드렸던 과거 ETRi에서 진행했던 4개의 IPU와 1개의 GPU를 통합하는 MPU도 그렇구요)

근데, 왜 아직까지 제대로 빛을 본 GPU통합 칩이 없을까요? 이유는 간단합니다. 

“사용자의 요구는 아주 다양하다”라는 점 때문입니다.<br>
같은 CPU와 같은 graphics card를 붙이고 계신 분이 몇분이나 되시겠습니까? CPU는 괜찮은것 같아서 graphics card만 업그레이드 해본적이 있으시겠지요?

만일 CPU/GPU가 통합된 경우 이런 것은 불가능하겠습니다. 하지만, 일정 수준이상의 CPU/GPU통합은 mass market에서는 통할 확률이 높습니다. (이런 점에서 예상외의 graphics chip set 판매의 강자가 intel이라는 점을 잊지말아야 겠지요 ^^; intel은 통합 칩셋을 팔아서 매우 많은 이득을 남기고 있지요.. 알게 모르게)

**Cell.. parallel vector processing**

Sony가 cell processor를 PS3라는 콘솔에 투입한 것은 매우 영리합니다. 개발자 이외에는 고민할 필요가 없는 마켓이며, 비교적 새로운 플랫폼이 먹힐 가능성이 높으니까요. (단, XBOX360은 개발자가 가장 편하게 여기는 PC의 환경을 그대로 가지고 있으므로, 개발 편의성 측면에서는 비교가 안되겠지요. )

사실 지금의 논의는 PS2의 개발 환경과 XBOX의 개발 환경을 비교하던 것과 비슷한 논란입니다.<br>
XBOX는 PS2에게 처절하게 당하고 말았는데, 문제는 killer title에 있었습니다.<br>
비싼 교훈을 얻은 Microsoft가 그냥 당하고 있지는 않겠지요. 

궁극적으로 게임기는 그 성능에 관계없이 게임성이 가장 중요하다는것이 진리이니까요.<br>
게임기의 성능을 보고 사는 사람은 얼마안되지만, 재미있는 게임을 하기 위해서 게임기를 사는 사람은 많으니까요.  PS3, XBOX360보다 훨씬 하드웨어적으로 열등하지만, Wii가 주목받고 있는 이유이기도 합니다. 

processor하는 입장에서 cell의 성공을 바라지만(cell의 성공에 힘입어 좀더 parallelism을 잘 살려내는 컴파일러가 나타날 것을 기대할 수 있으니까요..) 미래는 알 수 없겠습니다.

 [1]: http://babyworm.net/tatter/60
 [2]: http://babyworm.net/tatter/109
 [3]: http://jhrogue.blogspot.com/2006/11/xbox-360-vs-ps3.html
