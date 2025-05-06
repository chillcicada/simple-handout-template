#import "@preview/simple-handout-template:0.1.0": define-config

/// 以下字体配置适用于安装了 Windows 10/11 字体及 Windows 10/11 简体中文字体扩展的设备
/// 请勿修改 font-family 中定义的键值，一般情况下，其含义为：
///   SongTi: 宋体，正文字体，通常对应西文中的衬线字体
///   HeiTi: 黑体，标题字体，通常对应西文中的无衬线字体
///   KaiTi: 楷体，用于说明性文本
///   FangSong: 仿宋，通常用于注释、引文及权威性阐述
///   Mono: 等宽字体，对于代码，会优先使用此项
#let font-family = (
  SongTi: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "NSimSun",
  ),
  HeiTi: (
    (name: "Arial", covers: "latin-in-cjk"),
    "SimHei",
  ),
  KaiTi: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "KaiTi",
  ),
  FangSong: (
    (name: "Times New Roman", covers: "latin-in-cjk"),
    "STFangSong",
  ),
  Mono: (
    (name: "Courier New", covers: "latin-in-cjk"),
    "SimHei",
  ),
)

#let (
  /// layouts
  doc,
  after-cover-doc,
  front-matter,
  main-matter,
  back-matter,
  /// pages
  font-display,
  cover,
  preface,
  outline-wrapper,
) = define-config(
  info: (
    title: (
      title: "标 题",
      subtitle: "副标题",
    ),
    authors: (
      (
        name: "作者",
        email: "mail@example.com",
      ),
    ),
    version: "0.0.0",
  ),
  font: font-family,
)

/// Document Configuration
#show: doc

/// Font Display Page
// #font-display()

/// Cover Page
#cover()

/// After Cover Layout, basical layout for Front Matter, Main Matter and Back Matter
#show: after-cover-doc

/// ------------ ///
/// Front Matter ///
/// ------------ ///

#show: front-matter

// Preface Page
#preface()[
  #lorem(100)
]

// Outline Page
#outline-wrapper()

/// ----------- ///
/// Main Matter ///
/// ----------- ///

#show: main-matter

= 第一部分

== 第1.1章

=== 第1.1.1节

/// ----------- ///
/// Back Matter ///
/// ----------- ///

#show: back-matter

// TODO
