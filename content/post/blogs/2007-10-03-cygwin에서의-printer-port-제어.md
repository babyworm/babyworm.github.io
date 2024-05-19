---
title: Cygwin에서의 printer port 제어
author: babyworm
type: post
date: 2007-10-03T03:28:03+00:00
url: /archives/316
categories:
  - verification
tags:
  - cygwin

---
별 다른 내용은 아닙니다만, 기억해두기 위해서 적습니다. 

JTAG을 이용한 디버거를 만들고, PC상에서 테스트 하는데 소프트웨어 팀에서 만든 비주얼 스튜디오 기반의 프로그램은 제가 고칠수가 없어서(VS 라이센스가 한정되어 있다보니..), cygwin상에서 간단하게 제어하는 프로그램을 만들게 되었습니다. 

제가 알기로는 linux의 경우 /port/prn 을 이용해서 간단하게 printer port를 제어할 수 있었던 것으로 기억합니다만(물론, permio같은 것을 써야 겠습니다만..), cygwin에서는 이 방법은 안되더군요. 

그래서, 어쩔수 없이 giveio라는 범용 device driver를 하나 올리고, 이걸 통해서 cygwin에서 제어하는 방법을 사용했습니다. 항상 그렇지만, 중요한 부분(말하자면, 제가 기억하고 있어야 하는 부분 ^^)은 cygwin에서 windows 라이브러리(windows API)를 포함시켜서, 다른 것에서와 거의 동일하게 windows용 device driver를 연결하면 된다는 것이지요..&nbsp; 그 부분은 아래와 같습니다. 



<textarea name="code" class="c++"><br /> #include <stdio.h><br /> #include <sys/io.h><br /> #include <windows.h><br /> #define BASE_LPT 0x378<br /> #define TDI 0x1<br /> #define TMS 0x2<br /> #define TCK 0x4<br /> #define TRST 0x8<br /> #define TDO 0x40</p> 

<p>
  void init_jtag() ;
</p>

<p>
  int main (int argc, char *argv[])<br /> {<br /> int fd;
</p>

<p>
  printf (&#8220;testing program\n&#8221;);
</p>

<p>
  OSVERSIONINFO osvs;<br /> osvs.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);<br /> GetVersionEx(&osvs);
</p>

<p>
  if(osvs.dwPlatformId == VER_PLATFORM_WIN32_NT) {<br /> printf(&#8220;win 32\n&#8221;);<br /> HANDLE handle;
</p>

<p>
  handle = CreateFile(&#8220;\\\\.\\giveio&#8221;, GENERIC_READ, 0, NULL,<br /> OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
</p>

<p>
  if(handle == INVALID_HANDLE_VALUE) {<br /> fprintf(stderr,&#8221;Couldn&#8217;t access giveio device&#8221;);<br /> }<br /> CloseHandle(handle);<br /> }<br /> else {<br /> printf(&#8220;Not a win 32\n&#8221;);<br /> }
</p>

<p>
  init_jtag();
</p>

<p>
  return 0;<br /> }<br /> </textarea>
</p>