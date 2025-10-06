---
title: 몇일전에 쓰려다 잊어버리고 못올린 글..
author: babyworm
type: post
date: 2018-04-11T15:20:54+00:00
categories:
  - 개인적인

---
제목 그대로 한 두주 정도 전에 여러가지 소소한 내용을 적은 글인데, 잊고 있었습니다. 쩝..

중간 중간 끊겨서 뭘 쓰려고했던건지도 모르겠습니다만, 그냥 두기 뭐해서..

1.

AOM에서 만든 AV1의 [specification][1](draft)이 release되었습니다. Repository로 봤을때 실제로는 아직 normative defect가 몇 개 남아있기 때문에 software가 완전히 release된 건 아니지만, [남은 문제][2]가 대부분 high level이라 Tool은 끝났다고 볼 수 있습니다(잠시 봤는데, 글을 쓰는 시점에서 5개 남았네요).

AV1의 기반은 Google의 VP9을 experiment build(이후 VP10을 만들기 위해서 실험하던)에 Mozilla의 [Daala][3]와 Cisco의 [Thor][4]에서 좋은 점들을 고르고, 많은 회사들이 참가해서(적극적이진 않았지만 저희 회사도.. )  작업이 진행되었습니다.

&nbsp;

2.

드디어 Cadence의 Genus가 합성 부분에서 Synopsys의 Design Compiler를 위협할 정도가 된것일까요? [Deepchip][5]의 내용을 따라가보면, 그동안 계속 언급되어오던 DSM 환경에서의 ICC2의 부정확성 문제를 Cadence의 Innovus가 공략하면서, 합성툴에도 영향을 끼쳤다고 봐야겠습니다.

사실 SoftIP를 하는 회사에 있다보니, 약간 느슨하게 합성하고, 마진을 더 허용해서 고객사 입장에서 조금 더 높은 주파수를 얻을 수 있도록 하는게 유리하긴 합니다 (빡빡하게 합성해서 결과를 주면, 고객사에서는 그 이상으로 해야 할테니)  
이런 환경에서 예전에 SoC를 만들던 시절보다는 physical synthesis에 약간 둔감해지는 건 어쩔 수 없는 것 같습니다만, 역시 알아듣기는 해야 하니 열심히 따라가고는 있습니다. ㅎㅎ

&nbsp;

&nbsp;

3.

올해는 DVCON대신 DVCON china를 갈까 했었는데, 생각보다 들리는 이야기가 좋지는 않은 것 같습니다. 다른 걸 알아봐야 하겠습니다.

&nbsp;

4.

[RISC-V][6]를 유심히 보고 있습니다. 사실 지켜본지는 좀 되었는데, 작년 DAC에서 RISC-V section에 참석한 이후부터 본격적으로 들여다보고 있습니다.

아마 제가 프로세서 설계를 계속하고 있었다면, RISC-V 호환 IP와 디버깅 시스템을 만드는데 집중했을 겁니다. (사실 RISC-V 페이지에 몇개 있습니다만..) 예전 프로세서 설계를 하면서 항상 고민이었던 것이 &#8216;개발 환경&#8217; 이었는데, 이 부분이 어느 정도 해소 되니까요.  관심있으신 분들은 조금 신경써보시는 것도 좋을 것 같습니다. (혹시 국내에는 RISC-V에 관심 있으신 분이 없으시려나..)

&nbsp;

5.

올해는 효율성을 높이는데 집중해볼 생각입니다. 이제 벌써 4월이니, 하반기 목표라 해야 할까요?

 [1]: https://github.com/AOMediaCodec/av1-spec/blob/master/docs/av1-spec.pdf
 [2]: https://bugs.chromium.org/p/aomedia/issues/list?can=2&q=Hotlist%3DAV1-Normative
 [3]: https://wiki.xiph.org/Daala
 [4]: https://en.wikipedia.org/wiki/Thor_(video_codec)
 [5]: http://www.deepchip.com/items/0582-01.html
 [6]: https://riscv.org/