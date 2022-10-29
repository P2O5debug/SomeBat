# cmd命令的初级使用

老实讲，cmd和dos命令不好区别，cmd是一种窗口，而dos是早期的一种计算机操作系统.
这样来看，cmd帮助我们用dos方式操作计算机。

网络操作不在我的考虑范围内，所以这里主要介绍一些文件操作指令。

磁盘里主要元素是文件夹和文件，因为有文件夹里面却不一定会有文件，并不是文件组成的文件夹。

那么我们的操作主要针对文件夹和文件。

对于文件夹的操作：创建，复制，剪切（移动），粘贴，重命名，删除
对于文件  的操作：创建，复制，剪切（移动），粘贴，重命名，删除 

> 在正式了解dos指令前，先入乡随俗，认识几个单词：
```cmd
directory 目录
file      文件
create    创建
copy      复制
cut(move) 剪切（移动）
paste     粘贴
rename    重命名
delete    删除
```

>还有一个路径的概念，路径说明了文件是在哪个目录下的哪个位置，例如C:\desktop\myFile.txt就说明在c盘下一个叫desktop的目录下有一个叫myFile的txt文件

所有指令后面加上/?就可以看到帮助信息，直接输入就可以看到一些列举的内部指令。

## 目录操作：
- 显示目录内容:
```text
    如果我们要显示当前路径下的目录，直接输入指令 dir ，
如果是要显示某一路径下的内容，则输入dir + 空格 + 路径 ，若路径中有空格，则用半角（英文）符号 " 括起来就行，你问怎么括？就把有空格的包起来就行，或者全包起来也行。
```

- 切换目录：
```text
    这里的切换目录包括打开目录以及返回上个目录。change directory--cd 可以在不同目录路径下进行切换。具体操作为 cd + 空格 + 目录路径（也可以是单个目录）
cd createwFile 就是进入 createFile 文件夹内，
cd ..           返回上级目录，在路径规则中，一个点是当前目录，两个点是上级目录。
cd firstFile\secondFile 进入firstFile目录下的secondFile目录
cd /D music\lrc   从c盘切换到d盘的music目录下的lrc文件夹， /D 是一个参数，代表 drive （驱动盘），更多参数从帮助中获得。
路径太长的话可以按tab键，会自动补全一部分
```

- 创建目录：
```text
    从理论上讲，创建目录是create directory--cd ，但是 cd 是 change directory ，所以这里创建目录为 make directory--md (mkdir)
md D:\photoNewfile 在d盘下创建一个 photoNewfile 文件夹
```

- 复制目录：
```text
    没有这个命令--是的，并没有直接复制目录的命令，可以通过其它操作来达到这一目的。
移动目录：
    按照规律，移动目录大概是 什么d 这样的，比如 move directory--med（因为 md 是创建目录），但实际上只用 move 就行 
move C:\music D:\music music 目录从c盘移动到了d盘
move C:\music D:\musicMovefile 目录移动后顺便改了个名字。
实际上，move也可以直接移动文件，不局限于目录，所以move 后没跟directory
```

- 粘贴目录：
```text
    都是立马确定目标路径的，所以粘贴就没有指令。
```
- 重命名目录：
```text
    这个可以直接中move指令完成，只要路径不变，改个名字就行
move music newMusic     将此路径下music改为newMusic
    也有指令， rename--ren 可以看出来，对于目录和文件ren都管用
ren music newmusicSecond 将此路径下的music改为newmusicSecond
```
- 删除目录：
```text
    这个用的是 remove directory--rd(rmdir)移除目录，没错，delete用来删除文件了
rd music 如果里面有东西，那么就删不掉，需要加上参数/S,不想要提示则加上/Q
rd /S /Q music
```

## 对于文件的操作：
- 创建文件：
```text
    在cmd中，创建文件需要用上重定向符号 > < >> <<开口方向表示信息流向，一个符号表示覆盖信息，两个符号表示追加信息，而重定向不是指令，创建一个文件是需要一个指令来完成的。
cd . >newTxt.txt 创建一个空的txt文件，其中cd . 的意思是保持当前路径不变，cd >newTxt.txt 则会在文件中写入当前路径
echo.>newTxt.txt 创建一个空的txt文件，echo的作用相当于编程语言中的print，这里echo.是表示输出一个换行，>使得换行进入txt文件中
```

- 打开文件：
```text
    cmd中文件都是以txt文本格式打开，主要有type和more两种方式
type newTxt.txt
more newTxt.txt
区别可能是more更适合看比较长的文本。
```

- 复制文件：
```text
    copy只能用来复制文件
copy C:\music\oldboy.mp3 D:\music\oldboy.mp3    将oldboy文件从c盘复制到d盘，名字可以更改。
copy frist.txt+second.txt third.txt             是的，copy可以合并两个txt的内容，对其它文件格式不行。
copy C:\music\*.* D:\music\                 将c盘music内所有文件复制到d盘music文件内，当然了，文件夹需要提前新建，这里的*是正则表达式中的通配符。*.*的意思是 任意名字.任意后缀 四舍五入就是全部文件
```

- 移动文件：
```text
    move的用法与对文件夹的操作一样，只不过要具体到文件名。
move C:\music\*.mp3 D:\music\       是的，运用通配符可以移动多个文件，到这里会发现，在用图形界面时我们可以选中任意文件对其进行操作，但在这里，任意文件的选择离不开通配符，而通配符会匹配具有相似特征的一类文件，并不是任意文件
```

- 粘贴文件：
```text
    没有粘贴文件。
```

- 重命名文件：
```text
    ren与重命名目录用法一样，也可以用move
```

- 删除文件：
```text
    del(delete)+空格+文件路径 删除文件，参数可以用/?来看
```
