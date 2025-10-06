---
title: 변화가 싫다?
author: babyworm
type: post
date: 2007-02-19T13:54:15+00:00
categories:
  - 'SoC &amp; IP design : For beginners'
tags:
  - 버그 트래킹
  - 버젼 관리
  - 코딩 스타일

---
이 이야기는 설계 회사에 들어가실 분들에게 유용할 수도 있는 글이라 생각하여 써봤습니다. ^^;  
&#8212;&#8211;  
차라리 백지가 좋은데, 그렇지 않은 경우가 있습니다.  
학교에서 배워온 코딩 스타일(사실 학교에서 코딩 스타일을 가르쳐주지는 않지요?)과 회사의 코딩 스타일이 다를때 자기 자신이 납득할 때까지 바꾸기도 쉽지 않지요 (그게 바로 엔지니어니까요!)

회사에서는 왜 특정 코딩 스타일을 고집할까요?  
반대로 학교에서는 왜 코딩 스타일에 둔감할까요?

회사에서는 &#8220;칩이 정상적으로 도는 것&#8221;이 가장 중요한 목표인 반면에, 학교에서는 시뮬레이션을 돌려서 &#8220;결과를 뽑는 것&#8221;이 가장 중요한 목표이기 때문이지요. 

따라서, 회사에서는 아주 안전하고, depensive한 코딩 스타일을 유지하게 됩니다. 즉, 시뮬레이션과 합성 이후의 결과에 차이가 나기 어려운 코딩 스타일을 유지한다고 보시면 됩니다. 

학교에서는 아이디어를 빨리 구체화해서 도는 걸 보이는 것이 목표니까.. 약간은 offensive한 문법을 사용합니다. 좀 위험한 넘도 많이 사용하구요. 그래서, 가끔은 질문 게시판에 &#8220;시뮬레이션은 도는데, 합성하면 이상하다.. 툴이 이상한거 아니냐.. &#8220;라는 질문이 올라옵니다. 

이런 측면에서 예전 SIPAC 코딩 스타일이나, RMM의 코딩 스타일 가이드는 실무적으로 아주 중요합니다.  
(SIPAC은 이제 사라졌지만 말입니다.) 학교에서만 끝낼것이 아니라면 RMM<span class="footnote_referrer"><a role="button" tabindex="0" onclick="footnote_moveToReference_249_163('footnote_plugin_reference_249_163_1');" onkeypress="footnote_moveToReference_249_163('footnote_plugin_reference_249_163_1');" ><sup id="footnote_plugin_tooltip_249_163_1" class="footnote_plugin_tooltip_text">[1]</sup></a><span id="footnote_plugin_tooltip_text_249_163_1" class="footnote_tooltip">RMM: Reuse Methodology Manual. Cadence, Synopsys 엔지니어들이 코딩 스타일에 대하여 가장 체계적으로 정리한 실무서입니다. 저는 SIPAC나 IPCOS의 코딩스타일 가이드라인이 모두 RMM에서 출발했다고 보는 입장입니다. ^^; 예전에 학회에서 SIPAC의 서책임님과 이런 이야기를 나누었다가 반박당한적도 있습니다만 ^^; <A href="http://babyworm.net/tatter/43" target=_blank>요기</A>에 간단히 소개되어 있습니다.</span></span> 을 보세요  
&#8212;-

버젼 관리라는 것은 아주 중요합니다. 절대적으로 중요합니다.  
하지만, 학교에서 버젼 관리하는 경우는 거의 못봤습니다.  
회사에서도 하는 회사도 있고, 하지 않는 회사도 있습니다. 

회사에서 소스 코드에 대한 버젼관리를 하고 있다면, 귀찮아하시지 마시고 긍정적으로 따라가십시요. 버젼 관리를 통해서 구원받을 날이 반드시 있습니다.  
그리고, 버젼 관리를 하지 않는다면 반드시 버젼관리를 시작하십시요. <A href="http://www.nongnu.org/cvs/" target=_blank>CVS</A>와 같은 강력한 툴이 있습니다. 하드웨어 검증 책마다 강조하는 것들이 있는데 빠지지 않는 것이 있다면 바로 버젼관리입니다.  
&#8212;

버그 트래킹이란 것이 생소하신가요? 아직 체계적인 버그 보고 체계가 없다면, 지금부터는 고려할 때가 되었습니다. (이건 뭐, 상품 카피 같기도 하네요.. ^^;)  
버그 트래킹은 어찌보면 &#8220;버그를 확인하고, 정확히 정의하고, 동일한 문제가 발생하지 않도록 체계적으로 관리하는 방법&#8221;이라 보는 것이 맞겠습니다. 

<A href="http://trac.edgewall.org/" target=_blank>Trac</A>이나 <A href="http://www.mantisbt.org/" target=_blank>Mantis</A>, <A href="http://www.bugzilla.org/" target=_blank>Bugzilla</A>가 버그 트래킹 시스템에서 가장 많이 알려져 있겠습니다.

저도 사실 위의 3가지를 기반으로 저희 회사에 맞는 방법을 저울질 중인데.. 초반에는 버그 질라에.. 지금은 trac쪽에 약간 무게를 두고 있습니다. 사실 버그 트래킹 기법이라것이 소프트웨어 개발쪽에서 출발한 것이라, HDL에는 약간 귀찮은 면이 있습니다. 

그것보다 더 귀찮을 것이라 생각되는 부분은 &#8220;변화를 싫어하는 마음&#8221;입니다.  
버그 트래킹이나, 버젼 관리 좋다.. (듣기는 들었으니..) 하지만, 나를 귀찮게 하는 건 싫다..  
이런 마음이 가장 문제겠지요..

귀찮더라도 도전합시다.

<div class="speaker-mute footnotes_reference_container">
  <div class="footnote_container_prepare">
    <p>
      <span role="button" tabindex="0" class="footnote_reference_container_label pointer" onclick="footnote_expand_collapse_reference_container_249_163();">Notes & References</span><span role="button" tabindex="0" class="footnote_reference_container_collapse_button" style="display: none;" onclick="footnote_expand_collapse_reference_container_249_163();">[<a id="footnote_reference_container_collapse_button_249_163">+</a>]</span>
    </p>
  </div>
  
  <div id="footnote_references_container_249_163" style="">
    <table class="footnotes_table footnote-reference-container">
      <caption class="accessibility">Notes & References</caption> <tr class="footnotes_plugin_reference_row">
        <th scope="row" class="footnote_plugin_index_combi pointer"  onclick="footnote_moveToAnchor_249_163('footnote_plugin_tooltip_249_163_1');">
          <a id="footnote_plugin_reference_249_163_1" class="footnote_backlink"><span class="footnote_index_arrow">&#8593;</span>1</a>
        </th>
        
        <td class="footnote_plugin_text">
          RMM: Reuse Methodology Manual. Cadence, Synopsys 엔지니어들이 코딩 스타일에 대하여 가장 체계적으로 정리한 실무서입니다. 저는 SIPAC나 IPCOS의 코딩스타일 가이드라인이 모두 RMM에서 출발했다고 보는 입장입니다. ^^; 예전에 학회에서 SIPAC의 서책임님과 이런 이야기를 나누었다가 반박당한적도 있습니다만 ^^; <A href="http://babyworm.net/tatter/43" target=_blank>요기</A>에 간단히 소개되어 있습니다.
        </td>
      </tr>
    </table>
  </div>
</div>