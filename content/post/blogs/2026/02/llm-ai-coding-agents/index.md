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

특히 올초부터는 Opencode와 Oh-my-opencode이 조합을 통해 여러 coding agent 들을 조율(orchestration)하면서 각각의 agent에게 각각 잘하는 일을 시키고, 그 결괄를 확인하는 루프를 돌리면 상당한 결과를 보여준다는 사실 때문에 짧은 기간동안 수많은 이야기들이 나왔었습니다.
게다가 각각의 subagent들에게 LSP를 비롯한 다양한 도구를 사용할 수 있도록 하면 토큰 효율성과 성과를 높일 수 있다는 점도 중요하죠.
결국 Claude에서 Opencode를 차단(정확히는 subscription형식으로 claude를 사용하는 것을 차단했고, API로는 가능합니다만.. API 가격을 생각하면 쉽지 않죠)하는 초강수를 두었고, 직후에 OpenAI는 Codex의 사용을 공식적으로 허용하는 상반되는 모습을 보였습니다.

이후에 Claude쪽에도 Subagent를 병렬적으로 활용하고, 제어하는 다양한 plug-in들이 많이 나왔죠.

이전에는 subagent를 제어하기 위해서 다음과 같은 방식을 사용했습니다.

- TODO list를 분리
- 각 agent에게 프롬프트 주입
- file을 통해서 (혹은 SQLite를 사용해서) 메시지를 간접적으로 전달
- 해당 subagent가 올라올때 혹은 끝날때 hook을 통해서 상태를 확인
- 추가적인 프롬프트를 dynamic하게 생성(혹은 static하게 프롬프트를 재 주입)
- 다시 동작시키는 방식으로 제어


현재는 하나의 코딩 에이전트(예를 들면 claude code)에서 다수의 subagent를 띄워서 작업하는 것에서 나아가, 코딩 에이전트 자체를 여러개 띄울 수 있게 되었습니다. (Opus 4.6이 나오면서 beta로 지원하고 있죠.)

이때 leader(orchestrator) 역할을 맡은 코딩 에이전트가 명시적인 메시지(TaskList와 TaskUpdate, SendMessage 같은)를 통해서 다수의 코딩 에이전트를 명시적으로 제어할 수 있게 되었습니다.
이제는 각각의 agent의 상태를 확인하고, 추가적인 prompt를 전달하는 명시적인 interface가 생긴거죠. (물론, agent가 subagent를 부를 때는 이전과 같은 방식을 써야 겠죠)

요기까지는 최근까지의 경향이고요.



## 실제 구조를 복제한 설계 구조
사실 여기서부터가 하고 싶은 이야긴데요.

