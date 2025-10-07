---
title: GeSHi를 사용하는 CodeHighlighter를 위한 verilog문법 정의 파일
author: babyworm
type: post
date: 2006-10-28T12:27:48+00:00
categories:
  - 'SoC &amp; IP design'
tags:
  - GeSHi
  - Syntax highlighting
  - verilog HDL

---
테터보드나 WordPress에서 [GeSHi][1]라는 문법 강조기를 이용하여 code highlighting 모듈이 많이 만들어지고 있습니다. 제가 사용하고 있는 [Lang-to-HTML][2]도 그렇구요..

아쉬운 점은 제가 블로그상에 자주 포스팅하는 내용이 verilog HDL이라는 하드웨어 설계/기술 언어를 사용해서 설명되는 경우가 많은데.. GeSHi에는 verilog HDL code에 대한 하이라이팅 기능이 없다는 것이었습니다.  
그래서, 그냥 GeSHi상에서 적용할 수 있는 verilog 문법 파일을 하나 만들어봤습니다. 

GeSHi의 문법파일 지정 방식이 직관적이어서 처음 생각했던것 보다 빠르게 만들수 있었습니다. ^^;

적용은 간단합니다.  
아래 파일의 압축을 해제하셔서, &nbsp;플러그인의 geshi디렉토리에 올리시고, Language이름은 **Verilog**로 지정하시면 됩니다. 예를들어 Lang-to-html의 경우 code type=Verilog 으로 쓰시면 됩니다.  
 cfile29.uf.194297594D6A7AA240E756.rar</a>  
개인적으로 쓰려고 만든것이라 버그가 있을수도 있으니 혹 발견하시면 제보해 주세요..

 [1]: http://qbnz.com/highlighter/
 [2]: http://www.kornuri.com/blog/entry/태터툴즈-플러그인-Languages-To-Html-각종-프로그래밍-소스-하이라이팅
