---
title: Register file vs. SRAM
author: babyworm
type: post
date: 2007-08-29T06:35:11+00:00
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - Memory Compiler
  - Register File
  - SRAM

---
정의로써 이야기하자면, Register file은 Register의 집합체를 통칭하는 말이며, SRAM은 Static RAM의 줄임말입니다. Register라는 말은 보통 D-FF과 같은 간단한 로직 형태의 저장 장치를 의미하며, 어떤 소자의 형태를 의미하지는 않습니다. 따라서, Register file은 D-FF의 합쳐진 형태로 나타낼 수도, SRAM으로 나타낼 수도, 혹은 특별한 형태의 소자를 사용할 수도 있습니다. 

다만, 일반적으로 받아들여지기를 SRAM과 비교하였을 때 Register file은 빠르고, 더 size가 크고, 일반적으로 더 전력 소모가 심하리라 생각할 수 있습니다. 실제로 Full-Custom으로 구성되는 프로세서에서 Register file의 소자 형태는 중요한 논문 꺼리 중의 하나로 들어가 있으니까요. 

이제 현실로 돌아와 보면.. (소위 ASIC이라는 Flow를 생각해서)

Memory component는 각 Fab 회사에서의 memory compiler를 사용하게 되는데, 신기한 것이 Register file이 SRAM보다 &#8220;더 작고, 더 전력 측면에서 유리하고, 더 빠른&#8221; 형태로 나오는 경우가 많다는 것이지요. 이는 일반적으로 생각하는 &#8220;Speed 와 Area는 반비례한다&#8221;라는 관계와 들어맞지 않는데요.

Physical Library를 만드는 Artisan의 이야기로는 &#8220;Register file과 SRAM 간의 기본 아키텍처 차이는 없으나, register file에서는 작은 인스턴스 크기인 경우에 최적의 결과를 나타낼 수 있도록 설계되었다&#8221;고 합니다. 

즉, 이런 memory compiler들은 SRAM이나 Register File이라 불리는 메모리나 모두 6T 구조(6개의 transistor를 쓰는 구조인 것은 아시죠?)의 SRAM cell을 사용하지만, Register File로 구현되는 경우 column당 SRAM cell의 수를 최소화해서, bit-line cap 값을 줄이는 기법을 사용한다고 합니다. 따라서, 결과적으로 구현할 수 있는 크기에 제약을 받지만, 같은 형태의 SRAM에 비하여 빠르고, 더 작은 크기를 지니게 되는 것입니다. 

이러한 형태로 구현되는 이유는 현재의 ASIC technology에서 SRAM cell만 가지고도 약 400MHz정도(0.18um에서)를 구현하는 것이 가능하고, 대부분의 ASIC 공정의 경우 Register file에 요구하는 속도 정도가 이 수준을 넘지 않기 때문이라고 하는 군요. 

따라서, 이러한 형태를 따르는 memory compiler에 있어서는 일반적으로 이야기되는 &#8220;SRAM은 6T구조의 메모리이며, Register file은 filp-flop혹은 latch storing구조를 채용하는 빠른 형태의 메모리이다&#8221;라는 학교의 지식을 버려야 하는 것이겠습니다.
