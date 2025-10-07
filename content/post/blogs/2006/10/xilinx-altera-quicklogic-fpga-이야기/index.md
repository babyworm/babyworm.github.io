---
title: Xilinx, Altera, Quicklogic.. FPGA 이야기.
author: babyworm
type: post
date: 2006-10-21T12:16:24+00:00
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - Altera
  - FPGA
  - Structred ASIC
  - xilinx

---
가끔 컴퓨터 부품 리뷰에 보면 웃지못할 기사들이 버젓이 쓰여지는 일이 있습니다.  
예를 들면 &#8220;이 캡쳐 보드에는 핵심칩으로 xilinx spartan 2가 사용되었고, 이 칩은 다른 무슨 보드에서 사용된 칩이다.&#8221; 이런 기사 말입니다. 

이러한 기사는 어찌보면 FPGA/CPLD에 대한 이해부족으로 나온 기사라 생각됩니다.<img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile27.uf.17610C4A4D6A7A9D0EC7D8.jpg?resize=249%2C246" class="alignright" width="249" height="246" alt="" data-recalc-dims="1" /> 

{{< wikipedia "Xilinx" >}}, {{< wikipedia "Altera" >}}라는 회사에서 나온 대부분의 칩은 {{< wikipedia "FPGA" >}}나 {{< wikipedia "CPLD" >}}이며, 이러한 칩들은 필요할때마다 구현하고자 하는 논리 회로를 올릴 수 있도록 구성된 칩입니다. 

따라서, &nbsp;이 회사의 칩은 구성하는 사람이 원하는 대로 바꿀수 있기 때문에 외부에서 보이는 칩의 이름이 xilinx spartan 2이건 altrea cyclon이건 아무런 의미가 없다는 것이지요.  
예를 들어 동일한 xilinx spartan2라도 네트웍 시스템하는 사람은 &#8220;네트웍 관련 로직&#8221;을 넣어서 구현할테고, 그래픽 카드 만드는 사람은 &#8220;그래픽 처리 기능&#8221;을 넣어서 만들테고, MP3 플레이어라면 &#8220;MP3 decoder&#8221;를 넣어서 구현할테니 말입니다. 

**FPGA는 어떤 칩인가**  
이런 칩들은 reconfigurable logic들인데요.. (antifuse형태를 쓰는 quicklogic과 actel은 잠시 접어두고요..)  
이는 초기에 칩을 만들때 범용성 있는 로직들을 무수히 넣어두고, 이 로직들간의 연결을 제어할 수 있도록 해둔 것입니다. 즉, 로직 간의 연결제어에 따라 &#8220;원하는&#8221; 동작을 할 수 있는 새로운 칩이 되는 것이지요.  
대신, 필요 없는 로직도 많고(하드웨어에서 필요없는 로직이 많다는 말은 단가가 비싸진다는 말과 동일합니다), 로직간의 연결도 멀고 해서 ASIC에 비하면 엄청나게 느리고, 전력소모도 많다는 것이 정설입니다. 

초기에 이러한 형태의 칩은 하드웨어 설계자들이 구현하고자 하는 동작을 상당히 빠르게 FPGA에 올려서 시스템상에서 테스트(prototyping)하는 목적으로 사용되었습니다.  
하지만, 최근에는 공정기술이 좋아지면서, FPGA도 어느정도 속도가 나오고 있구요.. ASIC공정을 타기 위한 NRE가 워낙에 비싸지다보니.. 소량이면서 아주 빠른 동작이 필요없는 경우 시스템에서 FPGA를 직접 이용하는 경우도 많이 늘어났습니다. (FPGA 제작사들은 이런 마켓을 위해서 spartan이나 cyclon과 같은 저가 FPGA를 출시하고 있습니다. )

**조금더 들어가서..**  
FPGA는 로직간의 연결을 제어하는 방식에 따라 여러가지 칩이 존재하는데, 가장 빈번히 사용되는 방식이 SRAM 방식과 antifuse방식입니다. SRAM방식은 로직간의 연결 제어 정보를 SRAM에 두고, 이 SRAM의 프로그램이 변경될때마다 다른 형태의 로직으로 재구성될 수 있도록 만든 형태입니다.  
이에 반해서, antifuse방식은 프로그래밍시에 로직 간 붙어있는 fuse중에 불필요한 fuse를 끊어서, 로직간의 연결을 만드는 방식입니다. 따라서, Antifuse 형태는 SRAM 형식보다 (일반적으로) 저전력이며 빠르지만, 재구성될 수 없다는 단점이 있습니다. 

**다른 잡설들**  
요즘 공정이 미세해지면서 Fab의 NRE가 너무 비싸지고, 고려사항도 많아지고.. 하면서..  
이러다 FPGA(실은 {{< wikipedia "structed ASIC" >}})가 대안이 되는 거 아니냐.. 하는 이야기도 있습니다.  
이런 마켓을 노리고 Altera는 hardcopy라는 칩도 선보였구요..  
하지만, 아직까지는 별로 좋은 반응은 아닌듯 합니다. 초기에는 &#8220;열광적인&#8221; 지지자들이 꽤 많이 나왔는데 말입니다.

국내에서는 한백전자나 휴인스와 같은 FPGA 보드 사업하는 회사가 잘 되고 있지요..  
책또한 국내에서 HDL이나 설계는 대부분 FPGA를 이용한 설계 책들이 주류를 이루고 있지요..  
게다가 xilinx FPGA 관련 책(아래)이 이쪽 분야의 책 치고는 아주 선전했습니다. 이쪽 분야 국내서중에 몇 안되는 유용한 책이었구요.. (저자인 김혁씨는 이제 Xilinx FAE로 들어가신것으로 알고 있으며, 이번에 새 버젼이 나왔습니다. 사실 새 버젼에 대해서는 약간 아쉬움이 있습니다만.. )

<fieldset style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; margin: 10px; width: 90%; padding-top: 5px">
  <legend>Real XILINX FPGA World 8.1 &nbsp;</legend> 
  
  <p>
    <a href="http://www.aladdin.co.kr/shop/wproduct.aspx?ISBN=8982300929&copyPaper=1&ttbkey=ttbbabyworm2309001" target="_blank"><img decoding="async" style="margin: 0px 5px 5px 0px" alt="" src="https://i0.wp.com/image.aladdin.co.kr/coveretc/book/coversum/8982300929_1.jpg?w=75" align="left" border="0" data-recalc-dims="1" /></a>김혁 지음<br /> </fieldset> 
    
    <p>
      &nbsp;
    </p>
    
    <p>
      예전(99년이던가 기억이 가물)에 verilog HDL synthesis라는 Bhasker 책을 랩에서 번역 작업을 한적이 있었습니다. 모든 예제를 synopsys로 합성해서 합성 결과를 같이 보여주려고 했었지요.. 헌데..아마도 국내에서 이 편역본을 출간했으면 망하지 않았을까 생각도 합니다. ^^; 사실 학교에선 강의시간에 synopsys를 사용하는 분들도 없을테고.. 기껏해야 몇몇 대학원생들만 사서 보셨을텐데(엔지니어 분들에게는 너무 쉬운책이니..) 채산성이 안 맞죠..^^;
    </p>
    
    <p>
      음.. 그러고보니.. 글의 제목이 FPGA 이야기 였네요.. -_-;
    </p>