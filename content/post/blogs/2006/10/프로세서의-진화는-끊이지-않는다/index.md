---
title: 프로세서의 진화는 끊이지 않는다!
author: babyworm
type: post
date: 2006-10-11T11:12:48+00:00
url: /archives/110
categories:
  - Microprocessor
tags:
  - alpha
  - Microprocessor
  - OpenSparc
  - power architecture
  - UltraSparc
  - 마이크로 프로세서

---
마이크로 프로세서의 개발이 한계에 부딛혔다는 말이 많습니다.

마이크로 아키텍쳐에서 많은 연구자들에게 즐거움을 주었던 \[[trace architecture]\](Intel에서 [[trace cache]]를 채용되었지요?)라든지 SMT이후에 별다른 혁신없이 몇년이 지속되고 있는듯 한 느낌입니다.  
최근의 마이크로 프로세서는 공정기술을 앞세운 속도 향상이나 동일 코어를 많이 내장하는 방법, 좀더 큰 캐쉬를 내장시키는 방법등으로 발전하고 있어서, 일견 마이크로 아키텍쳐 자체에는 별다른 이슈가 없는듯한 생각까지 들게 합니다.

마이크로 프로세서 자체에는 여러가지 재미있는 시도들이 진행되고 있습니다.  
[[IBM]] 진영에서는 [[powerPC]]에서 기존의 [Power라는 이름으로 복귀][1]한 후 최근에 Power6 프로세서를 선보였습니다.  
이전에 애플에서 &#8216;Power PC가 개선되는 것을 도저히 못 기다리겠다&#8217;고 선언하고 intel 기반으로 전향한것에 충격을 받았는지, [[Cell]]에서 병렬성을 강조하던 것에서 Power에서는 다시 속도전에 돌입했습니다.  
ISSCC의 발표에 의하면 65nm 공정에서 4GHz라고 하더니만, 어제 [EEtimes 기사][2]를 보면 dual core Power6가 8MB L2 cache를 내장하고도 4~5GHz를 넘어섰다고 합니다. (출처가 san jose라는 걸 보면 MPF fall의 내용인듯 한데요..국내에 좀 [희안한 기사][3]가 하나 떳습니다. 10진법 연산이라.. 이걸보고 제가 왠만한 power6관련 논문/기사를 둘러봤는데 이런 내용은 없더군요.. 아마도 다음주에 MPR에서 MPF fall 정리하면서 나오겠죠.. CNET원문에도 있는걸보니 뭔가 있을듯 한데, 실체는 나중에 MPR을 봐야겠네요. ^^;)

잠잠하던 Sun진영에서는 UltraSparc의 발전 방향을 좀더 깊고 넓은 Multithreading으로 잡은듯 합니다. MPR의 예전 기사를 보면 Niagara2는 프로세서당 32-64 thread를 지원하고, Dual Core를 내장해서 128 thread를 지원한다고 하더군요.  
또한가지 Sun의 재미있는 실험은 Niagra에 사용된 UltraSPARC T1  Core가 GPL에 의거해서 open되었다는 점입니다. OpenSPARC이란 이름으로 말이죠. <http://www.opensparc.net/> 에서 [[OpenSparcT1]]의 모든 소스코드와 합성 스크립트를 얻으실 수 있습니다. 저도 몇달전에 받아서 합성 스크립트 만드는데 (감동과 ^^;) 도움을 받고 있습니다. 적어도 open source processor보다는 잘 만들어야한다는 막중한 중압감에 눌리는 중입니다. -_-;

<div style="width: 250px" class="wp-caption aligncenter">
  <img loading="lazy" decoding="async" src="https://i0.wp.com/babyworm.net/wordpress/wp-content/uploads/1/cfile4.uf.2067384F4D6A7A921BA466.jpg?resize=240%2C241" alt="" width="240" height="241" data-recalc-dims="1" />
  
  <p class="wp-caption-text">
    OpenSparc 프로세서
  </p>
</div>

찬란하게 떠오르다 사멸한 Alpha아키텍쳐는 그 면면이 AMD의 Hammer 아키텍쳐로 연결되었고, 주변의 여러 아키텍쳐에 영향을 주었고&#8230;  
SimpleScalar라는 프로세스 아키텍트들한테는 가장 중요한 시뮬레이션 툴의 기반 아키텍쳐로 사용되어 여전히 논문상에 회자되고 있습니다.

지금 또 어느 랩에서 어떤 혁신적인 아키텍쳐가 개발되고 있을지 모르지요.  
다음주에 MPR에서 나올 MPF fall 소식이 궁금해지는 저녁시간입니다.

 [1]: http://babyworm.net/wordpress/?p=46
 [2]: http://eetimes.com/news/semi/showArticle.jhtml;jsessionid=VJ5QKQL1TMYFMQSNDLPSKHSCJUNN2JVN?articleID=193105767
 [3]: http://news.naver.com/news/read.php?mode=LSD&office_id=018&article_id=0000421595&section_id=101&menu_id=101