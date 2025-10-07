---
title: verilog PLI 배우기(2); VPI handle
author: babyworm
type: post
date: 2006-05-29T14:36:17+00:00
categories:
  - 'SoC &amp; IP design'
tags:
  - PLI
  - verilog HDL
  - VPI
  - VPI handle

---
지난번에 이야기하고, 너무 많은 시간이 지났군요..  
acc\_, tf\_ 와 다르게 VPI는 handle이라는 데이터 구조체를 이용하여 verilog simulator의 데이터 구조체에 접근합니다.

acc\_, tf\_ 의 경우에도 handle(정확히는 handle이라 부를만한 것)이 없는 건 아니지만, verilog simulator의 실제적인 데이터 object에 직접 접근한다는 개념이 강했습니다. 따라서, 필요한 object의 형태, 크기등의 여러가지 정보를 하나 하나 챙겨봐야 했지요.  
하지만, VPI는 handle이라 불리는 복합적인 데이터 구조체를 이용하고, 이를 기반으로 편하게 verilog simulator의 데이터에 접근할 수 있습니다.

verilog VPI의 handle은 다음과 같이 선언하면 됩니다. (이를 위해서 vpi_user.h 가 include되어야 하는 건 당연하겠죠?)

```c
vpiHandle  myhandle;
```

handle은 verilog simulator와 PLI루틴과의 관계를 정립할때 여러가지 형태를 가질 수 있도록 되어 있는데,  기본적으로 1-to-1 관계, 1-to-many관계, many-to-one의 관계로 나뉠수 있습니다.

각각은 말 그대로 verilog simulator의 객체를 PLI함수에서 볼때 어떻게 볼지에 대한 내용입니다. 이건 예제를 하나씩 보면서 배우면 되겠지요.

우선, verilog simulator에 접근해서 handle을 얻어와야 합니다.  
이러한 동작은 vpi\_handle(), vpi\_iterate(), vpi_scan()과 같은 함수를 통하여 이루어집니다.  
이 중에 vpi_handle()은 one-to-one관계를 만들어냅니다.

```verilog
object_handle = vpi_handle(형태, 인자);
```

위의 함수는 형태와 대상 핸들명을 정하고 이에 맞는 핸들을 얻어오는 것입니다.  
이때 형태를 vpiModule로 하면 verilog simulator의 모듈을 얻을 수 있겠고, callback 함수의 핸들을 얻으려면 vpiSysTfCall를 형태로 지정하면 되겠습니다.

vpiSysTfCall 의 경우 우리가 정의할 시스템 콜에 대하여 적용가능합니다.  
즉, 우리가 시스템 콜을 정의하고, 이것을 verilog simulator에서 사용하는 경우에 이 형태가 vpiSysTfCall이 되는 것이겠죠. 따라서, 만일 우리가 verilog simulator에서 호출된 PLI함수에 어떤 전달 인자가 나왔는지 확인하려면 기본적으로 vpiSysTfCall이라는 형태의 handle을 받아야 합니다.

받아들인 핸들로부터 전달 인자(이것도 역시 핸들입니다.)를 추출하는 건 vpi_iterate() 함수를 사용합니다.  
vpi_iterator는 여러개의 핸들을 몽창~ 추출하는 함수죠.(사실 핸들들을 몽창 이라기 보다, 여러 객체가 존재하는 하나의 핸들이라고 하는 것이 더 맞다고 생각합니다만&#8230;)

iterator는 C++, 특히 STL을 사용하시는 분들은 잘 아시겠지만, 반복자라 이야기하는 것은 여러 연속된 데이터를 순회하면서 데이터를 끄집어내는 형태의 데이터 구조를 뜻합니다. (뭐 예를 들어, linked list도 iterator요, array도 iterator죠.. 즉, 하나의 포인터로 순회하면서 여러개의 데이터에 접근 가능한 모든 데이터 형태를 일반화한 말..이라고 하면 좀 쉬울라나요? 더 어려울 라나요?)

자 간단하게 이 부분 까지의 코드를 만들어 볼까요?

```c++
vpiHandle  myhandle, arghandle;
// 시스템 콜 핸들을 얻어옵시다~
myhandle = vpi_handle(vpiSysTfCall, NULL);  
arg_handle = vpi_iterator(vpiArgument, myhandle);
```

이런식이죠.. 이제 다음에는 조금 더~ VPI의 모델에 대해서 알아보죠~
