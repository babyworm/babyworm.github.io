---
title: WordPress Sparkling Theme 문제
author: babyworm
type: post
date: 2017-08-22T11:10:31+00:00
url: /archives/1989
categories:
  - 개인적인

---
몇일전에 아무 생각없이 theme update를 했는데, 오늘보니 blog가 죽어있더군요. 테마가 2.3.5 버전으로 update 되면서 뭐가  
문제가 있는지 T\_PAAMAYIM\_NEKUDOTAYIM 라는 에러를 띄우더군요.

얼마 안된 버그인지 결국 한참 헤메다가, 역시 구글신의 도움을 받아 테마 변경도 시도해 보고 이것저것 하다가 결국 테마 버전을 2.3.2로 rollback했습니다.

간단하게 설명하면,

console로 접속해서, 현재 theme 디렉토리(sparkling)를 백업하시고(저는 그냥 간단하게 sparkling-2.3.5로 rename)

<table style="background-color: #41c8c8;">
  <tr>
    <td style="background-color: #d19999;">
      mv sparkling sparkling-2.3.5
    </td>
  </tr>
</table>

svn을 쓸 줄 아시면 현재 디렉토리에서 아래 repository에서 checkout 받으시고&#8230;

<table style="background-color: #d19999;">
  <tr>
    <td>
      svn co https://themes.svn.wordpress.org/sparkling/2.3.2/
    </td>
  </tr>
</table>

2.3.2 디렉토리를 sparkling으로 rename하면 됩니다.

<table style="background-color: #d19999;">
  <tr>
    <td>
      mv 2.3.2 sparkling
    </td>
  </tr>
</table>

호환성이란.. 원..