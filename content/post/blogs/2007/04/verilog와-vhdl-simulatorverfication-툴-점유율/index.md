---
title: Verilog와 VHDL.. Simulator/Verfication 툴 점유율
author: babyworm
type: post
date: 2007-04-28T16:04:15+00:00
categories:
  - 'News on SoC &amp; IP design'
tags:
  - Cadence
  - Debussy
  - Mentor
  - NCsim
  - NCverilog
  - Novas
  - synopsys
  - VCS
  - Verdi

---
<DIV style="BORDER-RIGHT: #fff200 1px solid; PADDING-RIGHT: 10px; BORDER-TOP: #fff200 1px solid; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #fff200 1px solid; PADDING-TOP: 10px; BORDER-BOTTOM: #fff200 1px solid; BACKGROUND-COLOR: #ffffcc">
  이 포스팅은 DVCon07에서 <A href="http://www.deepchip.com/">ESNUG</A>의 John Cooley가 참석자 800여명을 <A href="http://www.deepchip.com/items/dvcon07-02.html">대상으로 조사한 </A>내용을 바탕으로 하고 있으므로, 전체 시장 점유율이나 비중을 반영한다고 이야기할 수는 없습니다. 하지만, DVCon에 참석하는 사람들이 각 사의 funcational verification을 담당하고 있는 사람이 대부분이라는 점에서 이쪽 분야의 &#8220;향후&#8221; 경향을 대변하는데는 부족함이 없을 것이라 생각됩니다.
</DIV>

  


### Verilog HDL이 대세다!

  


이 이야기는 제 Blog전반에 걸쳐서 몇번 이야기 했었습니다. HDL을 배우고 사용하는데 있어서 Verilog HDL이 대세라는 것이지요. John Cooley는 VHDL을 고수하는 업체는 미군과 계약하고 일하는 업체나 일부 유럽 회사밖에는 없다고 이야기합니다. (VHDL을 미국방부에서 만들었으니 아직도 이쪽에 납품하려면 써야 하나봅니다.)

  


<DIV style="BORDER-RIGHT: #cccccc 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #cccccc 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #cccccc 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #cccccc 1px dotted; BACKGROUND-COLOR: #f7f7f7">
  <br /> 
  
  <P>
    <FONT face="'courier new',courier,monospace">&nbsp; Verilog only : ############################ 55.3% <br />mostly Verilog : ######### 18.0% <br />&nbsp;both equally&nbsp; : ### 6.5% <br />&nbsp;&nbsp; mostly VHDL : ######## 16.4% <br />&nbsp; &nbsp;&nbsp; VHDL only : ## 4.0%</FONT>
  </P>
  
  <br /> 
  
  <P>
    [source: <A href="http://www.deepchip.com/items/dvcon07-02.html" target=_blank>ESNUG-DVCon-Item02</A>]
  </P>
</DIV>

  


VHDL만 사용하는 사용자의 비율은 불과 4.0%에 불과하며, VHDL을 main으로 사용하는 사용자를 포함해도 전체의 20% 정도입니다.&nbsp; Verilog사용자의 경우 VHDL을 사용하는 가장 큰 이유로 &#8220;기존에 있던 코드 때문에(legacy code)&#8221;라는 답변이 대부분입니다. 

  


더욱 재미있는 것은 ^^; 이런 Mixed simulation을 사용할 때 사용하는 툴이 (이 응답에서는) 대부분 <A href="http://www.model.com/" target=_blank>Modelsim</A>이라는 점입니다. (modelsim이 주력 시뮬레이터는 아니구요.) Modelsim에게는 조금 위협적인 이야기가 되겠지요. 지금의 market share가 대부분 legacy code에 의한 것이라면 점차 legacy code의 사용이 줄어들면서 Modelsim의 입지도 줄어들 가능성이 있으니까요.

### VCS의 약진!

  


전반적으로 functional 전 개인적으로 Simulator부분에 있어서 [wp]cadence design system[/wp]의 NCsim series보다 [wp]Synopsys[/wp] VCS series가 이 정도의 market share를 차지한다는 것에 놀라움을 느낍니다. 다시 한번 말씀드리듯이 DVCon은 [wp]functional verification [/wp]engineer을 대상으로 하므로, 현재 상황이라기 보다 미래의 상황을 더 나타낸다고 보고 있으니, 더 놀라운 것입니다. 

  


