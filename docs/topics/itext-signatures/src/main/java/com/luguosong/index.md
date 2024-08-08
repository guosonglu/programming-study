---
icon: material/seal-variant
---

# iText库-PDF签章

## 引言

PDF的主要目的是以可靠的方式查看和打印文档。这项技术的目标是`提供一系列的工具、应用程序和系统软件，使公司能够有效地从任何应用程序中捕获文档，将这些文档的电子版本发送到任何地方，并在任何机器上查看和打印这些文档。`
（Warnock, 1991）

## 我们为什么需要PDF

在《Camelot》论文中提出，并在首次发布《便携式文档格式参考》（Adobe,
1993）以及Adobe创建的第一个PDF软件产品时得以实现。PDF因其能够在屏幕或打印输出时确保一致性而闻名。在接下来的几年里，Adobe和第三方软件供应商推出了大量的新工具，PDF规范也依然活跃。多年来，PDF格式增加了许多功能。因此，PDF已成为许多专业领域和行业中的首选文档格式。

在本文中，我们将重点关注PDF文件的一个特定方面，使得选择PDF而不是其他文档格式成为显而易见的选择：`数字签名`。

## 我们为什么需要数字签名

设想一份具有法律效力的文件。这种文件可能包含关于权利和义务的重要信息，因此需要确保其真实性。你不希望人们否认他们写下的承诺。此外，这份文件可能需要邮寄、查看和存储由不同的各方。在工作流程的不同地方、不同的时间点，文件可能会被更改，可能是自愿的，例如添加额外的签名，不自愿的，例如由于传输错误，或故意的，如果有人想从原始文件中伪造。

几个世纪以来，我们试图通过在纸上签署所谓的`手写签名`来解决这个问题。如今，我们可以使用数字签名来确保：

- `文件的完整性`——我们希望确保文件在工作流程中的某个地方没有被更改
- `文件的真实性`——我们希望确保文件的作者是我们认为的那个人（而不是其他人）
- `不可否认性`——我们希望确保作者不能否认其作者身份

在本文中，我们将重点关注便携式文档格式（PDF）文件。

## 相关资源

- [pdf文档-Digital Signatures for PDF documents](https://itextpdf.com/sites/default/files/2018-12/digitalsignatures20130304.pdf)
- [在线教程](https://itextpdf.com/solutions/electronic-signatures-pdf)
- [PDF文档数字签名的附录](https://itextpdf.com/resources/books/addendum-digital-signatures-pdf-documents)：文档中的代码使用的是iText5版，这里提供了iText7的实现
- [iText 8 现在支持最新的ISO PDF扩展功能，用于数字签名。](https://itextpdf.com/blog/technical-notes/itext-8-supports-latest-digital-signature-extensions)
