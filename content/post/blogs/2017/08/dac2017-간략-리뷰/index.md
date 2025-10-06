---
title: DAC2017 간략 리뷰
author: babyworm
type: post
date: 2017-08-15T17:04:33+00:00
categories:
  - 'News on SoC &amp; IP design'

---
자세한 리뷰는 회사 report로 열심히 제출했기 때문에 다시 한번 다른 언어로 적을 힘이 남아 있지는 않네요. 그래서, 이번에도 (2달이나 지나서..) 간략 리뷰. 🙂

원래대로라면 올해 DVCON에 갔으니, DAC에는 갈 차례가 아닌데 회사에서 DAC exhibition hall에 부스를 만들었고, 살짝 기술 지원이 필요할 수도 있으며, 한창 바쁜 이 시점에서 잠시 사라져도 크게 무리없고, 잘 떠들어대는 사람을 찾다보니 제가 간택된 것 같습니다. 출장이 힘들어도 배울꺼리가 있는 건 기회가 되면 참석하겠다는 주의라(요즘에 이런 기회가 아니면 공부를 잘 안하기도 하고..) 저 역시 기쁜 마음 + 부스를 지켜야 한다는 부담감을 가지고 참석했습니다.

<img decoding="async" class="aligncenter" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/2017/08/081517_1703_DAC20171.jpg?w=625" alt="" data-recalc-dims="1" /> 

<p style="text-align: center;">
  부스는 IP pavilion 옆에 Design&Reuse 부스를 공유했습니다.
</p>

DAC는 DVCON과 비교하면 워낙 다루는 분야가 넓어서 힘들기도 합니다만(미리 논문을 대충이라도 읽고 어떤 걸 들어갈지 결정하는 것부터 어렵죠.), 반대로 크게 관심을 가지지 않았던 분야에 대한 최신 정보를 얻게 된다는 장점도 있습니다. 짧게만 살펴보죠.

일단 올해 Keynote는 모두 IoT 관련 내용이 차지했습니다.

짧게 이야기하자면, IoT라는 부분이 단순하게 인터넷과 연결된 장치들이라 치부하기 쉬운데, 네트웍을 통해 데이터를 전송하고 이걸 잘 처리한 후 제어해서 사람이 별로 &#8220;이질감 없게&#8221; 받아들일 수 있도록 해야 한다는 것, 그래서, IoT에서 중요한 건 데이터를 잘 처리하는 것(Machine Learning을 포함해서)이 중요하다는 점을 많이 강조하더군요. 더불어, 이런 부분에 대해서 경쟁력을 갖추기 위해서 SoC에 주목하는 시스템 회사들도 많다는 것 등에 대한 이야기가 나왔습니다. 공통적으로 4차 산업 혁명으로 불리는 IoT 분야가 어마 어마한 기회라고 인식하고 있다는 점과 이 부분에 제대로 대응하지 못하면 기업이 힘들어질 것이라 여기는 점도 흥미로웠습니다.

<img decoding="async" class="aligncenter" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/2017/08/081517_1703_DAC20172.png?w=625" alt="" data-recalc-dims="1" /> 

재미있었던 건 [emotional computing][1]이란 부분이었는데요. 심박, 얼굴 인식 등을 통해서 현재 기분을 인식할 수 있는데(사진에서 어떤 기분이 얼마나 포함되어 있는지 분석하는 앱을 보신적 있을 겁니다.), 사람이 표정만으로 감정을 느끼는 것보다 이 인식의 정확도가 높은 경우가 많다고 합니다. 게다가 간단한 머신 러닝을 이용해서 그 동안 측정된 감정에 대한 로그에서부터 감정 예보가 가능하며 이게 비교적 정확하다고 합니다. 이를 통해서 감정 조절(특히 자살) 문제에 적극적으로 대응할 수 있다는 것도 의미있는 분야였던것 같습니다.

<img decoding="async" class="aligncenter" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/2017/08/081517_1703_DAC20173.png?w=625" alt="" data-recalc-dims="1" /> 

Technical Session의 경우 워낙 많은 분야라서 한정적으로 이야기할 수 밖에 없을 것 같은데요. 느낌만 단편적으로 적죠.

<ul style="margin-left: 38pt;">
  <li>
    <div style="text-align: justify;">
      <span style="font-size: 10pt;">RISC-V 인상적이다. 한번 보자. 내가 아직 프로세서 회사 다니고 있었다면 RISC-V에서 기회를 봤을 것 같다.<br /> </span>
    </div>
  </li>
  
  <li>
    <div style="text-align: justify;">
      <span style="font-size: 10pt;">Python을 사용하는 건 대세다. 간단한 스크립팅에서 데이터 분석에 이르기까지..<br /> </span>
    </div>
  </li>
  
  <li>
    <div style="text-align: justify;">
      <span style="font-size: 10pt;">Machine Learning은 EDA에서도 많이 적용되어 테스트 되고 있다. 특히 RTL단계에서 P&R 이후의 PPA를 추정하는데 사용하면 정확성이 높아져서 TAT가 줄어드는 예가 있다고 한다.<br /> </span>
    </div>
  </li>
  
  <li>
    <div style="text-align: justify;">
      <span style="font-size: 10pt;">(EDA업계 발표의 경우..) 검증 관련 tool과 기술에 대한 부분은 대부분 DVCON에서 이미 발표된 것을 약간 추가해서 재탕했다. 다만 사용자의 use case는 다른 것들이 있었다.<br /> </span>
    </div>
  </li>
  
  <li>
    <div style="text-align: justify;">
      <span style="font-size: 10pt;">EDA 업계/사용자 모두 Cloud에 대한 관심이 있지만, 아직 매우 제한적이며, 특히 라이센스 이슈는 아직 해결하기 쉽지 않을 것으로 보인다.<br /> </span>
    </div>
  </li>
  
  <li>
    <div style="text-align: justify;">
      <span style="font-size: 10pt;">Design data를 취합하고 가공하는 것에 비교적 시간을 많이 사용한단다. (우리만 그런줄 알았는데..) 이거 자동화하려는 시도들이 있다. (우리도 하고 있는데..)<br /> </span>
    </div>
  </li>
  
  <li>
    <div style="text-align: justify;">
      <span style="font-size: 10pt;">IP 설계가 쉽지 않아지고 있다 – 설계 자체에 대한 문제보다는 customization에 대한 요구가 워낙 다양해서..<br /> </span>
    </div>
  </li>
</ul>

DAC를 다녀온지 벌써 2달쯤 되었는데, DAC에서 이야기를 들으면서 이런 저런 것을 시도해봐야겠다는 생각을 하지만, 돌아와서 작업을 하다보면 어느 틈에 시간이 훌쩍 지나가 있네요. 하려고 했던거 해야겠습니다.

 [1]: http://www2.dac.com/events/eventdetails.aspx?id=223-153