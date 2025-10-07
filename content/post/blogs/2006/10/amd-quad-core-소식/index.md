---
title: AMD Quad Core 소식
author: babyworm
type: post
date: 2006-10-12T12:48:22+00:00
categories:
  - Microprocessor
tags:
  - AMD
  - Barcelona
  - cmp
  - MPF
  - Quad Core

---
MPF fall에서 여러가지 재미난 소식들이 전달되고 있습니다.  
이번에 전해드릴 소식은 [EEtimes][1]에 나온 AMD Quad Core processor( codename: barcelona) 관련 소식입니다.

{{< wikipedia "Intel" >}}에서 core 2 quad를 2007년 상반기에 내놓겠다고 IDF에서 큰소리 빵빵쳤더랬습니다.  
이에 질새라 AMD는 true quad core processor인 barcelona에 관한 소식을 MPF fall에서 발표했습니다.  
사실 AMD의 quad코어 전략은 desktop에서는 4&#215;4를 기반으로, 즉  dual core processor 두개를 하나의 칩에 내장하는 형태로 공략하고, 이후에 QUAD코어로 간다는 것이었습니다.  
서버쪽은 바로 true quad코어로 간다는 전략이구요.

TRUE quad core라고 강조하는 것은 사실 AMD의 전략(?)이라고 보이는데, 비교적 열등한 형태의 인텔 {{< wikipedia "CMP" >}}의 형태를 겨냥한 느낌이 다분합니다.  
인텔의 core 2 duo의 경우 사실 single core가 대규모 L2 cache에 merging되어 있는 형태라 전통적인 MP의 형태와는 좀 다른 면이 있습니다.

거기에 비해서 {{< wikipedia "AMD" >}}의 quad core는 4개의 분리된 single core가 Direct Connect된 corssbar switch형태의 버스로 연결된 형태를 지니고 있습니다.

&#8221;]<img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile25.uf.2012E54B4D6A7A93340F80.jpg?resize=420%2C175" alt="" width="420" height="175" data-recalc-dims="1" />MPF fall에 발표된 바에 의하면(저는 EETimes의 내용을 재인용합니다.^^; 자세한 사항은 역시 다음주 MPR이 기대됩니다.) 이 프로세서는 65nm공정에서 만들어지는 AMD의 첫번째 코어입니다.  
또한, 각각 128bit dataflow multimedia unit을 지니고 있다고 합니다. (이건 intel에서도 이러니 특별할건 없군요)

{{< wikipedia "Multiprocessor" >}}환경에서 결국 중요한건 Bus bandwidth인데 AMD는 이점을 역시 잘 인지하고 있습니다.  
이에 따른 중요한 업데이트는 intergrated memory controller부분인데요.. DDR2, DDR3, Fully Buffered-DIMM을 지원하게 된다고 합니다.  
관련된 주요 사항으로는 각 코어마다 64KB의 L1, 512KB L2 cache를 내장하고, 비교적 작지만 2MB의 L3 캐쉬를 지원합니다. 캐쉬의 용량은 적절히 조절된 버젼이 또 나올것이라 생각됩니다. 첫공정이니 수율 조정 측면에서 메모리를 많이 넣기는 힘들겠죠.

AMD quad core프로세서의 서버 버젼부터는 지난번에 포스팅했던 [Torrenza][2]를 위한 socket F (1207핀)을 사용해서 메모리 대역폭을 극대화 것으로 예고가 되어 있었는데, 얼마나 성능을 보여줄지 상당히 궁금합니다.

 [1]: http://eetimes.com/news/semi/showArticle.jhtml;jsessionid=YEUKUKZM42MAQQSNDLOSKHSCJUNN2JVN?articleID=193200399
 [2]: http://babyworm.net/wordpress/?p=99
