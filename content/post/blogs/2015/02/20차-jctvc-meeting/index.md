---
title: 20차 JCTVC meeting
author: babyworm
type: post
date: 2015-02-19T21:20:02+00:00
switch_like_status:
  - 1
categories:
  - Video Codec
tags:
  - HEVC
  - HEVC-SCC
  - JCTVC

---
20차 JCTVC meeting / 111차 MPEG meeting.

잊기 전에 몇가지 적어놔야지.. 항상 나중에 정리하려고 하다가 회사일하면서 까먹어서..

## JCTVC / SCC

Screen contents(말하자면.. 컴퓨터 화면..)를 잘 coding하기 위한 HEVC의 확장판을 만들고 있는데, 지난번에 갔던 삿포로 미팅에서 WD(working draft)가 나왔고, 이번에 PDAM(proposed draft amendment; 말하자면 표준화를 위한 초안)이 나왔습니다. (사실 아직 안나왔습니다. 미팅 끝나고 3주 내로 만들기로 한거라..)

삿포로에 갔을때만 해도 CfP 다음 단계라, 이런 저런 툴을 한꺼번에 많이 테스트 중이었는데, 이번엔 CE도 3개 밖에 없어서 아주 심플해졌더군요.

그럴만도 한 것이 많은 툴 들이 이전에 RExt 등에서 이미 제안되었다가 개선 정도가 한정되어 있다는 이유로 밀렸던 건데.. SCC에는 잘 맞는 툴 들인 경우가 있어서 그렇습니다. 즉 완전히 새로운 건 없다는 말도 됩니다만..

가장 중요한 변경 사항은 intra block copy(IBC)가 inter mode와 unification되었다는 점인데요. 이 과정에서 스펙에 많은 변경이 있었고, 여러 기고문 중에서 기존의 MC와 같이 동작할 수 없는 것들은 모두 보류되었습니다.  (제가 IBC쪽 track을 거의 들어가서..)

덩달아 CE3로 명맥을 유지하고 있던 intra line copy, intra string copy는 IBC에 비해서 명백하게 좋다는 증거를 보이지 못해서 더 이상 CE를 유지하지 않기로 결정되었습니다. ILC의 경우 IBC의 보조적인 정도의 gain을 가지고 있어서 그렇고(IBC가 이전처럼 별도의 모드였다면 곁가지로 넣을 만도 한데, unification 이후엔 MC의 동작을 바꾸면서 까지 고려할 정도로 매력적이지는 않게 된 거죠.), ISC의 경우 444 lossless에서는 장점이 있지만 1) 필요한 메모리의 양을 줄일 수 있는 방법이 없다는 점, 2) Palette mode와 경쟁하는데 크게 marit가 없다는 점  때문에 더 이상 CE로 연구되지 않기로 했습니다.

물론, ISC의 경우 좀 더 study가 되었음 좋겠다는 이야기는 있었습니다만&#8230; string copy를 위한 dictionary 생성, 유지에 들어가는 메모리를 줄일 수 있는 방법을 찾지 못했고, 이 메모리를 줄이기 위해서 search range를 줄이면 성능이 떨어지는 상태라 어찌 될지 모르죠.

이번 미팅이 비교적 빠른 시간안에 끝났는데(보통은 아침 9시에 시작해서 밤 9시, 10시까지인데 반해 이번에는 9시 30분에 시작 밤 8시 30분 이전에 끝났고, 예정보다 하루 일찍 끝나는 기염을..), 위의 unification 결정으로 기인하는 거죠.

이제 남은 건 IBC를 다듬어 나가는 건데, IBC가 loop filter를 거치지 않은 데이터를 사용해야 해서, 메모리 저장 공간과 bandwidth 문제가 있습니다. 이 부분을 위해서 CE2가 생성되었는데, 사실 CE2 자체에는 아직 별 내용이 없고, 다음 회의에서는 CE2관련된 제안들이 있겠죠. (이 부분에 대해서 재미있는 것들이 있을 수 있겠습니다만, 실험해볼 시간이 있을지나 모르겠습니다..)

Palette mode의 경우 크게 많은 기고문이 있었는데, 크게 개선된 건 없다고 보는 것이 맞을 것 같습니다. 좀더 refinement 하기 위해서 다시 CE1이 생성되었습니다.

## MPEG / video.

### Future codec Requirements
지난 미팅에서 future codec에 대한 req.를 모았던 것 같은데요. 대략 6회사들이 관련된 제안 & brainstorming이 있었고(전 지난 미팅을 안가서, 이번 미팅에서 요약된 것을 보고, 관련 발표자료만 봤습니다. ) 이번 미팅에서 관련해서 다시 관련 TV 업체들의 의견들이 포함된 미팅이 있었습니다.

지난 미팅의 발표자료들을 보니 많은 회사에서, RExt가 부족하다는 의견(사실 high dynamic range와 larger color gamut에 대한 요구와 더불어)가 있어서, HEVC RExt에 이 요구를 만족시킬 수 있는지 확인해 보기로 했습니다. (CfE) 사실, 위의 부분에 대해서 별 관심이 없어서 잘 몰랐는데(YUV420 format만 다루니까.), 상당수의 회사들이 의견을 제시하고 있더군요.

압축률에 대해서는 현재보다  50%이상의 bitrate를 줄여야만 한다는 의견(원래 MPEG에서 물어본 것이 대략 25%만 줄이면 받아들일 만 하겠냐.. 라는 거라서..)이 있었고, 2025년까지는 어떻게든 해보라는..

화면 크기는 생각보다 커지지 않을 거라 다들 예측하고 있고.. frame rate와 color depth부분에 대해서는 많은 concern이 있는 정도고..

### Video coding for browsers
예전에 봤을때는 VCB(video codec for browser. 즉, vp8)가 IVC (internet video codec)보다 훨씬 좋았는데, 이번에 나온 결과로는 IVC가 많이 좋아져서 VCB를 넘어서 H.264 HP에 근접(아직 차이는 있지만)하는 정도까지 도달했다고 주장했습니다. 잘되면 좋겠다는 생각과 흥미가 좀 있어서 중간에 BoG를 들어갈까 하다가 사람도 너무 적고 사실 좀 minor한 codec이라서 그냥 video plenary를 계속 들었는데.. 음.. 들어가볼껄 그랬다는 생각이 듭니다.

### AHG on Genomic Information
tutorial로 genome data processing

data compression에 genetic algorithm을 이용하나.. 하고 들어갔는데 실은 말 그대로 genome data를 어떻게 잘 압축할 수 있는지 물어보기 위해서 genome data를 어떻게 처리하고 있는지 알려주는 자리였음.

생명공학을 하는 마누라 덕분에 in-vivo, in-vitro 같은 내용도 알아들어서 좋기는 했는데, 이걸 왜 MPEG에서.. 게다가 정식으로 AHG에서 다룬단다. (이미 들어와 있더군..) 데이터가 크고, 나중에 활용 부분이 많으니까 압축  전문가들이 압축할 수 있는 방법을 고안해봐.. 이런 느낌이랄까요..

* * *

설날과 겹치면서 돌아오는 비행기 예약이 힘들어서 금요일 plenary를 보지 못하고 돌아와야 하는 것이 약간 아쉽지만.. 같이 갔던 동료분이 같이 열심히 들어줘서 상당히 충실한 Meeting이었네요.