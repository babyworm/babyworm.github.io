---
title: PLI에서 TCP/IP를 통해서 통신하고, perl server에서 처리하기
author: babyworm
type: post
date: 2007-12-04T10:22:36+00:00
categories:
  - verification
  - PLI
tags:
  - PLI
  - TK
  - verilogHDL

---
예전에 PLI에서 윈도우 제어 하려고 별짓을 다했었는데, 그 중에 PLI에서 TK 윈도우를 바로 부른 것도 있었습니다. PLI에서 TK를 부르는(C-TK interwork을 이용한) 방법은 TK 스크립을 거의 직접 쓸 수 있다는 점에서 편리하긴 한데, NCVerilog에서 너무 버전을 심하게 탄다는 단점(TK의 버전도 맞춰 줘야 합니다. -_-;)이 있어서 환경이 바뀌면서 잘 안쓰게 되더군요.

게다가 시뮬레이션 돌리면서 이런 저런것을 실시간 출력할때 UNIX/Linux/Windows 안가리는 인터페이스를 고민하다보니, TCP/IP와 Perl 만한게 없더군요. Simulator에서 이런 저런 GUI 부분이 귀찮아서 socket 기반으로 만들었던 기억을 되살려 하나 만들어봤습니다. PLI에서 TCP/IP 패킷을 전송하는 부분을 하나 만들어봤습니다.

```C
#include <stdio.h>
#include <"arpa/inet.h">
#include <"net/netinet.h">
#include <"sys/socket.h">
#include <"sys/types.h"> #include "vpi_user.h"

#define DEST_IP "127.0.0.1"
#define DEST_PORT 7890

static struct sockaddr_in dest_addr;

static int count = 0;
static int sockfd;
int counta;

PLI_INT32 cosim_hello_calltf(PLI_BYTE8 *userdata) {
        char buf[1024];
        s_vpi_time ctime;
        ctime.type = vpiScaledRealTime;
        vpi_get_time(NULL, &ctime);
        vpi_printf("[%2.2f] Hello VPI: %d, %d\n", ctime.real, count, counta);
        sprintf(buf, "\n##[%2.2f] Hello VPI: %d, %d\n", ctime.real, count, counta);
        send(sockfd, &buf, sizeof(buf), 0);

        count++;
        counta++;
        return(0);
}

PLI_INT32 cosim_hello_init() {
        int len, result;
        counta = 100;
        sockfd = socket(AF_INET, SOCK_STREAM, 0);

        dest_addr.sin_family = AF_INET;
        dest_addr.sin_port = htons(DEST_PORT);
        dest_addr.sin_addr.s_addr = inet_addr(DEST_IP);

        len = sizeof(dest_addr);
        result = connect(sockfd, (struct sockaddr *)&dest_addr, len);

        if (result == -1) {
                fprintf(stderr, "socket open error\n");
                exit(1);
        }

        return(0);
}

void cosim_register_hello() {
        s_vpi_systf_data tf_data;
        tf_data.type = vpiSysTask; // make as task
        tf_data.sysfunctype = 0;
        tf_data.tfname = "$cosim_hello";
        tf_data.calltf = cosim_hello_calltf;
        tf_data.compiletf = cosim_hello_init;
        tf_data.sizetf = NULL;
        tf_data.user_data = NULL;
        vpi_register_systf(&tf_data);
}

void (*vlog_startup_routines[])() = {cosim_register_hello, 0}

```



별 내용은 없고, 그냥 verilog code에서 cosim_hello()를 호출하면 loop돌면서 값을 출력하는 예제입니다.

&nbsp;

이 코드 틀은 다이나릿의 기안도 박사님 IDEC 강좌 자료에 있는 &#8220;HW/SW 동시 협조 시뮬레이션&#8221;이란 강좌의 첫번째 PLI 예제에서 따왔으며, 저는 이 함수에 TCP/IP 전송이 가능하도록 수정하였습니다.

컴파일은 다음과 같이 일반적인 NCVerilog 컴파일과 다르지 않지요. (Windows에서 Modelsim 사용하시는 분은 gcc보다는 visual c++의 cl 을 사용하시는 것이 속 편합니다. MingW 버전의 gcc가 되기는 하는데, Modelsim에서 버전을 상당히 심하게 탔던 것으로 기억됩니다. 요즘 버전은 어떨지 모르겠습니다만. )

&nbsp;

```bash
$gcc -I$CDS_HOME/tools/inca/include -c cosim_hello.c
$ld -shared -o cosim.so cosim_hello.o
```

NCVerilog Compile & Elaboration



```bash
$ ncvlog -work worklib test_hello.v
$ ncelab worklib.test_hello -loadvpi ./cosim:cosim_register_hello
$ ncsim worklib.test_hello
```


이런 식으로 사용하면 되는데, 위의 패킷을 받아줄 서버는 간단히 perl로 짜주면 됩니다. Perl-TK로 GUI를 작성하는 것도 가능하구요.

이때 한가지 주의해야 할 점은 perl의 `IO::INET` 의 `accept()` 함수가 blocking type이기 때문에 이것을 non-blocking type으로 해 주시고 loop을 돌려야지만 `DoOneEvent()` 함수가 정상적으로 수행된다는 점이지요.<br>
(설마 MainLoop()로 돌리실 분은 없을 테니 ^^;) 저도 처음엔 `DoOneEvent`함수가 좀처럼 동작을 안하는 것처럼 느껴져서 헤맸습니다. 결론은 `accept()`함수 문제더군요.

perl 함수의 주요 부분만간단히 정리하자면(예제를 위해서 perl script를 하나 더 만들기가 귀찮고, 전체 내용은 회사 작업이라 공개할 수 없고.. 라는 어려움 때문에 별로 문제 안되는 부분만 올립니다. )

```perl
use strict;
use IO::Socket;
use Tk;
use encoding 'utf-8';    # 한글 쓰시려면..
use Fcntl qw(F_GETFL F_SETFL O_NONBLOCK);

my $portnum = 7890;

# make a socket

my $mw = MainWindow->new(-title=>"Terminal");

.....

my $sock = IO::Socket::INET->new(
                LocalHost => 'localhost',
                LocalPort => $portnum,
                Proto => 'tcp',
                Listen => 10, # SOMAXCONN 으로 해도 됩니다.
                Reuse => 1,
                TimeOut => 1,
                );

....
my($new_sock, $c_addr, $buf, $flag);
...

# NonBlocking으로 만듭시다.
$flag = fcntl($sock, F_GETFL, 0) or die "Can not get flag: $!\n";
$flag = fcntl($sock, F_SETFL, $flag | O_NONBLOCK) or die "Can not set flag: $!\n";

while(1) {
        while (($new_sock, $c_addr) = $sock->accept()) {
                ... 소켓에서 읽어서 일하세요....
                        DoOneEvent(0);
        }
```

&nbsp;

요런 식이라는 것이지요. 중간 중간에 엄청 생략되어 있음은 유의하세요..
