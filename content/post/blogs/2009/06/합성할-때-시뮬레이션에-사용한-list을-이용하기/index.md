---
title: 합성할 때 시뮬레이션에 사용한 list을 이용하기
author: babyworm
type: post
date: 2009-06-03T13:49:18+00:00
categories:
  - SoC
  - IP design
  - For beginners
tags:
  - synopsys

---
합성 스크립트 만들다가 얼마전에 모 선배가 합성에 필요한 파일 리스트 만드는 거 귀찮다고 한 것이 기억나서 만들어봤습니다.

뭐, TCL을 사용하시는 분들이면 다들 생각하실 만한 것이라 팁이라고 할 것 까지야 없겠습니다만, 처음 접하시는 분들에게는 도움이 될 것 같아서 올립니다.


보통 ncverilog로 시뮬레이션 할때 (다른 것도 마찬가지지만&#8230;), .f 파일로 불리는 파일리스트를 만들어서 사용하는데, 합성할때 이걸 왠만하면 사용할 수 있습니다.

```
set LIST_FILE "../../vlist.f"
set RTL_FILES ""
if [ catch { open $LIST_FILE r } fileID ] {
      puts stderr "ERROR: $fileID"
      puts stderr "Can not open file ${LIST_FILE}"
      quit
  } else {
   while { [gets $fileID lbuffer] &gt;= 0 } {
      if {[ regexp {(^/{2})} $lbuffer test1 ]} { continue }
      if {$lbuffer == ""} { continue }
      lappend RTL_FILES $lbuffer
    }
  }
  close $fileID
  foreach design $RTL_FILES {
    analyze -format verilog $design
  }
  elaborate $DESIGN_TOP</pre>
```

위의 코드 보시면 아시겠지만, 파일을 읽어서 리스트에 넣는 것 이외에는 특별한 것이 없습니다.
<br>
단지, 공백행 처리와 주석 처리 부분이 들어가 있습니다.
<br>
만일 f 파일에서 ++ 옵션을 사용하시는 분은 여기에 대한 처리를 추가해 주시면 편합니다. (필요하시다면 해당 부분에 간단한 parser를 걸어도 되구요)

요즘은 directory단위로 읽을 수 있는 acs_read_hdl가 더 널리 사용되는 추세입니다. list 파일이 없다면 이것이 절대적으로 편하지요. 디렉토리만 지정하면 subdirectory 뒤져서 파일을 끌고 오니까요.
<br>
단, 필요없는 파일은 `EXCLUDE_LIST`로 지정해야 되어서 약간 귀찮을 때가 있긴합니다.
<br>
list가 있다면 위의 코드를 사용하는 것이 더 편하시겠지요.

여하튼.. 도움이 되면 좋겠습니다.

참고적으로 list file에 `$MY_HOME/aaa/aaa.v` 와 같은 형태로 지정된 경우 위와 같은 analyze를 사용할 수 없습니다. 이때는 간단하게 subfunction을 하나 만들고 synopsys에서 제공하는 `parse_proc_arguments` 함수를 이용해서 이걸 처리하면 됩니다.[^1]

이 방법은 나중에 설명하죠 ^^;

참고적으로 합성 과정에서 define할 것이 없다면 analyze 대신 read_verilog를 사용하셔서 위의 문제를 쉽게 해결 할 수 있습니다. read_verilog는 이미 parse_proc_arguments 를 사용하고 있거든요


[^1]: 더 간단하게는 eval을 사용하면 됩니다만 복잡해지면 subfunction이 더 편하죠