<DIV style="BORDER-RIGHT: #cccccc 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #cccccc 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #cccccc 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #cccccc 1px dotted; BACKGROUND-COLOR: #f7f7f7">
  <FONT face="'courier new',courier,monospace">&nbsp;&nbsp; &nbsp;Cadence NC-Sim : ######################## 24.3% <br />&nbsp; &nbsp; &nbsp; &nbsp; NC-Verilog : ################## 18.0% <br />&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; Verilog-XL : # 0.7% <br />&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NC-VHDL : # 1.1% </FONT><br /> 
  
  <P>
    <FONT face="'courier new',courier,monospace">&nbsp;&nbsp; &nbsp; &nbsp;Synopsys VCS : ############################################# 44.7% <br />&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; VCS-MX : ######### 8.5% </FONT>
  </P>
  
  <br /> 
  
  <P>
    <FONT face="'courier new',courier,monospace">&nbsp;&nbsp; Mentor ModelSim : ################################### 35.3% </FONT>
  </P>
  
  <br /> 
  
  <P>
    <FONT face="'courier new',courier,monospace">&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Aldec : ### 2.8% <br />&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Icarus : .4% <br />Veripool Verilator : # .6% <br />&nbsp;SimuCAD Silos-III : 0% <br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Finsim : 0%</p> 
    
    <p>
      </FONT>
    </P>&nbsp; &nbsp; &nbsp; &nbsp; Cadence 2004 total :&nbsp; ############################## 51.0%
    
    <br />&nbsp; &nbsp; &nbsp; &nbsp; Cadence 2005 total :&nbsp; ############################## 51.0%<br />&nbsp; &nbsp; &nbsp; &nbsp; Cadence 2007 total :&nbsp; ########################## 44.1%</p> 
    
    <p>
      &nbsp; &nbsp; &nbsp;&nbsp; Synopsys 2004 total :&nbsp; #################### 34.0%<br />&nbsp; &nbsp; &nbsp;&nbsp; Synopsys 2005 total :&nbsp; ############################ 47.0%<br />&nbsp; &nbsp; &nbsp;&nbsp; Synopsys 2007 total :&nbsp; ############################### 53.2%
    </p>
    
    <p>
      &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Mentor 2004 total :&nbsp; ######################### 41.0%<br />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Mentor 2005 total :&nbsp; ##################### 35.0%<br />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Mentor 2007 total :&nbsp; ##################### 35.3%
    </p>
    
    <p>
      &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; others 2004 total :&nbsp; ###### 11.0%<br />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; others 2005 total :&nbsp; ### 5.0%<br />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; others 2007 total :&nbsp; ## 3.5%
    </p>
    
    <p>
      </DIV><br />사실 저는 VCS를 제대로 사용해 본적이 없어서 뭐라 이야기하기 어렵습니다. Icarus, Verilator, Silos-III, Finsim은 잠깐씩이라도 다 써봤군요.. Silos-III와 Finsim은 수업에서 쓸까 해서 Evaluation version을 사용한 적이 있었고, 다른 것은 개인적인 관심으로&#8230;
    </p>
    
    <p>
      여하튼.. VCS의 점유율이 늘어나고 Cadence의 점유율이 줄어드는 경향은 아마도 VMM의 힘이 아닌가.. 라는 의견도 있군요. <br />사실 Cadence가 Verilog기반의 회사임에도 그간 <A href="http://www.systemc.org/" target=_blank>System-C</A> 기반의 설계/검증 환경에 강점을 보인 반면, Synopsys는 <A href="http://www.vmm-sv.org/" target=_blank>VMM</A>으로 SystemVerilog 검증의 기반을 잡아나갔다는 것도 하나의 이유일 수 있다고 분석되는 군요. <br />Mentor의 Modelsim의 선방도 인상적이긴합니다. 아직 국내 학생들 사이에서는 최고의 인기이지요? 가격적으로도 메리트가 있구요. 하지만, Modelsim에 검증 부분을 강화한<A href="http://www.mentor.com/products/fv/news/questa_launch.cfm" target=_blank>Questa</A>에 대한 반응이 아직은 본격적으로 나타나고 있지 않으니 좀 답답하겠습니다. DVCon의 설문 조사인데 말입니다. Questa의 경우 SystemVerilog나 System-C모두에 대하여 약간은 중립적인 견지에 있지요.
    </p>
    
    <p>
      여하튼, Big3 EDA 업체가 functional verification에 대한 지배력을 점차 늘려가고 있는 형태네요..
    </p>
    
    <p>
      <H3>
        Linting과 Coverage는 Built-in?
      </H3>
      
      <br /> 
      
      <P>
        저는 사실 Linter에 대해서 처음에는 상당히 호의적이었는데, 지금은 약간 갸웃~하는 입장인데요. <br />Linter라는 것이 문제가 발생할 부분을 코딩 스타일 점검 과정에서 미리 확인하는 툴은데요..유용하다는 데는 이견이 없습니다만, Simulator나 Synthesizer에서 &#8220;상당히 빠르게&#8221; 미리 문제를 확인할 수 있기 때문에 약간은 비관적입니다.
      </p>
      
      <p>
        Code Coverage에 대해서는 가능성이 많다고 보는데, 문제는 현재 각 Simualtor에서 제공하는 기능이 일반적인 Code coverage기능(최소한 Line coverage정도는..)을 지원하고 있고, 어짜피 functional coverage는 assertion을 사용해야 할테니 강력한 code coverage를 요구하지 않는 다는 것이 문제겠지요. (아니, 실은 요구하는데 그 기능을 위하여 지갑을 열기가 쉽지 않은 것이겠습니다.)
      </p>
      
      <p>
        여하튼..
      </p>
      
      <p>
      </P>
      
      <br /> 
      
      <DIV style="BORDER-RIGHT: #cccccc 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #cccccc 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #cccccc 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #cccccc 1px dotted; BACKGROUND-COLOR: #f7f7f7">
        <FONT face="'courier new',courier,monospace">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Cadence built-in :&nbsp; ######################## 24.0%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Cadence HAL :&nbsp; ########### 11.3%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Verisity :&nbsp; ## 2.0%</p> 
        
        <p>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Synopsys built-in :&nbsp; ############################ 28.2%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Synopsys LEDA :&nbsp; ##################### 20.8%
        </p>
        
        <p>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Mentor MTI built-in :&nbsp; ####################### 23.0%<br />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Mentor DesignAnalyst :&nbsp; ## 1.9%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 0-In CheckList :&nbsp; ## 1.6%
        </p>
        
        <p>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Aldec built-in :&nbsp; ## 2.4%
        </p>
        
        <p>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Atrenta Spyglass :&nbsp; ########################## 25.9%
        </p>
        
        <p>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas nLint :&nbsp; ### 2.7%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; TransEDA :&nbsp; ## 2.2%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Certess Certitude :&nbsp; # 1.1%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Axiom :&nbsp; # 0.8%
        </p>
        
        <p>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; homegrown :&nbsp; ## 1.9%</FONT><br /></DIV><br /> 
          
          <P>
            결과를 보시면 알겠지만, SpyGlass가 아주 눈에 뜨입니다!<br />게다가 더욱 놀라운 것은 SpyGlass의 점유율이 2005년보다 약 8%나 증가했다는 것이죠.
          </p>
          
          <p>
            또 하나 재미있는 것은 Leda사용자들이 Leda를 무지 싫어한다는 점입니다. 일단 Leda를 쓰지만 &#8216;Leda는 X같아서 못쓰겠고, 나중에는 <A href="http://www.atrenta.com/" target=_blank>SpyGlass</A>를 쓰겠다&#8217;는 식으로요..
          </p>
          
          <p>
          </P>
          
          <br /> 
          
          <H3>
            Waveform Viewer와 Environment는?
          </H3>
          
          <br /> 
          
          <P>
            Waveform viewer는 실질적으로 Designer와 verification engineer들이 그야말로 끼고 사는 툴중의 하나인데요..(물론, verification enginner는 약간 덜 끼고 살죠..^^;)<br />대부분 Simulator에 번들링 되어온 툴을 많이들 사용합니다.
          </p>
          
          <p>
            저같은 NCsim 사용자는 Simvision이나 Signal Scan을 사용하겠고, Modelsim 사용자는 Modelsim자체 툴을 사용하시겠고, Nanosim사용자는 Novas nWave가 번들링 되어 있으니 이넘을 사용하시겠죠.
          </p>
          
          <p>
            그런데, 사실 요즘 세상에서는 파형만 보여주는 걸로는 부족합니다. 어떤 신호가 시점에서 unknown이 발생했으면, 어떤 신호에서부터 unknown이 타고 들어온건지 분석해주었음 좋겠고.. <br />신호를 그래픽으로 따라 들어가 주었으면 좋겠고, 그 값이 어디서부터 바뀌어 들어온지도 알고 싶지요.
          </p>
          
          <p>
            별거 아닌듯 한데, 이게 &#8220;생산력&#8221;을 아주 급격히 증가시켜줍니다!!<br />즉, 설계를 마치고 문제가 생기면 가장 시간이 오래 걸리는 부분이 파형보면서 문제를 파악하고 추적하는 건데, 이것을 편하게 해 주는 것은 정말 중요한 거죠.
          </p>
          
          <p>
            밑에 표를 보시면 <A href="http://www.novas.com/" target=_blank>Novas</A>의 툴들 Debussy/Verdi의 점유율이 아주 놀라운데요. 이런 맥락에서 이해하면 될 것 같습니다. <br />그래도, 제 생각으로는 simvision도 현재 상당히 강력해진 상황인데, 이 넘과 싸워서 사용자의 지갑을 열도록 만들수 있을 정도로 가치를 인정받았다는 의미이므로, 상당히 선전하고 있다는 거죠. <br />하긴 제 주변에도 Novas Debussy의 팬들이 몇 분 계시기는 하죠..^^;<br />
          </P>
          
          <br /> 
          
          <DIV style="BORDER-RIGHT: #cccccc 1px dotted; PADDING-RIGHT: 10px; BORDER-TOP: #cccccc 1px dotted; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #cccccc 1px dotted; PADDING-TOP: 10px; BORDER-BOTTOM: #cccccc 1px dotted; BACKGROUND-COLOR: #f7f7f7">
            <FONT face="'courier new',courier,monospace">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Cadence built-in debug :&nbsp; ############################## 29.6%<br />&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Cadence DAI SignalScan :&nbsp; ## 1.7%</p> 
            
            <p>
              &nbsp; &nbsp; &nbsp; &nbsp; Synopsys built-in debug :&nbsp; ################################# 33.2%
            </p>
            
            <p>
              &nbsp; &nbsp; &nbsp; Mentor MTI built-in debug :&nbsp; ########################## 26.3%
            </p>
            
            <p>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Aldec built-in debug :&nbsp; ### 2.5%
            </p>
            
            <p>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas Debussy :&nbsp; ################################# 33.1%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas Verdi :&nbsp; ##################### 20.8%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas nSchema :&nbsp; ##### 4.5%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas nWave :&nbsp; # 1.3%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Novas Siloti :&nbsp; 0.3%
            </p>
            
            <p>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Veritools UnderTow :&nbsp; ### 2.8%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Bybell GTKwave :&nbsp; # 0.8%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Veripool Dinotrace :&nbsp; # 0.6%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Axiom built-in debug :&nbsp; # 0.8%<br />&#8212;-<br />In the case of Novas!<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 2005 &#8211; Novas Debussy :&nbsp; ############################## 30%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas Verdi :&nbsp; ######### 9%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas nSchema :&nbsp; # 1%
            </p>
            
            <p>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 2007 &#8211; Novas Debussy :&nbsp; ################################# 33.1%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas Verdi :&nbsp; ##################### 20.8%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas nSchema :&nbsp; ##### 4.5%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Novas nWave :&nbsp; # 1.3%<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Novas Siloti :&nbsp; 0.3%<br /></FONT><br /></DIV><br /> 
              
              <P>
              </p>
              
              <p>
                EDA 업계 소식을 보다보면, &#8216;야~ 이 툴 정말 써보고 싶다&#8217;라는 생각을 해보곤 해요.<br />근데, 아시다시피 EDA 툴 한 카피의 가격도 가격이거니와.. EDA Tool의 Evaluation이라는 것이 회사 업무에 영향을 받기 때문에 회사 차원에서 evaluation하려면 여러 가지로 귀찮아요..
              </p>
              
              <p>
                그래서, 그냥 개인적으로 evaluation 해 볼 수 있는 뭐 그런거 없나 싶기도 합니다. Technical Report정도를 작성하면서 말입니다. 외국의 경우에는 책이나 이런저런것에서 지원받는 경우를 보았습니다만, 사실 국내에서는 EDA 시장 자체의 규모가 작으니 불가능하겠지요. ^^;<br />
              </P>
            </p>