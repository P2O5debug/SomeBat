# 正则表达式
- 元字符：
```text
        .       匹配除换行符的任意字符
        \w      匹配字母或数字或下划线或汉字
        \s      匹配任意的空白符
        \d      匹配数字
        \b      匹配单词的开头或结束
        ^       匹配字符串的开始
        $       匹配字符串的结束
        字母大写反向匹配。
    例如：
        1.匹配有abc开头的字符串：
            \babc或者^abc
        2.匹配8位数字的qq号码：
            ^\d\d\d\d\d\d\d\d$
        匹配1开头11位数字的手机号码：
            ^1\d\d\d\d\d\d\d\d\d\d\d$
        是的，简单粗暴，直接往上加就行了，哪有什么格式。
```
- 重复限定符：
```text
    为了避免每次匹配手机号码都写那么长，所以用重复限定符简化表达式：
    重复限定符（一般 放在后面）：
        *       重复零次或者更多次
        +       重复一次或者更多次
        ？      重复零次或者一次
        {n}     重复n次
        {n,}    重复n次或更多次
        {n,m}   重复n到m次
    现在简化
    例如：
        1.匹配8位数字的qq号码
            ^\d{8}$
        2.匹配1开头11位数字的手机号码：
            ^1\d{10}$
        3.匹配银行卡号是14~18位数字：
            ^\d{14,18}$
        4.匹配以a开头的，0个或者多个b结尾的字符串
            ^ab*$
        是的，符号默认情况下作用于一个字符。
```

- 分组
```text
    为了解决这个问题，要用括号
    例如：
        ^(ab)*匹配包含0到斗个ab开头的字符串，没有结尾限定是因为没有用$.
```
- 转义
```text
    懂得都懂，用\.
```

- 条件
```text
    懂得都懂
        |   或
        例如匹配手机号码开头：
            ^(130|131|132|155|156|185|186|145|176)\d{8}$
```

- 区间
```text
    1.限定0到9简写为[0-9]
    2.限定A到Z简写为[A-Z]
    3.普通的限定[165]    
    则手机号码改写为：
        ^((13[0-2])|(15[56])|(18[5-6])|145|176)\d{8}$
    但是[^0-9]+匹配所有的非数字字符，包括换行符。
```

- 贪婪与懒惰
```text
    直接看例子：我需要匹配<span><b></b></span>从以下文字中：
    <span><b>This is a sample text</b></span>
    若是我直接用<.+>去匹配，则会把整段文字选中，因为第一个span前面<和最后一个span后面>的内容也符合条件,优先匹配最多，称为贪婪匹配。
    将<.+>改为<.+?>由贪婪匹配改为懒惰匹配，即可匹配需要的内容。
```

1. 正则表达式30分钟入门教程 作者: deerchao https://deerchao.cn/tutorials/regex/regex.htm
2. Regex tutorial — A quick cheatsheet by examples (英文) 作者: Jonny Fox https://medium.com/factory-mind/regex-tutorial-a-simple-cheatsheet-by-examples-649dc1c3f285
3. Regular Expressions Tutorial (英文) https://www.regular-expressions.info/tutorial.html
4. 正则表达式在线测试工具：https://regex101.com/
5. https://github.com/ziishaned/learn-regex/tree/master/translations
6. https://regexlearn.com/zh-cn/