[이전글](https://babyworm.net/post/blogs/2025/09/%EC%A1%B0%EC%A7%81%EB%AC%B8%ED%99%94%EB%8A%94-%EC%A4%91%EC%9A%94%ED%95%9C%EA%B0%80/)에서 말씀드린 이야기로 시작하죠.

> “시스템을 설계하는 조직은 필연적으로 해당 조직의 커뮤니케이션 구조를 복제한 설계 구조를 만들어낼 수밖에 없다.” [읽기 쉬운 코드. Chapter 14.2.3]

최근 한달 정도 RTL 설계/검증 및 reference modeling 과정 전체를 open-source 기반으로 작업하고 있는 중입니다.

대부분 적절한 SKILL.md를 만들고, MCP로 tool들을 연결하고, 몇몇 부분은 docker image로 생성하고, 이걸 잘 사용하도록 agent(실제로는 subagent)를 만드는 작업이었죠.

초기 몇 주는 이게 가능한지 확인하는 작업과 이미 있는 도구들에 systemverilog와 제가 사용할 도구들을 붙여나가는 작업을 위주로 진행하고 있었습니다.
(물론, 아직까지는 어떤 skill의 경우 너무 token을 많이 쓰고, 어떤 skill은 내용이 부실하고 해서 조금 더 작업이 많이 진행되어야 합니다.)

요즘에는 이걸 agent team으로 묶고, agent 들을 연결하는 중인데 정말 하나의 완전한 설계팀을 구성하는 것 같다는 생각이 들더군요.

대략 다음과 같은 형태를 갖춰두고 있는데, 아직은 형태만 잡은 것이지만 점점 좋아지고 있습니다.

- Spec과 초기 프롬프트 작성
- Research agent: PRD 작업. 사실 이 과정은 문서 작업에 가깝습니다.
- Architect/Modeling agents: 대략의 architecture를 만드는 작업을 합니다. Plan에서 큰 블럭을 만드는 작업입니다. 초기 단게의 orchestration을 같이 합니다.
- Microarchitecture/TLM agents: 주어진 형태에 따른 하드웨어 구성을 진행합니다. 사실 이 부분에서 튜닝을 진행합니다.
- Unit implementation agents: microarchitecture 문서를 가지고, agent들을 만들면서 블럭별로 설계를 진행하며, 블럭별로 RTL 설계를 진행합니다.
- Unit verification agents: lint, syntax check, CDC, unit test를 진행하고, SVA 기반의 coverage를 체크합니다.
- Integration agents: integration한 후 검증

물론, 말처럼 그렇게 부드럽게 진행되지는 않습니다. 간단한 건 되지만, 어려운 것들은 아직은 잘 안됩니다.

저도 처음에는 RTL agent를 구성하는 것부터 시작했는데, 어느 순간 "내가 그렇게 설계를 하지 않는데.. "라는 생각이 들면서 위의 flow를 구성했는데, RTL coding의 성능이 대략 2~3년차는 올라간 느낌입니다.

참고로, 아무것도 없는 상태에서 몇가지 skill과 tool을 주면 대략 3~4년차  주니어 엔지니어 정도의 coding을 합니다. (Opus 4.5, Opus 4.6 기준입니다.)

그리고, SKILL을 잘 분할하고, agent에게 적절한 skill과 정보를 지정하면 특정 분야에 대해서는 정말 좋은 결과를 보여줍니다. (이건 skill 작성 방법을 한번 잘 읽어보시길 권장합니다.)

그렇다고, 너무 기대를 하지는 않는게 좋습니다.

생각하실 때, Agentic Coding을 이용한 RTL 설계는 아직까지는 **주니어 엔지니어 ** 수준이니, 주니어 엔지니어에게 일을 준다고 생각하고 일을 잘 나눠주고, 계속 review 하는게 아직까지는 중요합니다.

생각보다 빠르게 이뤄지지 않는 부분도 있고, 생각보다 "별거 아닌 것"을 고치지 못하는 경우도 있습니다.
화내지 마시고요.
꼭 지켜야 하는 것은 rules에, 지정한 작업은 SKILL에 잘 배치하고 내 대신 orchestration agent가 잘 작업할 수 있도록 여러분이 잘 나눠서 작업을 시켜야 한다는 거죠.


참고로, 아래 표는 DVCON2025에 RTL에 대한 Agentic Coding을 제공하는 ChipAgents의 결과인데요.

<img width="1024" src="https://github.com/user-attachments/assets/f25e63fa-e885-4bc3-a42b-4d9c5c5435c6" />

여기 사용된 score가 Sonnet 3.5인데, 현재 Opus 4.5/4.6과 비교하면 얼마나 좋아졌을지 추정할 수 있을 것입니다.

제 기준에는 2025년 초까지만해도 대졸 신입 정도의 코드를 작성하던 AI들이,올초에서는 대략 3~4년차 정도 된다고 생각하시면 됩니다.
여기에 적절한 tool을 잘 쥐어준다고 생각해보면 되겠죠.




## AI Native

요즘에 AI native라는 이야기가 많이 나옵니다.

저는 이게 coding agent를 잘쓰고, agentic coding을 쓴다는 이야기가 아니라고 생각합니다.

이건 운영 방향에 대한 이야기라 생각합니다.

처음 생각해야 할 부분은 Human-in-the-loop(HIL)에서 Human을 어디에 세울까입니다. 혹은 Human-on-the-loop(HOL)으로 진행할 것인지도 봐야 하겠죠.

제 생각에 architecture와 microarchitecture 단계까지는 아직까지 HIL일 수 밖에 없다고 생각합니다.
잘못되었을때 뒤의 flow에 영향을 너무 크게 주고, RTL의 특성상 신뢰도는 중요하기 때문입니다.
물론, 뒷 부분도 어느 정도는 HIL로 가겠지만, 점차 줄어들 것으로 봅니다. (저는 Coding Agent가 일종의 새로운 compiler가 될 것이라 생각합니다.)

이 과정에서 중요한 건 읽기의 힘이라고 봅니다.
이제 사람은 많은 것을 읽고 분석해야 하며, 이걸 AI의 도움을 받는다고 해도 결국 많은 부분은 사람이 "선택"해야 할 것입니다.
같은 맥락에서 읽기는 사람에게만 중요한 게 아니라, LLM, coding agent에도 중요합니다.

이 과점에서 LLM, Coding Agent에게 더 효율적인 방향이 뭘까요?
사람이 읽기 쉬운 rich text가 아닌 Markdown등이나 JSON(혹은 YAML)이 훨씬 더 적은 token만 사용합니다.
따라서, 이후의 문서를 Markdown 형식(혹은 비슷한 RST라던지)을 사용해 주는게 더 효율적일 수 밖에 없습니다. (저는 개인적으로 Markdown + Obsidian을 사용하고 있습니다.)

또한, coding agent를 가장 효율적으로 사용할 수 있는 서비스와 도구들을 연결하는 것이 필요합니다.
이걸 하려면 몇가지 운영적인 판단과 결정이 필요하겠죠.

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
