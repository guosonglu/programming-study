# 理解数字签名的概念

## 一个简单的PDF示例

下图展示了一个简单的PDF文档，里面只包含`Hello World`这几个词。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202407051639656.png){ loading=lazy }
  <figcaption>图1.1：一个简单的Hello World文件</figcaption>
</figure>

如果我们查看图中展示的PDF文件的内部结构，我们会看到以下的PDF语法：

```text title="代码1.1：PDF文件的内部结构"
%PDF-1.4
%âãÏÓ
2 0 obj
<</Length 73 >>stream
BT
36 806 Td
0 -18 Td
/F1 12 Tf
(Hello World)Tj
0 0 Td
ET
Q
endstream
endobj
4 0 obj
<</Parent 3 0 R/Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB 
/ImageC /ImageI]/Font<</F1 1 0 R>>>>/MediaBox[0 0 595 842]>>
endobj
1 0 obj
<</BaseFont/Helvetica/Type/Font/Encoding/WinAnsiEncoding/Subtype/Type1>>
endobj
3 0 obj
<</ITXT(5.3.0)/Type/Pages/Count 1/Kids[4 0 R]>>
endobj
5 0 obj
<</Type/Catalog/Pages 3 0 R>>
endobj
6 0 obj
<</Producer(iText® 5.3.0 ©2000-2012 1T3XT 
BVBA)/ModDate(D:20120613102725+02'00')/CreationDate(D:20120613102725+02'00')>>
endobj
xref
0 7
0000000000 65535 f 
0000000311 00000 n 
0000000015 00000 n 
0000000399 00000 n 
0000000154 00000 n 
0000000462 00000 n 
0000000507 00000 n 
trailer
<</Root 5 0 R/ID 
[<0f6bb651c0480213fbbd13449b40fe8f><e77fb3c3c64c30ea2a908cd181c5f500>]/Info 6 0 
R/Size 7>>
startxref
643
%%EOF
```

每个PDF文件都以`%PDF-`开头，后跟`版本号`，并以`%%EOF`结尾。在此之间，可以找到不同的PDF对象，这些对象以某种方式定义文档的内容。解释代码示例中显示的所有对象的含义超出了本文的范围。

### 如何伪造PDF文档的内容

假设我们知道如何对文件进行一些小的更改。例如：让我们改变文档的内容、尺寸和元数据。请参见代码示例中标记为高亮的部分。

```text title="代码1.2" hl_lines="9 17 29"
%PDF-1.4
%âãÏÓ
2 0 obj
<</Length 73 >>stream
BT
36 806 Td
0 -18 Td
/F1 12 Tf
(Hello Bruno)Tj
0 0 Td
ET
Q
endstream
endobj
4 0 obj
<</Parent 3 0 R/Contents 2 0 R/Type/Page/Resources<</ProcSet [/PDF /Text /ImageB 
/ImageC /ImageI]/Font<</F1 1 0 R>>>>/MediaBox[0 0 120 806]>>
endobj
1 0 obj
<</BaseFont/Helvetica/Type/Font/Encoding/WinAnsiEncoding/Subtype/Type1>>
endobj
3 0 obj
<</ITXT(5.3.0)/Type/Pages/Count 1/Kids[4 0 R]>>
endobj
5 0 obj
<</Type/Catalog/Pages 3 0 R>>
endobj
6 0 obj
<</Producer(iText® 1.0.0 ©2000-2012 1T3XT 
BVBA)/ModDate(D:20120613102725+02'00')/CreationDate(D:20120613102725+02'00')>>
endobj
xref
0 7
0000000000 65535 f 
0000000311 00000 n 
0000000015 00000 n 
0000000399 00000 n 
0000000154 00000 n 
0000000462 00000 n 
0000000507 00000 n 
trailer
<</Root 5 0 R/ID 
[<0f6bb651c0480213fbbd13449b40fe8f><e77fb3c3c64c30ea2a908cd181c5f500>]/Info 6 0 
R/Size 7>>
startxref
643
%%EOF
```

我手动将单词`World`替换为`Bruno`，将页面尺寸从`595 x 842`改为`120 x 806`，并更改了生产者行中iText的`版本号`。下图展示了结果。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202407051651262.png){ loading=lazy }
  <figcaption>图1.2：一个修改过的Hello World文件</figcaption>
</figure>

!!! warning

    千万不要自行进行这样的操作！在99.9%的情况下，手动更改PDF文件会损坏文件。我之所以这样做，只是为了证明，尽管PDF不是一种文字处理格式，尽管PDF不适合编辑文档，尽管不建议这样做，你仍然可以改变文档的内容。这正是引入数字签名所要避免的问题。

### 一个数字签名的PDF文档

图1.3展示了一个经过数字签名的Hello World文档。蓝色的横幅告诉我们这个文档是`已签名且所有签名都是有效的`
。签名面板告诉我们该文件是由`Bruno Specimen`签名的，并提供更多的签名细节。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202407051705762.png){ loading=lazy }
  <figcaption>图1.3：一个已签名的Hello World文件</figcaption>
</figure>

绿色的勾号表示自签名应用以来，文档`没有被修改`，并且签名者的`身份是有效的`。

### 检查数字签名的语法

