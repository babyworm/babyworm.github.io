---
title: "요즘 사용하고 있는 LLM/AI coding agent들"
author: babyworm
type: post
description: "Coding Agent와 Native AI"
date: 2026-02-22T13:27:58+09:00
tags: ["AI", "Claude", "개발도구"]
categories: ["Technology"]
showComments: true
---

## 들어가며

<!-- 여기에 포스트 내용을 작성해주세요 -->
요즘 몇 달간 여러가지 LLM/AI 코딩 도구들을 사용해 보고 있습니다.

특히 올초부터는 Opencode에서 Oh-my-opencode로 촉발된 다수의 subagent들과 다수의 coding agent들을 orchestration하면서, 각각의 agent들이 각각 잘하는 일을 시키자는 아이디어, 그리고, 각각의 subagent들에게 LSP를 비롯한 다양한 도구를 들려주면 상당한 결과를 보여준다는 사실때문에 짧은 기간동안 수많은 이야기들이 나왔었습니다.
결국 Claude에서 Opencode를 차단(정확히는 subscription형식으로 claude를 사용하는 것을 차단했고, API로는 가능합니다만.. API 가격을 생각하면 쉽지 않죠)하는 초강수를 두었고, 직후에 OpenAI는 Codex의 사용을 공식적으로 허용하는 모습을 보였습니다.

이후에 Claude쪽에도 Subagent를 효율적으로 orchestration하는 다양한 plug-in들이 많이 나왔죠.

현재는 하나의 agent가 다수의 subagent를 띄워서 작업하는 것에서 나아가 다수의 Agent(Clude Code)를 TaskList와 TaskUpdate, SendMessage라는 방식을 통해서 leader가 다수의 agent를 제어하는 방식으로 바뀐 상태입니다. (Opus 4.6이 나오면서 beta로 지원하고 있죠.)

즉, 이전에는 subagent를 제어하기 위해서 SQLite나 일종의 file 기반의 메시징을 하고, hook을 통해서 상태를 확인하고, 추가적인 프롬프트를 dynamic하게 생성한 후, 다시 동작시키는 방식으로 제어했었는데, 이제는 명시적인 interface가 생긴거죠.
(물론, agent가 subagent를 부를 수 있습니다.)


## 실제 구조를 복제한 설계 구조
사실 여기서부터가 하고 싶은 이야긴데요.

