# cmd命令的进阶操作

介绍一些比较实用的指令：比如要清屏，clear screen--cls，pause暂停，实际上当程序正在运行的时候按ctrl+c可以停止命令。唉，那么复制用什么呢？用鼠标右键，当然，你强行ctrl+c也能输入上去。按上下方向键可以切换到刚刚使用过的指令。

data和time可以显示时间，/?中有具体参数。注释用remark--rem标注，或者用::在需要注释的代码前标注。这里支持goto命令，需要用：标注标签方便跳转。find命令用于查找，通常可以配合管道符号|来使用，前一个的输出变为后一个的输入。tree可以显示目录结构。

```text
    介绍一些常见的符号： 
        ||  顺序执行，第一个正确就停止
        |   管道符号，前一个输出作为后一个输入
        &   顺序执行，不管是否成功执行，cmd中一行代码是一条指令，这个相当于把下面几行指令写在了同一行。
        &&  顺序执行，第一个错误就不执行，是否成功执行可由变量%errorlevel%来看
        重定向符号不再描述
    介绍变量：
        真是有程序的地方就有变量，这里的变量主要有字符串和数字两种。用set声明。
        set var=word
        set /a num=1
        想要调用变量就需要再变量两边加上%，
        echo %var%  打印出var的值，或者直接用set
        set            可以显示所有变量的值，是所有变量。
        set v       可以显示以v开头的变量的值。
        set p=aa1bb1aa2bb2     #设置变量p，并赋值为 = 后面的字符串，即aa1bb1aa2bb2
    echo %p%               #显示变量p代表的字符串，即aa1bb1aa2bb2
    echo %p:~6%            #显示变量p中第6个字符以后的所有字符，即aa2bb2
    echo %p:~6,3%          #显示第6个字符以后的3个字符，即aa2
    echo %p:~0,3%          #显示前3个字符，即aa1
    echo %p:~-2%           #显示最后面的2个字符，即b2
    echo %p:~0,-2%         #显示除了最后2个字符以外的其它字符，即aa1bb1aa2b
    echo %p:aa=c%          #用c替换变量p中所有的aa，即显示c1bb1c2bb2
    echo %p:aa=%           #将变量p中的所有aa字符串置换为空，即显示1bb12bb2
    echo %p:*bb=c%         #第一个bb及其之前的所有字符被替换为c，即显示c1aa2bb2
    set p=%p:*bb=c%        #设置变量p，赋值为 %p:*bb=c% ，即c1aa2bb2
    set /a p=39            #设置p为数值型变量，值为39
    set /a p=39/10         #支持运算符，有小数时用去尾法，39/10=3.9，去尾得3，p=3set /a p=p/10          #用 /a
    参数时，在 = 后面的变量可以不加%直接引用set /a p="1&0"         #"与"运算，要加引号。其它支持的运算符参见

set/?
set p=                 #取消p变量
set /p p=请输入屏幕上显示"请输入"，并会将输入的字符串赋值给变量p注意这条可以用来取代 choice 命令
注意变量在 if 和 for 的复合语句里是一次性全部替换的，如
@echo off
set p=aaa
if %p%==aaa (   
  echo %p%   
  set p=bbb   
  echo %p%    )
结果将显示aaaaaa因为在读取 if 语句时已经将所有 %p% 替换为aaa这里的"替换"，在 /? 帮助里就是指"扩充"、"环境

变量扩充"可以启用"延缓环境变量扩充"，用 ! 来引用变量，即 !变量名!
@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set p=aaaif %p%==aaa (  
  echo %p%   
set p=bbb   
echo !p!    )
ENDLOCAL
结果将显示aaabbb
start批处理中调用外部程序的命令，否则等外部程序完成后才继续执行剩下的指令
start explorer d:\调用图形界面打开D盘
@echo offcd /d %~dp0regedit /s 劲舞团.regstart patcher.exe
不加 start 命令的话，"劲舞团"运行时，后面会有个黑乎乎的cmd窗口
call批处理中调用另外一个批处理的命令，否则剩下的批处理指令将不会被执行有时有的应用程序用start调用出错的
assoc 和 ftype文件关联assoc 设置'文件扩展名'关联，关联到'文件类型'ftype 设置'文件类型'关联，关联到'执行程序和参数'当你双击一个.txt文件时，windows并不是根据.txt直接判断用 notepad.exe 打开而是先判断.txt属于 txtfile '文件类型'再调用 txtfile 关联的命令行 txtfile=%SystemRoot%\system32\NOTEPAD.EXE %1可以在"文件夹选项"→"文件类型"里修改这2种关联
assoc           #显示所有'文件扩展名'关联
assoc .txt      #显示.txt代表的'文件类型'，结果显示 .txt=txtfile
assoc .doc      #显示.doc代表的'文件类型'，结果显示 .doc=Word.Document.8
assoc .exe      #显示.exe代表的'文件类型'，结果显示 .exe=exefile
ftype           #显示所有'文件类型'关联
ftype exefile   #显示exefile类型关联的命令行，结果显示 exefile="%1" %* assoc .txt=Word.Document.8设置.txt为word类型的文档，可以看到.txt文件的图标都变了
    assoc .txt=txtfile恢复.txt的正确关联 ftype exefile="%1" %*恢复 exefile 的正确关联
    如果该关联已经被破坏，可以运行 command.com ，再输入这条命令



cmd窗口的装饰：
    color，title，prompt，属性中的透明度什么也行。



```