```text title="代码1.3：一个已签名的PDF文件的片段" hl_lines="3 4 5 6 7 8 9 10 11 27 28 29 30"
%PDF-1.4
%âãÏÓ
3 0 obj
<</F 132/Type/Annot/Subtype/Widget/Rect[0 0 0 0]/FT/Sig
/DR<<>>/T(signature)/V 1 0 R/P 4 0 R/AP<</N 2 0 R>>>>
endobj
1 0 obj
<</Contents <0481801e6d931d561563fb254e27c846e08325570847ed63d6f9e35 ... b2c8788a5>
/Type/Sig/SubFilter/adbe.pkcs7.detached/Location(Ghent)/M(D:20120928104114+02'00')
/ByteRange [0 160 16546 1745 ]/Filter/Adobe.PPKLite/Reason(Test)/ContactInfo()>>
endobj
...
9 0 obj
<</Length 63>>stream
q
BT
36 806 Td
0 -18 Td
/F1 12 Tf
(Hello World!)Tj
0 0 Td
ET
Q
endstream
endobj
...
11 0 obj
<</Type/Catalog/AcroForm<</Fields[3 0 R]/DR<</Font<</Helv 5 0 R
/ZaDb 6 0 R>>>>/DA(/Helv 0 Tf 0 g )/SigFlags 3>>/Pages 10 0 R>>
endobj
xref
0 12
0000000000 65535 f 
...
0000017736 00000 n 
trailer
<</Root 11 0 R/ID 
[<08ed1afb8ac41e841738c8b24d592465><bd91a30f9c94b8facf5673e7d7c998dc>]/Info 7 0 
R/Size 12>>
startxref
17879
%%EOF
```

请注意，我略微修改了文件，删除了在解释数字签名概念时不相关的字节。

首先让我们检查PDF的`根对象`（也称为`目录对象`）。在代码示例1.3中27到30行（编号为11）。`目录`总是表示为`PDF字典`。

在PDF文件中，`字典`可以很容易地识别出来。它们以`<<`开头，并以`>>`结尾。

在两者之间，你会找到一系列键值对。键总是一个`名称对象`。请注意，名称总是以`/`
开头。例如：如果PDF包含一个表单，你会在目录字典中找到一个名为`/AcroForm`的键。该值将是一个（指向）`字典`
。这个字典将包含一个`/SigFlags`值，如果表单包含数字签名的话。

表单中有一个字段。从`/Fields`数组引用到它：参见`对象3`(3到6行)。名为`signature`（/T(signature)）的字段是类型为`签名的字段`
（/FT/Sig）。我们在图1.3中没有看到签名的可视表示。这是因为Bruno Specimen决定使用`不可见的签名`。定义`小部件注释`
（/Type/Annot/SubType/Widget）的`矩形`（/Rect）具有`零宽度和零高度`（[0 0 0 0]）。

实际的签名可以在`签名字典`中找到（7到11行）。这个字典从`签名字段的值`（/V）引用(第5行)。`签名`
是/Contents条目的值。此签名覆盖PDF文件的所有字节，除了签名字节本身。

请看/ByteRange条目(第10行)：签名覆盖了从0到160字节和从16546到18291字节。签名本身占据了161到16545字节。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/diagrams/java_serve/topics/itext-signatures/chapter01_understanding_the_concept_of_digital_signatures/%E6%95%B0%E5%AD%97%E7%AD%BE%E5%90%8D%E8%AF%AD%E6%B3%95%E7%BB%93%E6%9E%84.svg){ loading=lazy }
  <figcaption>大致结构</figcaption>
</figure>

!!! note

    在使用单词`signature`时，人们可能指的是不同的内容。

    在技术上纯粹的意义上，PDF文件中的签名指的是存储在/Contents条目中的字节。

    然而，当我们谈到页面上的签名表示时，甚至是文件中完整的签名基础设施（注释和签名字典）时，我们也会使用这个词。在本文中，我会尽量准确，但在某些情况下，确切的含义应根据上下文清楚理解。

### 使签名无效

现在，如果我更改签名覆盖的字节范围内的其中一个字节，Adobe Reader 将显示一个红色叉号，而不是绿色的勾号。图1.4
显示了如果我手动将 `World` 替换为 `Bruno` 会发生什么。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202407051814004.png){ loading=lazy }
  <figcaption>图1.4：失效的签名</figcaption>
</figure>

在这种情况下，`签名者的身份`是有效的，但是会显示`文档自签名后已被更改或损坏`。 Adobe Reader
如何知道文档已被更改？要理解这一点，我们需要了解`哈希`的概念，以及需要了解加密的工作原理。

## 生成消息摘要

我记不住所有用来登录不同网站（如Twitter、Facebook、LinkedIn等）的密码。我经常使用`忘记密码`功能。通常情况下，我会收到一个链接，允许我重置密码，但偶尔也会收到一封包含`明文原始密码`的邮件。

一个服务能够提供我的密码意味着我的实际密码可能存储在某个数据库或服务器上。这是一个危险的情况：这意味着任何黑客入侵系统后都可以获取所有用户的密码。

### 如何校验密码

一个简单的检查密码的方法是存储密码的摘要而不是实际的密码。让我们创建一个简单的类来演示这是如何实现的：

``` java title="代码1.4"
--8<-- "docs/topics/itext-signatures/src/main/java/com/luguosong/chapter01_understanding_the_concept_of_digital_signatures/DigestDefault.java"
```

`摘要算法`是一种用于生成数据固定长度的唯一表示的算法。它将任意大小的数据（例如密码）转换为固定长度的哈希值或摘要。常见的摘要算法包括 SHA-256、MD5 等。

> 摘要算法的主要特性是它是单向的，即很难从摘要值反推出原始数据，并且不同的输入几乎总是生成不同的摘要值。因此，它们广泛用于密码存储和数据完整性验证。