[이전글](https://babyworm.net/post/blogs/2025/09/%EC%A1%B0%EC%A7%81%EB%AC%B8%ED%99%94%EB%8A%94-%EC%A4%91%EC%9A%94%ED%95%9C%EA%B0%80/)에서 말씀드린 이야기로 시작하죠.

> “시스템을 설계하는 조직은 필연적으로 해당 조직의 커뮤니케이션 구조를 복제한 설계 구조를 만들어낼 수밖에 없다.” [읽기 쉬운 코드. Chapter 14.2.3]

최근 한달 정도 RTL 설계/검증 및 reference modeling 과정 전체를 open-source 기반으로 작업하고 있는 중입니다.

대부분 skill을 만들고, MCP로 tool들을 연결하고, 몇몇 부분은 docker image로 생성하고, 이걸 잘 사용하도록 agent를 만드는 작업이었죠.
초기 몇주는 이게 가능한지 확인하는 작업과 이미 있는 도구들에 systemverilog와 제가 사용할 도구들을 붙여나가는 작업을 위주로 진행하고 있었습니다.
(물론, 아직까지는 어떤 skill의 경우 너무 token을 많이 쓰고, 어떤 skill은 내용이 부실하고 해서 조금 더 작업이 많이 진행되어야 합니다.)

요즘에는 이걸 agent team으로 묶고, agent 들을 연결하는 중인데 정말 하나의 완전한 설계팀을 구성하는 것 같다는 생각이 들더군요.

처음 Spec을 만들면, 이걸 architect agent가 대략의 architecture로 만들고, 이걸 기반으로 modeling agent가 modeling하고, unit leader가 microarchitecture적 선택을 하면서 좋은 옵션을 선택하는 loop이 진행되고, 블럭별로 RTL 설계를 하고, 설계된 RTL을 하나씩 lint, syntax check, 개별적인 unit test를 진행하고, integration agent가 integration한 후 검증까지 진행하게 됩니다.
(물론, 말처럼 그렇게 부드럽게 진행되지는 않습니다. 간단한 건 되지만, 아닌 건 아직은 잘 안되서요.)

처음에는 RTL agent를 구성하는 것부터 시작했는데, 어느 순간 "내가 그렇게 설계를 하지 않는데.. "라는 생각이 들면서 위의 flow를 구성했는데, RTL coding의 성능이 대략 2~3년차는 올라간 느낌입니다.

참고로, 아무것도 없는 상태에서 몇가지 skill과 tool을 주면 대략 3~4년차  주니어 엔지니어 정도의 coding을 합니다. (Opus 4.5, Opus 4.6 기준입니다.)

그리고, skill을 잘 분화해서 정보를 더 주면 특정 분야에 대해서는 정말 좋은 결과를 보여줍니다. (이건 skill 작성 방법을 한번 잘 읽어보시길 권장합니다.)

아.. 혹시나 해서.. 아직까지는 주니어 엔지니어 수준이니, 주니어 엔지니어에게 일을 준다고 생각하고 나눠주는게 중요합니다.
화내지 마시고요. 다르게 이야기하면 orchestration을 잘 작성하거나, 여러분이 잘 나눠서 작업을 시켜야 한다는 거죠.


참고로, 아래 표는 DAC2025에 RTL에 대한 Agentic Coding을 제공하는 ChipAgents의 결과인데요.

<img width="1024" src="https://github.com/user-attachments/assets/f25e63fa-e885-4bc3-a42b-4d9c5c5435c6" />

여기 사용된 score가 Sonnet 3.5인데, 현재 Opus 4.5/4.6과 비교하면 얼마나 좋아졌을지 추정할 수 있을 것입니다.

제 기준에는 2025년 초까지만해도 대졸 신입 정도의 코드를 작성하던 LLM들이,올초에서는 대략 3~4년차 정도 된다고 생각하시면 됩니다.
여기에 적절한 tool을 잘 쥐어준다고 생각해보면 되겠죠.




## AI Native

요즘에 AI native라는 이야기가 많이 나옵니다.

저는 이게 coding agent를 잘쓰고, agentic coding을 쓴다는 이야기가 아니라고 생각합니다.

이건 운영 방향에 대한 이야기라 생각합니다.

처음 생각해야 할 부분은 Human-in-the-loop(HIL)에서 Human을 어디에 세울까입니다. 혹은 Human-on-the-loop(HOL)으로 진행할 것인지도 봐야 하겠죠.

제 생각에 architecture와 microarchitecture 단계까지는 아직까지 HIL일 수 밖에 없다고 생각합니다.
뒷 부분에 주는 impact가 너무 크니까요.
물론, 뒷 부분도 어느 정도는 HIL로 가겠지만, 점차 줄어들 것으로 봅니다. (저는 Coding Agent가 일종의 새로운 compiler가 될 것이라 생각합니다.)

이 과정에서 중요한 건 "다시" 읽기의 힘이라고 봅니다.
이 읽기는 사람에게만 중요한 게 아니라, LLM, coding agent에도 중요합니다.

이 과점에서 LLM, Coding Agent에게 더 효율적인 방향이 뭘까요?
사람이 읽기 쉬운 rich text가 아닌 Markdown등이나 JSON(혹은 YAML)이 훨씬 더 적은 token만 사용합니다.
따라서, 이후의 문서를 Markdown 형식(혹은 비슷한 RST라던지)을 사용해 주는게 더 효율적일 수 밖에 없습니다. (저는 개인적으로 Markdown + Obsidian을 사용하고 있습니다.)

또한, coding agent를 가장 효율적으로 사용할 수 있는 서비스와 도구들을 연결하는 것이 필요합니다.
이걸 하려면 몇가지 판단이 필요하겠죠.

이런 운영 방향이 조직 전체에서 합의되었을때는 "매우 효율적"으로, 그리고 약간이라도 빠르게 AI native한 개발 과정을 경험하실 수 있을것으로 생각합니다.

<img width="800" src="https://github.com/user-attachments/assets/fc811de2-bb93-45e1-8c7a-e59ce586b09d" />

## Coding Agent 이외에.

사실 AI agent가 Coding agent만 있는 건 아닙니다. Manus나 Genspark 같이 Agent를 표방하는 서비스들도 있죠. (사실 프론티어 모델들이 이미 agent들을 앞다투어 내보이다보니..)

개인적인 work flow를 만들어주기 위한 n8n도 보셔야 합니다.

AI 친화적인 search engine도 있습니다. https://exa.ai/, https://www.tavily.com/, https://brave.com/ko/search/api/ 같은 것도 있습니다.
무료로 쓰기에는 brave가 저렴해서 사용하고 있는데, exa가 품질은 더 좋아보였습니다.
MCP로 연결하시거나, n8n에서 엮으시면 됩니다.

RAG를 처리하기 위해서 저는 https://www.pinecone.io/ 을 사용하고 있는데, 아직 RAG를 깊게 다루지는 않아서(비용문제로), 다른 것들을 사용하고 나중에나 조금 열심히 사용할 것 같네요.


## 인생 짧아요

제가 최근, 모사에 가서 Agentic Coding for RTL design이라는 주제로 세미나를 하나 했는데, 거기의 주제가 바로 위의 제목이었습니다.

그리고, 실제 중요한 내용은 아래의 부분이죠.

> 여러분의 조직을 복제하십시오

> 여러분의 Domain 지식이 중요합니다

> 그냥 한번 써보세요. 어렵지 않습니다.

많은 조직에서 여러가지 수준으로 AI를 경쟁적으로 도입하고 있습니다.

어떤 조직은 느리게, 조심스럽게, 어떤 조직은 파괴적으로 도입하고 있다고 알고 있습니다.

효율적인 flow는 한번에 이뤄지지 않습니다.
개발 과정에서 취약한 부분을 계속 보시면서, 내 조직의 형태와 know-how를 잘 녹여내는 것이 필요할 것입니다.

물론, 이걸 이미 잘해서 서비스하는 회사도 있으니 (특히 EDA 회사들이 매우 적극적이죠.), 여러가지를 고려하셔서 선택하시면 될 것으로 생각합니다.

제일 중요한건 "많이 써보시라"고 이야기하고 싶습니다.
