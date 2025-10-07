---
title: TLM으로 설계가 이동할 것인가?
author: babyworm
type: post
date: 2006-10-23T02:04:10+00:00
categories:
  - verification
tags:
  - Assertion
  - AVM
  - HVL
  - SCV
  - synopsys
  - SystemC
  - SystemVerilog
  - verilog HDL
  - 검증

---
Transaction Level Modeling(이후 TLM)이라는 것이 한 2-3년전부터 SoC설계 분야에서 논문/책/툴을 쏟아내고 있습니다. 그만큼 이제 시장 상황이 익어간다는 것이겠지요.

하지만 설계라는 분야에서 RTL에서 TLM 수준으로 추상화 수준이 이동할 것이라고 믿었던 사람들도 이제는 거의 TLM 수준에서 설계가 이루어질 것이라 믿고 있지 않습니다. 그 이유는 무엇일까요?

예전에 schematic capture수준에서 HDL을 기반으로 하는 RTL수준으로 설계가 옮겨 갈수 있었던 가장 큰 이유는 logic synthesis 기술의 혁신적인 발전에 있습니다.  
(저가 처음 digital logic 설계를 배우던 시절이 이 개념이 한창 바뀌던 시절이었던것 같습니다. 학부 3학년때는 schematic capture툴로 설계를 했는데, 학부 4학년때는 VHDL을 시작했거든요.. 개인적으로는 schematic capture툴로 설계를 시작한 것이 설계의 기본기를 많이 배울수 있었던 기회였기에 아주 행운이었다고 생각합니다. )  
초기에 logic synthesis는 사실 (전문가가 한) schematic 설계보다는 못하지만, 그 생산성에 있어서 비교할 수 없이 훌륭했고, 어느정도 시간이 흐른 이후에는 설계의 질 또한 훌륭한 수준이 되면서 대부분의 설계가 RTL에서 이루어지게 되었습니다. (물론, 아직도 schematic capture를 이용하여 설계하시는 분들이 계십니다. 몇년전에 일본에서 온 할아버지 엔지니어였던 야노상.. HDL도 잘 모르고, STA도 몰라서 같이 일하는데 아주 괴롭고, 걱정스러웠습니다만.. 동작 잘하는 칩을 만드는 엔지니어였습니다. ^^; 일면 부럽기도 하고요..그 나이까지 엔지니어를 한다는 것이요..)

TLM 수준에서 설계가 이행되지 못하고 있는 큰 이유는 구현(implementation)을 위하여, 손으로 재설계를 해야 하기 때문입니다. 즉, TLM으로 만들고 난 이후에 이를 RTL로 이전시킬 만한 (괜찮은) CAD 툴이 아직 없다는 것이 문제입니다. 

뭐, 여러가지 시도가 있기는 합니다만.. 99년에 제가 한창 CAD 알고리즘을 공부할때 behavioral synthesis라는 논문들을 보고.. 이거 돈 되겠다.. 라고 생각했었는데..^^; 사실 이 분야에서 제대로 된 CAD툴이 아직도 못나오고 있는 실정입니다. (비슷한 것으로 자연어 통역기.. 70년대부터 계속 연구되었지만.. 아직까지 못나오고 있습니다&#8230; 인공 지능 분야에서 나오지 못할것으로 예상되는 프로젝트 중의 하나로 나와있더군요..^^; 아직 연구는 많이 하지만요..)  
여하튼.. TLM 수준에서 RTL로 가는 건 앞에 말한 예보다는 쉬운 것이니 향후 몇년 내에 나올것이라 예상됩니다만.. 아직은 아닌 것이지요..

그럼.. TLM 수준의 설계는 이대로 사망하는 건가요? 

**TLM은 검증을 싣고..</p> 

</strong>TLM이 새로운 개념이 아니라는 것은 {{< wikipedia "verification" >}} engineer쪽에서는 기본입니다.  
왜냐.. 예전부터 검증계에서는 TLM이 좋은 방법이었거든요..  
SystemC는 이제 설계 언어라기 보다 검증언어입니다. 물론, architectural simulation하려고 할때 timed model을 예전 C++만을 이용할때 보다 아주 편하게 해주기는 합니다만, 이것이 설계는 아니지 않습니까&#8230;

이런 모습을 반영하듯, 초기 systemC는 synopsys에서 synthesizable subset을 지정하고 했습니다만.. 설계 언어로는 대부분 아무도 사용하지 않습니다. (정말 불편하죠..)

이제 SystemC에 추가되고 있는 기능은 대부분 검증 관련입니다. HVL(Hardware verification language)로의 확장에 역점을 두는 것이지요..

SystemVerilog도 마찬가지 입니다. verilog 2001에서 확장되어 발표된 SystemVerilog는 System설계 언어라기 보다 현재로서는 Verilog+HVL이라 할 수 있습니다. (많이 약합니다만..) 

**TLM기반의 SystemC, systemVerilog의 확장 라이브러리들  
**  
{{< wikipedia "SystemC" >}}에서는 {{< wikipedia "Cadence" >}}의 [TestBuilder][1](이제는 CVE), 그리고, 이를 기반으로 한 [SCV][2]가 있습니다.  
또한, 최근 멘토에서 AVM(Advanced Verfication Method)라는 검증 methodology(실은 라이브러리)가 나왔습니다. ([http://www.mentor.com/products/fv/\_3b715c/cb\_download.cfm][3]). 아마도 Cadence가 donation한 SCV(SCV good to go. Sir! ^^;)에 대한 대항마로 생각되는 부분이 많은데요.. 둘다 무료이고, 공개된 library이니까 설계하는 저희들이야 고맙죠.  
국내에서는 [CoSOC][4]이라는 서울대 사업단에서 SCV기반의 검증 라이브러리가 나왔는데.. &nbsp;저는 사실 교육을 받고 왔지만 아직도 목적성을 잘 모르겠더군요.. 아무래도 업체가 아니고, 학교 연구소에서 국책 과제로 수행하는 것이다보니 완성도가 아직은 부족한 것 같습니다. (흠..이름을 잊어서 홈페이지에 가봤는데 없는 걸 보니 그냥 접었나보군요)

두 라이브러리 모두 역점을 두고 있는 부분이 {{< wikipedia "assertion" >}}, functional coverage, constrant random vector generation입니다. 사실 검증에 있어서 coverage directed constrant random testing이 대세니까요.. 

요즘에 검증쪽 일을 할라고 슬슬 작업중인데.. 음.. 삽질을 많이 할듯 해서 걱정입니다.

 [1]: http://www.testbuilder.net/
 [2]: http://systemc.org
 [3]: http://www.mentor.com/products/fv/_3b715c/cb_download.cfm
 [4]: http://soc.snu.ac.kr