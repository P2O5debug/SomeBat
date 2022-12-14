# 一些批处理的说明

---

## 前言
> 本文主要分为······不好意思，我没想好要怎么分╮(～▽～)╭，能看懂行。

$不好意思，我改主意了，这里记录的东西将会不具有实用价值，只具有模板意义。$

---

## 基础知识

### 怎样使用批处理？

双击批处理可能会打不开。这种情况与用 **gcc** 编译**c** 语言时很类似。实际上并不是没有打开文件，而是程序已经运行完成关闭了，只不过速度极快，想要看到运行过程，则需要添加交互。例如在程序中加入 $pause$,让运行将要结束时暂停。但是不可能所有程序我们都可以随意改动，这时候“**命令提示符**”就可以派上用场。

>**命令提示符** 指的是你在 **Windows** 左下角搜索栏中搜索 **cmd** 所出现的应用程序。

在**命令提示符**中，我们通过命令行执行操作。**cmd**算是**Windows**上的类**Dos**操作系统,$Disk\;Operating\;System$。与之相对的就是图形用户界面$Graphical\;User\;Interface$，简称**GUI**，又称图形用户接口。

_事先介绍必要的**cmd**命令_

```cmd
cd      新建文件夹                     ——>            change directory      目录转换
cd      ..                           ——>            ".." 代表上级目录       运回上级目录
dir                                  ——>            directory             显示当前路径下的文件夹及文件
mkdir   新建文件夹                     ——>            make directory       新建文件夹
rmdir   新建文件夹                     ——>            remove directory     删除文件夹
ren     新建文件夹  新建文件夹2          ——>           rename                重命名
echo.>a.txt                           ——>           echo(回显)             新建a.txt
```

---------------------------------------


如上所说，批处理大多时候直接打不开，需要在命令行中使用。
cmd 的编码是 gbk ，而批处理的文本编码可能为 utf-8 ，就导致有时候中文会乱码，同一编码后就可以正常显示中文了。可以在 utf -8 编码下的批处理文件中加入

```cmd
chcp 65001
```

来使得 cmd 编码从 gbk 转为 utf-8 

[**cmd的简单使用**](./others/cmd_simple_use.md)

[**cmd的进阶使用**](./others/cmd_complex_use.md)

[**cmd的高级使用**](./others/cmd_hard_use.md)
> 从 批处理之家 复制过来的

[**adb的简单使用**](./others/adb_simple_use.md)

[**正则表达式的简单使用**](./others/regex_simple_use.md)
> 知乎上的教程


[**vim的简单使用**](./others/vim_simple_use.md)


[**git的简单使用**](./others/git_simple_use.md)

