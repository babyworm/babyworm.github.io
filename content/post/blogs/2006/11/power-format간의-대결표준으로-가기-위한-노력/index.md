---
title: Power Format간의 대결..표준으로 가기 위한 노력
author: babyworm
type: post
date: 2006-11-22T14:35:39+00:00
url: /archives/202
categories:
  - 'News on SoC &amp; IP design'
tags:
  - Accellera
  - CPF
  - Power Estimation
  - Power Format
  - Power Gating
  - Power Island
  - Si2
  - UPF

---
참 오랫만에 11시 이전에(그래야봤자 10시 55분입니다만..) 집에 들어왔습니다.  
요즘 여러가지 일로 나태했던 벌을 받고 있는듯 하게, 일이 몰려온 관계로 포스팅이 거의 안 이루어지고 있습니다.

여하튼, 오늘할 이야기는.. power format에 대한 이야기입니다.  
최근에 들어 EETimes기사를 보고 있자면, file format(좀더 정확히는 standard이지요)에 대한 donation소식이 속속 들어오고 있습니다. 

제가 HanRSS를 사용하는데, 거기에서 간단히 살펴볼수 있는 것만 해도 아래와 같습니다. 

[http://www.edadesignline.com/194300328?cid=RSSfeed\_EDAdesignline\_edadlALL][1]  
[http://www.edadesignline.com/193600650?cid=RSSfeed\_EDAdesignline\_edadlALL][2]  
[http://www.edadesignline.com/193501756?cid=RSSfeed\_EDAdesignline\_edadlALL][3]  
[http://www.edadesignline.com/193501548?cid=RSSfeed\_EDAdesignline\_edadlALL][4]

이중에 가장 많이 언급되는 것(사실 관심을 끄는 것이라는 표현이 더 맞을까요?)이 power format에 대한 이야기라고 생각됩니다. 

아무래도 산업에 있어서 가장 요구가 많은 부분이 가장 발전하는 것일테니, 각 툴마다 각각 다르게 표현하는 power관련 부분을 통합하는 것이 EDA업계로 보나 사용자의 툴 선택으로 보나 유리할 것은 자명합니다. 

지금 벌어지고 power format을 두고 벌어지는 donation 싸움의 승자는 아무래도 상대 업체보다 유리한 지점을 점할 수 있는 지름길일테니, 각각 장단점을 놓고 열심히 싸울것이라 생각됩니다. 

가장 큰 대결은 아무래도 cadence가 Silicon Integration Initiative(Si2)에 기증해서 밀고 나가는 CPF(common power format)과 Atrenta가 Accellera에 기증해서 밀고 나가는 UPF(Unified Power Format)로 볼 수 있겠습니다. 

이 두 단체간의 포맷은 궁극적으로 (사용자의 이해관계나 EDA의 이해관계가 얽혀있겠지만..) 하나로 통합될 가능성이 아주 높을 것입니다.  
EETimes의 글을 보면 현 상태로서는 silicon-proven되었다는 장점을 지닌 UPF가 한발 앞서 나가 있지만, CPF가 UPF의 기능을 포함하고 있기때문에 CPF로 갈 것이다.. 뭐 이런 글들이 나열되어 있는데, 현재로서는 앞날을 내다 보기 어렵습니다. 

여하튼, 현재 상태에서 어떤 포맷이 되건, design의 형태를 나타낼 수 있는 format과 더불어 power에 대한 정보와 power에 대한 지시 사항을 포함하는 포맷이 필요하다는 요구는 필할 수 없는 요구겠습니다. 

Power Format에 대한 재미있고 생각해 볼만한 이야기는 <A href="http://www.eetimes.com/news/design/showArticle.jhtml;?articleID=193600111" target=_blank>여기</A>에서 더 보실 수 있습니다. 

다른건 다 필요없고.. 아래의 이야기만 제대로 되었으면 좋겠습니다!

> With the design-environment-infrastructure chasm bridged by the Common Power Format, designers can immediately deploy the most advanced low-power techniques with minimal effort and risk.  
> </BLOCKQUOTE>하지만. 대신 많은 $$$를 요구하게 될까요..^^;

 [1]: http://www.edadesignline.com/194300328?cid=RSSfeed_EDAdesignline_edadlALL
 [2]: http://www.edadesignline.com/193600650?cid=RSSfeed_EDAdesignline_edadlALL
 [3]: http://www.edadesignline.com/193501756?cid=RSSfeed_EDAdesignline_edadlALL
 [4]: http://www.edadesignline.com/193501548?cid=RSSfeed_EDAdesignline_edadlALL