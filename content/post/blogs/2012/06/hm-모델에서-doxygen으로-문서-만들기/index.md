---
title: HM 모델에서 doxygen으로 문서 만들기
author: babyworm
type: post
date: 2012-06-26T13:47:13+00:00
categories:
  - 'SoC &amp; IP design'
  - verification

---
이거 사실 어려운 거 아닌데, 생각보다 모르시는 분들이 많으시네요..

HM model에 보면 doc directory에 doxygen을 통해서 문서를 생성할 수 있도록 설정이 되어 있고,  [graphviz][1]를 이용해서 아주 훌륭한 class 상속관계도를 볼 수도 있습니다.

저는 Linux에서라면야 대부분 깔려있겠지만, 혹시라도 안깔려 있다면 sudo apt-get이나 sudo yum install 통해서 doxygen package와 graphviz package를 설치하십시요.

이후에는 doc 디렉토리에서 doxygen이라고 입력하시면 html 디렉토리가 생기고, 거기에 있는 index.html을 web browser로 보시면 됩니다. (보시면 HM 3.4라고 적혀있을텐데, 살포시 무시하십시오. 그건 그냥 doxygen configuration에 그렇게 적혀 있으니 그런 겁니다.)

windows의 경우 저는 cygwin 신봉자(?)라서..

cygwin의 setup program을 통해서 마찬가지로 doxygen을 설치하시고..

graphviz의 cygwin port를 [여기에 나온 설명][2]대로 설치합시다. 요약하면, cygwin terminal에서 아래 명령을 통해서 setup을 실행시키고(당연히 cygwin setup입니다!!)

```
cygstart -- /path/to/setup.exe -K http://cygwinports.org/ports.gpg
```

설치할때 여러 미러 중에서  <ftp://ftp.cygwinports.org/pub/cygwinports> 를 선택해서 사용하는 것입니다. 위의 미러를 선택하면 graphviz package가 보이므로, 이를 설치하면 됩니다.

쉽죠?

p.s.

살짝 관계없는 이야기인데.. 예전에 doxygen 가지고 verilogHDL 문서를 만들면 어떨까해서, 이런 저런 scripting을 했던 경험이 있는데 별로 만족스럽지는 못했었습니다.

그런데, 이번에 doxygen보는 김에 생각나서 보니, systemverilog에서 doxygen을 사용하는 것이 가능하더군요. (물론, 스크립트를 통해서기는 하지만..)

음.. 써봐야지.. 🙂

 [1]: http://www.graphviz.org/
 [2]: http://sourceware.org/cygwinports/