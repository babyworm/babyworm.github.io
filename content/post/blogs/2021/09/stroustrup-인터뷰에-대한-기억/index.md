---
title: Stroustrup 인터뷰에 대한 기억..
author: babyworm
type: post
date: 2021-09-25T14:16:32+00:00
ao_post_optimize:
  - 'a:5:{s:16:"ao_post_optimize";s:2:"on";s:19:"ao_post_js_optimize";s:2:"on";s:20:"ao_post_css_optimize";s:2:"on";s:12:"ao_post_ccss";s:2:"on";s:16:"ao_post_lazyload";s:2:"on";}'
categories:
  - 개인적인
---
제가 대학에 들어가던 92년도에 가장 중요한 언어는 C 언어였습니다. 사실 지금 생각해보면, embedded programming에 더 가까웠지.. 싶은 것이 뭔가 해보려면, video buffer에 접근하고, 몇 번지에 있는 latch를 건드려야 하고, 그 다음엔 무슨 값을 쓰는 절차를 알아야 화면에 뭔가 표현할 수 있는 프로그램을 만들 수 있었습니다. DOS에서 TurboC로 프로그램을 짜던 시기니까요. 

그때 ‘마이크로 소프트웨어’라는 잡지에서는 줄창 C++의 시대가 온다고 이야기했던 것으로 기억합니다. 그리고, 군대 나와서 복학해보니 정말 C++을 많이 사용하더군요. (WinAPI를 C로 연결하는 경우도 많았지만..) 다만, 왜 그렇게 짜야 하는지는 모르고, 그냥 C++을 이용한 절차적 프로그래밍을 열심히 짜고, 정말 기본적인 객체를 짜는 정도였는데.. (복잡하단 생각만..)

당시에 통신망(저의 경우 하이텔)의 프로그래밍 동호회에서 가장 유행하던 글이 바로 아래의 “<a rel="noreferrer noopener" href="https://kldp.org/node/16854" target="_blank">Stroustrup Interview</a>” (원문은 <a rel="noreferrer noopener" href="https://www-users.cs.york.ac.uk/susan/joke/cpp.htm" target="_blank">https://www-users.cs.york.ac.uk/susan/joke/cpp.htm</a>) 라는 글이죠. Stroustrup이 IEEE Computers와의 인터뷰에서 “사실 C++은 그럴듯하지만, 크고 느리고 엉망인 프로그램을 만들도록 해서 프로그래머들이 더 오랫동안 돈을 잘 벌게할 수 있을지 장난으로 만든 거다”라는 요지의 글이었고, 이 글은 엄청난 호응과 함께 퍼졌던 적이 있습니다. 

사실 지금은 code reuse란 것이 일상화되어 있고, code reuse를 위한 coding practices (혹은 methodology, design patterns)가 잘 잡혀있고, 실제로 인터넷에서 코드를 가져다 재활용하는 일이 많다 보니(프로그래밍할 때 보면 코드의 반절은 github와 stack overflow가 만들어준 코드일지도.. ), 위의 이야기가 설득력있게 들리지 않지만, 당시에는 전산 계통에선 모르는 사람이 없는 인터뷰였습니다. 

오죽하면, IEEE Computers에서 “<a rel="noreferrer noopener" href="https://www.computer.org/csdl/magazine/co/1998/06/r6110/13rRUyYjK7n" target="_blank">The Real Stroustrup Interview</a>” 를 98년 6월호에 실었습니다. 원문은 <a rel="noreferrer noopener" href="https://www.stroustrup.com/ieee_interview.pdf" target="_blank">https://www.stroustrup.com/ieee_interview.pdf</a> 에서 보실 수 있는데, 링크에서 보실 수 있듯, Stroustrup이 직접 올려둔 걸 보면, 꽤 시달렸나보다 싶습니다. 한글 번역본도 있으니 참고하십시오. (<https://cdecl.net/55> ; 서진택의 C++ complete guide중에서 발췌하셨다네요..)

얼마 전에 후배와 이야기하다가 ‘사실 C++이 장난으로..’ 라는 이야기가 나와서 한참 웃다가 생각나서 올립니다. ㅎㅎ