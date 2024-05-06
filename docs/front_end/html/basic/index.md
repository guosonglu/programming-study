# 基础

## 注释

``` html title="注释"
--8<-- "docs/front_end/html/basic/comment.html"
```

<iframe class="note-demo-iframe" src="comment.html"></iframe>

## 排版相关标签

``` html title="排版相关标签"
--8<-- "docs/front_end/html/basic/typography.html"
```

<iframe class="note-demo-iframe" src="typography.html"></iframe>

## 文本标签

``` html title="文本标签"
--8<-- "docs/front_end/html/basic/text.html"
```

<iframe class="note-demo-iframe" src="text.html"></iframe>

## 图片标签

``` html title="图片标签"
--8<-- "docs/front_end/html/basic/image.html"
```

<iframe class="note-demo-iframe" src="image.html"></iframe>

## 超链接标签

``` html title="超链接标签"
--8<-- "docs/front_end/html/basic/hyperlinks.html"
```

<iframe class="note-demo-iframe" src="hyperlinks.html"></iframe>

## 列表标签

``` html title="列表标签"
--8<-- "docs/front_end/html/basic/list.html"
```

<iframe class="note-demo-iframe" src="list.html"></iframe>

## 表格标签

``` html title="表格标签"
--8<-- "docs/front_end/html/basic/table.html"
```

<iframe class="note-demo-iframe" src="table.html"></iframe>

## 辅助标签

``` html title="辅助标签"
--8<-- "docs/front_end/html/basic/auxiliary.html"
```

<iframe class="note-demo-iframe" src="auxiliary.html"></iframe>

## 表单

``` html title="表单"
--8<-- "docs/front_end/html/basic/form.html"
```

<iframe class="note-demo-iframe" src="form.html"></iframe>

## 框架标签

``` html title="框架标签"
--8<-- "docs/front_end/html/basic/frame.html"
```

<iframe class="note-demo-iframe" src="frame.html"></iframe>

## 字符实体

``` html title="字符实体"
--8<-- "docs/front_end/html/basic/entity.html"
```

<iframe class="note-demo-iframe" src="entity.html"></iframe>

## meta原信息

``` html title="meta原信息"
--8<-- "docs/front_end/html/basic/meta.html"
```

<iframe class="note-demo-iframe" src="meta.html"></iframe>

## H5-布局标签

- `header`: 头部
- `footer`: 底部
- `nav`: 导航
- `article`: 文章
- `section`: 区块
- `aside`: 侧边栏
- `main`: 主要内容,WHATWG没有定义,但是W3C定义了
- `hgroup`: 标题组,W3G将其删除

``` html title="H5-布局标签"
--8<-- "docs/front_end/html/basic/h5_layout.html"
```

<iframe class="note-demo-iframe" src="h5_layout.html"></iframe>

## H5-状态标签

``` html title="H5-状态标签"
--8<-- "docs/front_end/html/basic/h5_meter.html"
```

<iframe class="note-demo-iframe" src="h5_meter.html"></iframe>

## H5-搜索框关键字提示

``` html title="H5-搜索框关键字提示"
--8<-- "docs/front_end/html/basic/h5_datalist.html"
```

<iframe class="note-demo-iframe" src="h5_datalist.html"></iframe>

## H5-详细信息展现元素

``` html title="H5-详细信息展现元素"
--8<-- "docs/front_end/html/basic/h5_details.html"
```

<iframe class="note-demo-iframe" src="h5_details.html"></iframe>

## H5-文本标签

``` html title="H5-文本标签"
--8<-- "docs/front_end/html/basic/h5_text.html"
```

<iframe class="note-demo-iframe" src="h5_text.html"></iframe>

## H5-表单相关

- `placeholder`: 提示文字
- `required`: 必填项
- `autofocus`: 自动聚焦
- `autocomplete`: 自动填充
- `pattern`: 正则表达式

``` html title="H5-表单相关"
--8<-- "docs/front_end/html/basic/h5_form.html"
```

<iframe class="note-demo-iframe" src="h5_form.html"></iframe>

## H5-视频标签

``` html title="H5-视频标签"
--8<-- "docs/front_end/html/basic/h5_video.html"
```

<iframe class="note-demo-iframe" src="h5_video.html"></iframe>

## H5-音频标签

``` html title="H5-音频标签"
--8<-- "docs/front_end/html/basic/h5_audio.html"
```

<iframe class="note-demo-iframe" src="h5_audio.html"></iframe>

## H5兼容性问题

引入[html5shiv.js](https://github.com/aFarkas/html5shiv)

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Your Page Title</title>
  <!--设置IE总是使用最新的文档模式进行渲染-->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!--优先使用webkit内核进行渲染-->
  <meta name="renderer" content="webkit">
  <!-- 添加有条件的 IE 版本检查并加载 html5shiv.js -->
  <!--[if lt IE 9]>
    <script src="path/to/html5shiv.js"></script>
  <![endif]-->
</head>
<body>
<!-- Your content goes here -->
</body>
</html>
```
