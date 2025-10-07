---
title: 'verilog-mode: verilog coder를 위한 Emacs의 친구..'
author: babyworm
type: post
date: 2006-09-19T23:55:00+00:00
categories:
  - 'SoC &amp; IP design'
tags:
  - emacs
  - verilog-mode
  - verilogHDL

---
> 태초에 두가지 에디터를 종교로 삼는 집단이 있었으니, 한 부류는 vi를 숭배했으며 또한 부류는 emacs를 숭배하였다.

종종 신앙으로까지 불리울 정도로 {{< wikipedia "Emacs" >}}나 {{< wikipedia "vi" >}}는 폭넓은 사용자 층을 지니고 있습니다. 물론, 국내에서는 unix/linux환경보다는 압도적인 PC환경이고, 설계도 왠만하면 PC에서 수행하려는 경향이 강한지라.. {{< wikipedia "ultraedit" >}}나 {{< wikipedia "acroedit" >}}를 좋아하시는 분들이 더 많습니다.

물론, 한번 빠져들면 종교가 될 정도로 강력한 vim+ctags 의 조합은 대부분의 PC용 에디터보다 훨씬 좋았습니다. 그러한 종교를 개종 시킬만큼 강력한 강적이 나타났으니 바로 {{< wikipedia "verilog-mode" >}} 입니다.<br>
최근 {{< wikipedia "linux" >}}의 emacs에는 대부분 verilog-mode가 같이 깔려 있는데, 특히 top module에서 하위 모듈을 instantiation할때 엄청나게 편합니다!!!!!

간략하게 설명드리자면, {{< wikipedia "verilog" >}} mode는 emacs에서 사용되는 verilog 입력 모드인데, AUTO라는 강력한 기능이 있습니다. 예를 들어, `/*AUTOARG*/`같은 경우

```
module aaa(/*AUTOARG*/);
```

와 같이 적어두고, 필요한 입출력들을 기술하면 module의 argument는 자동적으로 생성됩니다.

가장 강력한 기능이라 생각하는 부분은 `/*AUTOINST*/`기능인데, 이 기능은 만일 aaa라는 모듈을 instantiate할때

```
aaa U0_aaa(/*AUTOINST*/)
```

라고만 적어두면, 자동적으로 aaa.v를 읽고, 그 입출력을 분석해서 `/*AUTOINST*/`라고 되어 있는 부분에 name based instantiation을 수행합니다.

회사 후배들에게 농담으로 하는 말로, 1시간은 낑낑댈거, 10초면 합니다. 단순히 Ctrl-C, Ctrl-A를 눌러서 원하는 하위 모듈을 instance할 수 있으니까요. 그래서, 재미삼아 xemacs에서 verilog mode를 한번 쓴 이후에는 계속 emacs에 적응중입니다. (물론, vim에서 emacs batch command로 설정해서 verilog mode를 사용할 수도 있습니다. 그런데, 스타일이 별로입니다. (탭이 들어가죠..전 탭을 싫어해서.))

emacs 자체도 상당히 강력한지라 (역시 종교라니까요~), 즐겁게 작업할 수 있습니다.

개인적으로는 verilog mode의 단점으로 몇몇 환경 설정에서 단점이 보였습니다.<br>
우선, `/*AUTOARG*/` 나 `/*AUTOINST*/` 에서 출력, 입력 순으로 나열되는 것입니다.<br>
이건, 사실 예~~~전의 primitive를 만들때의 design rule이고, 요즘 RMM 룰로 보았을때는 클럭,리셋,입력,출력의 순이 되어야 정상인데 말입니다.

그래서, input/output 순서가 가능한한  RMM의 형식에 맞도록 수정된 verilog-mode를 만들어 봤습니다. Lisp를 잘 몰라서, 대충만 바꿨지만 쓰는데 문제는 없어 보입니다.

또, 국내 실정상 linter를 잘 쓰지 않기 때문에 이 부분은 nc-verilog에서 문법 체크만 하는 옵션으로, 헤더는 개인적인 license헤더로 수정되어 있습니다.  필요한 경우 그 부분만 수정하시면 되겠습니다.

verilog-mode에 유용한 자료로서, 저자가 SNUG에서 발표한 verilog-mode의 간략한 설명입니다.

  * [http://www.veripool.org/papers/verilog-mode\_veritedium\_20090925.pdf][1]

이걸 보시면, verilog-mode가 어떤것인지 아주 쉽게 이해가 되실것입니다.
.. 여담이지만, 외국 SNUG에서는 이런 좋은 발표가 많은데&#8230; 유독 SUNG korea의 경우는 좀 약한 면이 없잖아 있어서 아쉽습니다.

verilog mode에 대한 자세한 사항은 <http://www.verilog.com/> 혹은 [http://www.veripool.com/][2] 에서 해당 자료를 얻을 수 있습니다.

 [1]: http://www.veripool.org/papers/verilog-mode_veritedium_20090925.pdf
 [2]: http://www.veripool.org/wiki/verilog-mode
