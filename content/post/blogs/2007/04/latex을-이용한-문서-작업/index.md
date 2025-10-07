---
title: LaTeX을 이용한 문서 작업
author: babyworm
type: post
date: 2007-04-04T14:15:08+00:00
categories:
  - 개인적인
tags:
  - KC2006
  - LaTeX
  - 장단점

---
대부분의 회사에서 MS office를 기반으로 문서 작업을 하실텐데요. 저희 회사도 별다르지 않습니다. 그런데, 회사에서 &#8220;워드&#8221;로 문서 작업할 때 고생을 많이 하는 것이, 그림이 많아지면 열 때 한참 시간이 걸린다거나, 다른 부분의 내용을 갖다 붙이면 열심히 붙여둔 제목 순서가 어긋나 버린다던지.. 그런 일이 빈번합니다. 

  


개인적으로 CVS의 열성적인 사용자인데, {{< wikipedia "CVS" >}}에서 binary형식의 word파일은 사실 버전 관리가 정상적으로 이루어진다고 볼 수 없죠(수많은 카피본을 만들뿐이니까요.). 그래서, 한 2년 전부터 간단한 문서는 MS word로, 매뉴얼과 Technical report는 {{< wikipedia "LaTeX" >}}으로 작성하고 있는데 아주 성공적으로 정착했다고 개인적으로 자평합니다. 

  


많은 분들께서 LaTeX를 들어보셨을텐데, 많이들 힘들어 하는 이유가 &#8220;한글 사용이 어려워서..&#8221;, &#8220;설치 운용이 어려워서&#8221;입니다. 텍스트 창에서 명령을 써야 한다는 점은 적어도 프로그래밍 언어를 많이 사용하는 사람들한테는 별로 단점은 아닌 것 같습니다. (가끔 귀찮을 때는 있지만 말입니다.). 그런데, 이런 설치/운용에 대한 문제는 KTUG에서 제작한 KC2006을 기점으로 사라졌다고 생각합니다. 팀의 후배들한테 소개해주었는데, 다들 쉽게 설치/운용하고, 어렵지 않게 적응하더군요. 

  


이제, 저희 팀에서는 내부적으로 {{< wikipedia "LaTeX" >}}/<A href="http://faq.ktug.or.kr/faq/KTUGCollection2006" target=_blank>KC2006</A>(실제적으로는 KC2006-2)을 기반으로 하는 환경에서 작업을 하려고 합니다. 이렇게 함으로써 작업 있어서 몇 가지 장점이 생기는데요.. 

  


<OL style="MARGIN-LEFT: 40pt">
  <br /> 
  
  <LI>
    PDF writer가 필요 없다. (LaTeX은 양질의 PDF를 만들어 줍니다!)
  </LI>
  <br /> 
  
  <LI>
    공동 작업에 있어서 CVS를 이용하고, 이에 따라 문서의 버전 관리가 쉬워진다
  </LI>
  <br /> 
  
  <LI>
    자유로운 comment 사용이 가능하기 때문에 좀더 명확한 문서 작성이 가능하다.
  </LI>
  <br /> 
  
  <LI>
    일관된 문서 형식을 유지하기가 수월하다
  </LI>
  <br /> 
  
  <LI>
    조건부 문서 작성이 쉽다. (어떤 peripheral이 포함되는지, 어떤 feature가 포함되는지에 따라 compile time에 문서를 포함하는.. single sourcing이라고 하신 거 같은데..)
  </LI>
  <br /> 
  
  <LI>
    소소하지만.. 제가 회사 문서를 위하여 작성한 <A href="http://www.acrosoft.pe.kr/" target=_blank>Acroedit </A>스크립트, 회사 문서 스타일등을 사용할 수 있습니다. verilog 소스 코드를 위한 스크립트 라던지.. ^^;
  </LI>
</OL>

  


위의 장점은 워드로도 가능합니다만, LaTeX을 사용하면 더 효과적이 되는 부분이지요. 물론, 단점도 존재합니다. 어찌보면 제가 LaTeX을 사용하면서 느끼는 문제일 수도 있습니다. 

  


<OL style="MARGIN-LEFT: 40pt">
  <br /> 
  
  <LI>
    표 작성이 어렵다. <br />하드웨어쟁이들은 비트당 뭐뭐뭐 하는 걸 표로 많이 표시하는데, LaTeX로 작성하면 좀 귀찮아집니다. 이럴때는 Excel로 표를 만들고 <A href="http://faq.ktug.or.kr/faq/OLETeX" target=_blank>OLETeX</A>를 이용해서 그림으로 변환한 다음에 TeX에 삽입하는 편법을 사용합니다. <span class="footnote_referrer"><a role="button" tabindex="0" onclick="footnote_moveToReference_264_177('footnote_plugin_reference_264_177_1');" onkeypress="footnote_moveToReference_264_177('footnote_plugin_reference_264_177_1');" ><sup id="footnote_plugin_tooltip_264_177_1" class="footnote_plugin_tooltip_text">[1]</sup></a><span id="footnote_plugin_tooltip_text_264_177_1" class="footnote_tooltip">OLETeX는 OLE기능을 위하여 사용할 수도 있습니다만, 저는 개인적으로 EPS 생성 프로그램으로만 사용합니다. ^^; WMF2EPS를 원래 썼었는데, shareware이기도 하고.. OLETeX가 떨어지는 부분을 잘 모르겠더군요. </span></span>
  </LI>
  <br /> 
  
  <LI>
    다른 사람들의 저항감이 있다<br />특히 관리부터 사람들과 윗분들…
  </LI>
</OL>

  


그래서, 내부적으로만 일단 사용할 예정이죠. 사실 이런 문제는 굳이 말로 떠들어봤자 힘만 들거든요. 직접 보여주는 것이 최선이라 생각합니다. 

  


혹시 관심 있으신 분은 <http://www.ktug.or.kr/>에 방문해 보십시요. 

<div class="speaker-mute footnotes_reference_container">
  <div class="footnote_container_prepare">
    <p>
      <span role="button" tabindex="0" class="footnote_reference_container_label pointer" onclick="footnote_expand_collapse_reference_container_264_177();">Notes & References</span><span role="button" tabindex="0" class="footnote_reference_container_collapse_button" style="display: none;" onclick="footnote_expand_collapse_reference_container_264_177();">[<a id="footnote_reference_container_collapse_button_264_177">+</a>]</span>
    </p>
  </div>
  
  <div id="footnote_references_container_264_177" style="">
    <table class="footnotes_table footnote-reference-container">
      <caption class="accessibility">Notes & References</caption> <tr class="footnotes_plugin_reference_row">
        <th scope="row" class="footnote_plugin_index_combi pointer"  onclick="footnote_moveToAnchor_264_177('footnote_plugin_tooltip_264_177_1');">
          <a id="footnote_plugin_reference_264_177_1" class="footnote_backlink"><span class="footnote_index_arrow">&#8593;</span>1</a>
        </th>
        
        <td class="footnote_plugin_text">
          OLETeX는 OLE기능을 위하여 사용할 수도 있습니다만, 저는 개인적으로 EPS 생성 프로그램으로만 사용합니다. ^^; WMF2EPS를 원래 썼었는데, shareware이기도 하고.. OLETeX가 떨어지는 부분을 잘 모르겠더군요.
        </td>
      </tr>
    </table>
  </div>
</div>