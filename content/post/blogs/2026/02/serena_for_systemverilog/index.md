---
title: "Serena for SystemVerilog"
author: babyworm
type: post
description: ""
date: 2026-02-24T00:00:00+09:00
draft: false
tags: []
categories: []
showComments: true
---

많은 분들이 Serena를 아실 것이라 생각합니다.

코드를 Symbol 단위로 분석하고, 조작할 수 있는 MCP 서버죠. 즉, LLM에서 코드를 하나 하나 읽어보지 않고, 언어의 의미 단위(즉, 함수, 변수, 클래스 등등)로 이해할 수 있도록 도와주는 MCP입니다. 그래서, 많은 agentic coding tool에서 사용되고 있죠. (저도 context7과 더불어 거의 매번 사용하고 있고요.)


최근에 systemverilog RTL coding agent를 작성하다보면, 항상 LSP plugin을 추가하고 LSP를 사용하도록 하는 작업을 하게 되더군요(효과도 좋고요)
그런데, 기본적으로 Serena에서 systemverilog를 지원하면 특별한 plugin을 사용하지 않아도 조금 더 잘하지 않을까 하는 생각이 들더군요.

그래서, Serena 프로젝트에 SystemVerilog LSP 지원을 추가하는 작업을 진행해서 PR을 보냈는데, 최근에 merge되었습니다.

처음에는 제가 많이 사용하는 slang을 기반으로 LSP를 연결했는데, 설치 문제로 일단은 여러 바이너리를 잘 제공하는 verible-verilog-ls를 사용해서 Serena에 연결했습니다.

이제 곧 Serena만 사용하시는 분들도 systemverilog 파일을 조작하거나 review하실때 도움을 받으실 수 있을 것으로 생각합니다.
