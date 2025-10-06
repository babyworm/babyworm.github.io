---
title: EDA playground
author: babyworm
type: post
date: 2014-06-20T07:56:38+00:00
bfa_virtual_template:
  - hierarchy
al2fb_facebook_error:
  - |
    |
        Get me: cURL communication error 60 SSL certificate problem, verify that the CA cert is OK. Details:
        error:14090086:SSL routines:func(144):reason(134):  Array
        (
            [url] => https://graph.facebook.com/me...
            [http_code] => 0
            [header_size] => 0
            [request_size] => 0
            [filetime] => -1
            [ssl_verify_result] => 0
            [redirect_count] => 0
            [total_time] => 0
            [namelookup_time] => 0.122611
            [connect_time] => 0.291569
            [pretransfer_time] => 0
            [size_upload] => 0
            [size_download] => 0
            [speed_download] => 0
            [speed_upload] => 0
            [download_content_length] => 0
            [upload_content_length] => 0
            [starttransfer_time] => 0
            [redirect_time] => 0
        )
        
al2fb_facebook_error_time:
  - 2014-06-20T07:58:09+00:00
categories:
  - CAD tools
  - 'SoC &amp; IP design'
tags:
  - EDA
  - EDA playground
  - verilog

---
오랫만에 포스팅하네요.

사실 그동안 심신을 지치게 했던 project를 마무리했기 때문에 비교적 가벼운 마음이 되었습니다.

오늘 소개할 것은 EDA playground 라는 사이트입니다.

<http://www.edaplayground.com/home>

&nbsp;

그 동안 UVM이니 뭐니 이야기를 많이 했는데, 직장인 분들은 회사 밖에서는 뭔가를 할 수 없는 환경이라서 집에서는 간단한 공부하기도 쉽지 않았을 것입니다. (물론 능력 되시는 분들께서는 좋은 시뮬레이터를 사용하실 수 있으시겠지만 말이죠..)

위의 사이트에서 아주 간단한 예제 정도는 처리해 줄 수 있습니다.

물론, 개인적으로 환경을 구성하는 것이 속도나 관리 면에서 더 좋겠지만, 간단한 것 정도는 위의 사이트에서 파일들을 추가하고 테스트 해 보면 되니까 개인적으로는 비교적 쓸만 한 것 같습니다.

한 가지 단점(?)은 Waveform viewer가 GTKwave를 Web으로 보여주는 거라 써서 보는 거라.. 기능이 좀 약하고, 제어가 불편하다는 정도.. 그래도 대충 해보는데 문제는 없습니다.

제 생각에는 학부 수업 정도까지는 cover 하는데 별 문제가 없을 것으로 보이네요.

&nbsp;

또하나, EDAplayground에 보면  이런 저런 예제들과 간단한 Verilog tutorial을 가지고 있으니, 초보자 분들께도 도움이 될 것으로 보입니다. (로그인도 Facebook 혹은 Google 계정으로 가능하고..)

오랫만에 괜찮은 사이트인 것 같습니다.