# git 命令

```git

git init            ------> 目录变为git可以管理
ls -ah              ------> 可以查看 .git 文件夹

git add .           ------> 添加全部文件进入暂存区
git commit -m "worte a readme file"
                    ------> -m "message" 提交到仓库
git status          ------> 掌握仓库当前的状态
git diff            ------> 当 “git status” 出现红色 “modified” 时，可用 “git diff” 查看修改内容

git log             ------> 查看提交日志
git log --pretty=oneline
                    ------> 只输出 id 号和 “commit” 内容
git relog           ------> 输出关键信息，记录了每一个命令可配合 reset
git log --graph     ------> 输出时间线

git reset --hard HEAD^
                    ------> 从仓库中回退到上个版本
                 HEAD^^
                 HEAD~100
git reset --hard commit id 
                    ------> 可以回到未来的某个版本， id 要前五位就行

-----工作区------        版本库--------------------------------------
|              |        |    ----------       head    -----------  |
|              |    add |   |  stage   |           \ |  master   | |
|            --|--------|-> |         -|-------------|->         | |
|              |        |   |          |     commit  |           | |
|              |        |   |          |             |           | |
|              |        |    ----------               -----------  |
----------------         ------------------------------------------

文件已添加到暂存区且未修改
git reset head readme.txt     ------> 可把暂存区撤销
再用 git checkout --readme.txt ------> 丢弃工作区修改

文件已添加到暂存区且修改
git reset ···
git checkout ···
执行以上命令可回到添加到暂存区前的状态
git checkout ···
回到暂存区内的文件状态，撤销了修改

场景1：改乱了工作区的某个文件的内容，想直接丢弃工作区的修改，用git checkout 
场景2：不仅改乱还添加到了stage ,想丢弃，先git reset 回到场景1
场景3：工作区文件乱了，想回到暂存区状态，git checkout

当工作区删除了一个文件，而版本库有，git status 立刻会告知哪些文件被删除
1.从版本库中删除，用 git rm 删除，并 git commit ，可从版本库中删除，本地也删除了。

git push -u origin master     -------> 第一次强制推送到github
git push origin master        -------> 推送到github
git remote add origin         -------> 添加远程仓库
git remote -v                 -------> 查看远程库信息
git remote rm origin          -------> 删除绑定关系

master指向提交 -----------> head指向master，head指向提交

git checkout -b dev           -------> 创建dev分支并切换到dev
git branch dev
git checkout                  -------> 同上

git branch                    -------> 重看当前分支

git merge dev                 -------> 合并dev分支到master分支上，实际上合并指定分支到当前分支

git branch -d dev             -------> 删除dev分支

git switch                    -------> 同git git checkout
git switch -c feature         -------> 创建并切换

当两个分支出现冲突时，必须手动解决
git status 可查明冲突

git merge --no-ff -m "内容" dev 会在主分支上留下提交日志

git stash                     -------> 储藏当前工作现场
git stash lish                -------> 查看
git stash apply stash@{0}     -------> 恢复
git stash pop                 -------> 恢复同时删除stash

git cherry -pick commit id    -------> 复制到特定提交到当前分支

git remote -v                 -------> 显示远程仓库信息

git tag v1.0                  -------> 给当前最新提交打tag
git tag                       -------> 查看所有标签，按字母排序
git tag v0.9 f52c633          -------> 给对应commit id 打tag标签
git show <tagname>            -------> 查看标签信息
git tag -a v0.1 -m "version 0.1 released" 1094adb
                              -------> 带说明的标签，可用git show 查看
git tag -d v0.1               -------> 删除标签
git push origin v1.0          -------> 远程推送
git push origin --tag

标签已推送到远程
先删除本地
git tag -d v0.9
再删除远程
git push origin :refs/tags/v0.9

.gitignore
忽略文件添加进去， “#” 注释
add 时 -f强制提交
git checkout - ignore -v 文件名 -------> 检查是否在 .gitignore 中

git diff                      -------> 比较工作区和暂存区
git diff head                 -------> 比较工作区和上次commit
git diff --cached             -------> 比较暂存区和上一次commit

git reset <file>              -------> 将文件从暂存区一出，保持工作区内容
git reset                     -------> 移出所有暂存区修改
git reset --hard              -------> 移出暂存区，回到版本库最新状态
git reset --hard <commit>     -------> 当前分支回滚，清除暂存区的修改，删除工作区修改
git reset commit id           -------> 回滚到指定commit ，清除暂存区修改，但工作区不变
git rm --cached <filename>    -------> 从暂存区删除,再提交后，回从仓库中删除
git revert head               -------> 撤销提交


```