---
title: Modelsim에서의 Code Coverage
author: babyworm
type: post
date: 2008-12-05T05:34:35+00:00
url: /archives/1320
categories:
  - verification
tags:
  - Code Coverage
  - 검증

---
예전에 후배가 한 세미나 자료에서 그림을 많이 발췌합니다. 

 

항상 검증을 언제 끝낼 것인가 하는 문제는 어렵습니다. 그래서, 검증할 때 coverage를 측정하여 검증을 언제 마칠것이냐 하는 것을 참고하게 됩니다. Functional verification때 고려하는 coverage로는 code coverage와 function coverage라는 것이 있는데, code coverage는 RTL 코드에 대한 분석을 기반으로 해당 문장이나 표현, 가능한 데이터 흐름이 현재 사용하고 있는 test program(혹은 stimulus) 에 의하여 어느 정도 수행되었는지 측정하는 것입니다. 

즉, 여러분께서 RTL 코드를 만들었으니, 적어도 검증 중에 여기에 기술된 문장/표현/데이터 흐름은 모두 검증하는 것이 필요하다는 것이지요. 

Functional coverage의 경우 사용자가 어떤 동작(function)을 수행하기 위하여 RTL 코드를 만들었으니, 이 stimulus에 의하여 해당 동작이 수행되었는지 확인하는 것입니다. 그런데, 툴은 이 RTL이 어떤 동작을 위하여 만들어진 것인지 알지 못하므로 assertion과 같은 방법을 이용하여 functional coverage를 잡아야 합니다. 

 

여하튼, 본론으로 들어와 code coverage, 특히 line coverage에 있어서는 Modelsim이 상당히 편합니다. Modelsim에서 code coverage를 측정하는 건 상당히 쉽습니다. Modelsim 콘솔에서 다음과 같이 하면 되지요. 

 

<div>
  <table style="border-collapse:collapse; background: #fde9d9" border="0">
    <colgroup> <col style="width:637px"/></colgroup> <tr>
      <td style="padding-left: 7px; padding-right: 7px; border-top:  solid black 0.5pt; border-left:  solid black 0.5pt; border-bottom:  solid black 0.5pt; border-right:  solid black 0.5pt">
        <ol>
          <li>
            <div style="text-align: justify">
              <span style="font-family:Courier New; font-size:10pt">vsim –coverage [Top Module Name]<br /> </span>
            </div>
          </li>
          
          <li>
            <div style="text-align: justify">
              <span style="font-family:Courier New; font-size:10pt">view_coverage<br /> </span>
            </div>
          </li>
          
          <li>
            <div style="text-align: justify">
              <span style="font-family:Courier New; font-size:10pt">code coverage –file [File Name] –lines<br /> </span>
            </div>
          </li>
          
          <li>
            <div style="text-align: justify">
              <span style="font-family:Courier New; font-size:10pt">coverage reload [File Name]<br /> </span>
            </div>
          </li>
        </ol>
      </td>
    </tr>
  </table>
</div>

 

예를 하나 들어볼까요? 아래와 같은 4bit ALU를 코드가 있다고 하면, 의미 있는 동작이 있는 코드는 박스를 친 부분들일 것입니다. 

<img decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile4.uf.117962554D6A7AFE31DE8D.png?w=625" alt="" data-recalc-dims="1" /> 

 

이것을 다음과 같은 테스트 벡터로 동작시켜 봅시다. 

 

<img decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile23.uf.17613D4F4D6A7AFE26CAB5.png?w=625" alt="" data-recalc-dims="1" /> 

 

이 경우 모든 line에 대하여 cover가 되므로, coverage가 100%가 되고, 해당 RTL에서 그 문장이 몇번 동작하였는지 보여줍니다. 

<img decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile25.uf.147C7C554D6A7AFE27AE35.png?w=625" alt="" data-recalc-dims="1" /> 

<img decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile4.uf.112B95494D6A7AFE10D3D6.png?w=625" alt="" data-recalc-dims="1" /> 

간단하죠. 

 

Cadence의 경우도 비슷한 code coverage툴이 있습니다. 전용 툴도 몇 개 있구요. 요즘엔 위와 같은 Line coverage이외에 앞에 설명한 path, toggle등의 복잡한 coverage도 잡아주므로 많은 도움이 되지요. 

 

참, 일반적으로 line coverage는 반드시 100%를 충족시켜야 하며, path coverage의 경우도 100%에 근접하도록 해야하는 것으로 알려져 있습니다. ^^; 

 

 