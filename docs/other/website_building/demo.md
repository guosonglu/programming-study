# markdown示例

## 标题(Headings)

```markdown
# 一级标题

## 二级标题

### 三级标题

#### 四级标题

##### 五级标题

###### 六级标题
```

## 文本强调(Emphasis)

**加粗**

*斜体*

***加粗加斜体***

```markdown
**加粗**

*斜体*

***加粗加斜体***
```

## 引用(Blockquotes)

> 多萝西跟着她穿过她的城堡中的许多美丽房间。
>
> 女巫命令她清洗锅碗瓢盆，扫地，还要不断给火炉加木柴。
>
>> 嵌套引用

```markdown
> 多萝西跟着她穿过她的城堡中的许多美丽房间。
>
> 女巫命令她清洗锅碗瓢盆，扫地，还要不断给火炉加木柴。
>
>> 嵌套引用
```

## 列表(Lists)

- 无序列表1
- 无序列表2
- 无序列表3

***

1. 有序列表1
2. 有序列表2
3. 有序列表3

```markdown
- 无序列表1
- 无序列表2
- 无序列表3

1. 有序列表1
2. 有序列表2
3. 有序列表3
```

## 代码(Code)

At the command prompt, type `nano`.

```markdown
At the command prompt, type `nano`.
```

## 水平线(Horizontal Rules)

***

---

```markdown
***

---
```

## 链接(Links)

### 基本链接

My favorite search engine is [google](https://www.google.com).

My favorite search engine is [google](https://www.google.com "鼠标悬停提示").

```markdown
My favorite search engine is [google](https://www.google.com).

My favorite search engine is [google](https://www.google.com "鼠标悬停提示").
```

### 直接将url转为链接

<https://www.markdownguide.org>

<fake@example.com>

```markdown
<https://www.markdownguide.org>

<fake@example.com>
```

### 链接格式化

I love supporting the **[EFF](https://eff.org)**.

This is the *[Markdown Guide](https://www.markdownguide.org)*.

See the section on [`code`](#code).

```markdown
I love supporting the **[EFF](https://eff.org)**.

This is the *[Markdown Guide](https://www.markdownguide.org)*.

See the section on [`code`](#code).
```

### 参考链接

In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends
of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to
eat: it was a [hobbit-hole][1], and that means comfort.

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"

```markdown
In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends
of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to
eat: it was a [hobbit-hole][1], and that means comfort.

[1]: <https://en.wikipedia.org/wiki/Hobbit#Lifestyle> "Hobbit lifestyles"
```

## 图片(Images)

### 基本图片

![image](img/demo.jpg)

```markdown
![image](img/demo.jpg)
```

### material-带标题的图片

<figure markdown="span">
  ![Image title](img/demo.jpg)
  <figcaption>Image caption</figcaption>
</figure>

```markdown
<figure markdown="span">
  ![Image title](img/demo.jpg)
  <figcaption>Image caption</figcaption>
</figure>
```

## 表格

### 简单表格

| First Header | Second Header | Third Header |
|--------------|---------------|--------------|
| Content Cell | Content Cell  | Content Cell |
| Content Cell | Content Cell  | Content Cell |

```markdown
| First Header | Second Header | Third Header |
|--------------|---------------|--------------|
| Content Cell | Content Cell  | Content Cell |
| Content Cell | Content Cell  | Content Cell |
```

### 指定每一列对其方式

| First Header | Second Header | Third Header |
|:-------------|:-------------:|-------------:|
| 左对齐          |     居中对齐      |          右对齐 |
| x            |       x       |            x |

```markdown
| First Header | Second Header | Third Header |
|:-------------|:-------------:|-------------:|
| 左对齐          |     居中对齐      |          右对齐 |
| x            |       x       |            x |
```


