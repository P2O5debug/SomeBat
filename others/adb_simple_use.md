# adb命令的初步使用
```text
查看当前连接设备：
adb devices
安装apk文件：
adb install xxx.apk

此安装方式，如果已经存在，无法安装；
推荐使用覆盖安装：
adb install -r xxx.apk

比分直接RUN出来的包是test-onlu的无法安装，推荐使用**-t**
adb install -r -t xxx.apk

降级安装
adb install -r(replace) -d(downgrade) xxx.apk

卸载App:
adb uninstall com.zhy.app

如果想要保留数据，则：
adb uninstall -k com.zhy.app

传递文件：
往手机SDCard传递文件：
adb push 文件名 手机端SDCard路径

例如：
adb push 帅照.jpg /sdcard/

从手机端下载文件：
adb pull /sdcard/xxx.txt

查看手机端安装的所有app包名:
adb shell pm list packages

发送广播：
adb shell am broadcast -a "broadcastactionfilter"

如果需要携带参数（携带一个Intent,key为name）:

adb shell am broadcast -a "broadcastactionfilter" -e name zhy


屏幕截图：
可以使用screencap命令来进行手机屏幕截图，例如：
adb shell screencap /sdcard/screen.png

录制视频：
可以使用screenrecord[options] filename命令来录制屏幕视频，例如：

adb shell screenrecord /sdcard/demo.mp4
需要停止时按 Ctrl-C，默认录制时间和最长录制时间都是 180 秒。
--verbose	在命令行屏幕显示日志信息。如果您不设置此选项，则该实用程序在运行时不会显示任何信息。



屏幕分辨率
命令：

adb shell wm size
屏幕密度
命令：

adb shell wm density

分辨率
命令：

adb shell wm size 480x1024
表示将分辨率修改为 480px * 1024px。

恢复原分辨率命令：

adb shell wm size reset
屏幕密度
命令：

adb shell wm density 160
表示将屏幕密度修改为 160dpi。

恢复原屏幕密度命令：

adb shell wm density reset

显示上正在屏幕上的显示的应用活动
adb shell pm dumpsys window | findstr mCurrentFocus
不用root手机也能够卸载系统应用
这里 --user 0就是以root身份去执行命令

adb shell pm uninstall -k --user 0 com.qihoo.browser


 强制编译
要强制编译，请运行以下命令：


adb shell cmd package compile
强制编译特定软件包的常见用例：

基于配置文件：

adb shell cmd package compile -m speed-profile -f my-package
全面：

adb shell cmd package compile -m speed -f my-package
强制编译所有软件包的常见用例：

基于配置文件：

adb shell cmd package compile -m speed-profile -f -a
全面：

adb shell cmd package compile -m speed -f -a
清除配置文件数据
要清除配置文件数据并移除经过编译的代码，请运行以下命令：

针对一个软件包：

adb shell cmd package compile --reset my-package
针对所有软件包：

adb shell cmd package compile --reset -a

部分参数

adb shell pm uninstall com.example.MyApp

list packages [options] filter	输出所有软件包，或者，仅输出软件包名称包含 filter 中的文本的软件包。


具体选项：

-f：查看它们的关联文件。
-d：进行过滤以仅显示已停用的软件包。
-e：进行过滤以仅显示已启用的软件包。
-s：进行过滤以仅显示系统软件包。
-3：进行过滤以仅显示第三方软件包。
-i：查看软件包的安装程序。
-u：也包括已卸载的软件包。
--user user_id：要查询的用户空间


install [options] path	将软件包（通过 path 指定）安装到系统。
具体选项：

-r：重新安装现有应用，并保留其数据。
-t：允许安装测试 APK。仅当您运行或调试了应用或者使用了 Android Studio 的 Build > Build APK 命令时，Gradle 才会生成测试 APK。如果是使用开发者预览版 SDK（如果 targetSdkVersion 是字母，而非数字）构建的 APK，那么安装测试 APK 时必须在 install 命令中包含 -t 选项。
-i installer_package_name：指定安装程序软件包名称。
--install-location location：使用以下某个值设置安装位置：
0：使用默认安装位置。
1：在内部设备存储上安装。
2：在外部介质上安装。
-f：在内部系统内存上安装软件包。
-d：允许版本代码降级。
-g：授予应用清单中列出的所有权限。
--fastdeploy：通过仅更新已更改的 APK 部分来快速更新安装的软件包。
--incremental：仅安装 APK 中启动应用所需的部分，同时在后台流式传输剩余数据。如要使用此功能，您必须为 APK 签名，创建一个 APK 签名方案 v4 文件，并将此文件放在 APK 所在的目录中。只有部分设备支持此功能。此选项会强制 adb 使用该功能，如果该功能不受支持，则会失败（并提供有关失败原因的详细信息）。附加 --wait 选项，可等到 APK 完全安装完毕后再授予对 APK 的访问权限。
--no-incremental 可阻止 adb 使用此功能。

uninstall [options] package	从系统中移除软件包。
具体选项：

-k：移除软件包后保留数据和缓存目录。
clear package	删除与软件包关联的所有数据。
enable package_or_component	启用给定的软件包或组件（写为“package/class”）。
disable package_or_component	停用给定的软件包或组件（写为“package/class”）。
disable-user [options] package_or_component	
具体选项：

--user user_id：要停用的用户。


list users	输出系统中的所有用户。

trim-caches desired_free_space	减少缓存文件以达到给定的可用空间。
create-user user_name	创建具有给定 user_name 的新用户，从而输出该用户的新用户标识符。
remove-user user_id



adb shell input keyevent <keycode> 命令，不同的 keycode 能实现不同的功能，完整的 keycode 列表详见 KeyEvent，摘引部分我觉得有意思的如下：

keycode	含义
3	HOME 键
4	返回键
5	打开拨号应用
6	挂断电话
24	增加音量
25	降低音量
26	电源键
27	拍照（需要在相机应用里）
64	打开浏览器
82	菜单键
85	播放/暂停
86	停止播放
87	播放下一首
88	播放上一首
122	移动光标到行首或列表顶部
123	移动光标到行末或列表底部
126	恢复播放
127	暂停播放
164	静音
176	打开系统设置
187	切换应用
207	打开联系人
208	打开日历
209	打开音乐
210	打开计算器
220	降低屏幕亮度
221	提高屏幕亮度
223	系统休眠
224	点亮屏幕
231	打开语音助手
276	如果没有 wakelock 则让系统休眠
下面是 input 命令的一些用法举例。

电源键
命令：

adb shell input keyevent 26
执行效果相当于按电源键。

菜单键
命令：

adb shell input keyevent 82
HOME 键
命令：

adb shell input keyevent 3
返回键
命令：

adb shell input keyevent 4
音量控制
增加音量：

adb shell input keyevent 24
降低音量：

adb shell input keyevent 25
静音：

adb shell input keyevent 164
媒体控制
播放/暂停：

adb shell input keyevent 85
停止播放：

adb shell input keyevent 86
播放下一首：

adb shell input keyevent 87
播放上一首：

adb shell input keyevent 88
恢复播放：

adb shell input keyevent 126
暂停播放：

adb shell input keyevent 127
点亮/熄灭屏幕
可以通过上文讲述过的模拟电源键来切换点亮和熄灭屏幕，但如果明确地想要点亮或者熄灭屏幕，那可以使用如下方法。

点亮屏幕：

adb shell input keyevent 224
熄灭屏幕：

adb shell input keyevent 223
滑动解锁
如果锁屏没有密码，是通过滑动手势解锁，那么可以通过 input swipe 来解锁。

命令（参数以机型 Nexus 5，向上滑动手势解锁举例）：

adb shell input swipe 300 1000 300 500
参数 300 1000 300 500 分别表示起始点x坐标 起始点y坐标 结束点x坐标 结束点y坐标。

输入文本
在焦点处于某文本框时，可以通过 input 命令来输入文本。

命令：

adb shell input text hello
现在 hello 出现在文本框了。
```