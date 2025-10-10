---
title: Verilog newsgroup에서의 몇가지 이야기
author: babyworm
type: post
date: 2006-11-04T12:59:53+00:00
categories:
  - SoC
  - IP design
  - For Beginners
tags:
  - Coding Guideline
  - verilog HDL
  - zero padding

---
verilog news group에는 여러가지 verilog 관련 이야기가 나오는데.. 몇가지만 옮겨 봅니다.

## Implicit Zero Padding?
verilog의 bit 확장에 대한 부분인데요.. 간략히 써보면 다음과 같은 질문입니다.


> verilog가 큰 수에 작은수를 대입할때 ‘0’으로 채우는 것으로 알고 있어.

``` verilog
module tilde (output reg[7:0] z, input [3:0] a);
    always @* begin
      z = ~a;
    end
endmodule
```
>
> 위의 예에서도 상위 4비트는 ‘0’이 되어야 겠지? 하위 4비트는 당연히 a의 반전이겠지만 말야.. 근데, 적어도 modelsim에서는 상위 4비트가 항상 1이 된다! 내가 잘못 이해한거야? 아님 모델심 문제야?

여기에 대해서 여러가지 대답들이 있는데.. 대답을 보기전에 우선 몇가지 정리해 보시지요..^^;<br>
기본적으로 큰 값에 대한 assign시에 RHS의 값이 LHS값보다 작은 경우 그 값은 확장되면서 상위값은 ‘0’으로 채워집니다. 왜냐하면 verilog에서 기본적으로 다루어지는 수치형은 ‘unsigned’이기 때문이죠.<br>
verilog 2001에서는 signed라는 예약어가 들어가서 signed 수로 인식되기도 합니다만, 위의 예에서는 관련이 없겠지요?

질문자는 assign 동작이 ~(inversion)보다 늦게 일어나므로, inversion 이후에 assign이 일어나야 하며, assign과정에서 확장 동작이 일어나야 하는데, 왜 동작은 inversion이전에 크기 확장이 일어난것 같이 동작하느냐는 것이 가장 중요한 질문의 요지입니다.

그런데, 위의 예에서는 왜 ‘1’로 채워지는 것일까요? 이것은 verilog에서 연산을 처리하는 rule과 관계가 있습니다.<br>
이 문제에 대하여 지존급의 대답을 해준 케이던스의 sharp님의 글을 보면 아주 명확히 설명하고 있습니다.

> Verilog first determines the width of an expression based on the largest operand in it, including the LHS of any assignment.  Then it extends all operands (actually, all context-determined operands) to the width of their expression before performing any operations.  All extensions are done as early as possible, in an attempt to avoid overflows in intermediate results.

가장 중요한 verilog 연산에서의 크기 확장 법칙이 위의 법칙입니다. 즉, 연산 이전에 **"LHS를 포함한 모든 연산 요소를 살펴보아서 가장 큰 값에 맞추어 값을 확장하는 것"** 입니다. 이는 “C”언어에서의 type casting rule과 완전히 다르기 때문에 많은 분들이 헷깔리게 되는 것이지요.

sharp님이 추가적으로 설명한 부분은 사실 저도 정확히는 모르고 있던 부분인데.. (경험으로는 알고 있었습니다만, 명확한 이론은 없었습니다.) 연산에 따른 확장에 대해서 알려주고 있습니다.

> When the result of an operation will have a fixed width regardless of the width of its operand, there is no reason for the operand to care about the width of the context.  This is true of the reduction operators.  The result will always be 1 bit, no matter what the operand width is.  There is no point in extending the operand.  Instead, the 1-bit result will be extended to the width of the expression as soon as it is produced.  The operand of a reduction operator is<br>
> self-determined.<br>
> On the other hand, all the bits of a bitwise NOT will be available to the expression containing it, and may be assigned or used in another bitwise operation.  So the operand of a bitwise NOT is context-determined.
>
> But one has a self-determined operand and the other has a context-determined operand.  The Verilog LRM fully specifies this for all the operands of all the operators.  They generally follow a logical scheme that makes sense.  And again, in most cases they are designed to give reasonable results, so that most users don’t have to worry about them.

상당히 어려운 이야기인 것으로 보입니다만, 실은 같은 width를 보장해야 하는 연산과 그렇지 않은 연산이 있고, 이에 따라 확장을 하는 부분이 있다.. 라고 요약하시면 되겠습니다. 위의 룰은 처음 설명 드린 룰의 보충내용이므로 그리 중요하지는 않습니다.

이러한 문제는 “고민을 시작하면” 엄청나게 신경쓰이는 문제이므로, 일반적인 coding style을 따져서 문제가 될만한 부분을 초기에 잡아나가는 것이 현명하겠습니다.<br>
즉, 1) verilog coding시에서 width 지정을 정확히 하고, 확장이 필요한 경우 명시적으로 concat operation을 쓰자. 2)일반적으로 width를 지정하지 않은 상수는 verilog에서 32bit으로 처리되므로, 이로 인해 원하지 않는 동작을 피하고 싶으시다면, 항상 상수를 지정할때 width를 지정하는 하자.<br>
이런 일반 룰만 지키신다면 머리 아플일이 없겠지요..^^;

좋은 Coding Style의 존재 이유가 “불명확한 코드로 나중에 머리 아프지 말고 코딩 부터 잘하자..”이런 것이니까요..^^;

추가적으로..<br>
comp.lang.verilog에 인터뷰에서 asynchonous설계시 주의할점에 대해서 물어봤는데.. 대답을 못했다는 내용도 있네요.^^; 얼마전에 이야기한 [metastable에 대한 이야기](https://babyworm.net/post/blogs/2006/10/metastable%EB%AC%B8%EC%A0%9C%EC%99%80-clock-domain-crossing%EB%AC%B8%EC%A0%9C/)를 묻는 것이지요.. 정말 많이 물어보는 질문이기는 한가보군요..
