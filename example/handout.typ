#import "../src/lib.typ" as template
#import template: define-config

/// 以下字体配置适用于安装了 Windows 10/11 字体及 Windows 10/11 简体中文字体扩展的设备，
/// 请勿修改 font-family 中定义的键值，一般情况下，其含义为：
/// - SongTi: 宋体，正文字体，通常对应西文中的衬线字体
/// - HeiTi: 黑体，标题字体，通常对应西文中的无衬线字体
/// - KaiTi: 楷体，用于说明性文本和主观性的表达
/// - FangSong: 仿宋，通常用于注释、引文及权威性阐述
/// - Mono: 等宽字体，对于代码，会优先使用此项，推荐中文字体使用黑体或楷体，或者一些流行的中文等宽字体
/// - Math: 数学字体，通常用于数学公式和符号
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
    (name: "DejaVu Sans Mono", covers: "latin-in-cjk"),
    "SimHei",
  ),
  Math: (
    "New Computer Modern Math",
    "KaiTi",
  ),
)

#let (
  /// layouts
  meta,
  doc,
  front-matter,
  main-matter,
  back-matter,
  /// pages
  font-display,
  cover,
  preface,
  outline-wrapper,
  figure-list,
  table-list,
) = define-config(
  info: (
    title: (
      title: "高 分 子 流 变 学 讲 义",
      subtitle: "Polymer Rheology",
    ),
    authors: (
      (
        name: "作者1",
        email: "example@mails.tsinghua.edu.cn",
      ),
      (
        name: "作者2",
        email: "example@mails.tsinghua.edu.cn",
      ),
      (
        name: "作者3",
        email: "example@mails.tsinghua.edu.cn",
      ),
      (
        name: "作者4",
        email: "example@mails.tsinghua.edu.cn",
      ),
    ),
    version: "0.3.0",
  ),
  font: font-family,
)

/// Document Configuration
#show: meta

/// Font Display Page
// #font-display()

/// Cover Page
#cover(display-version: true)

/// After Cover Layout, basical layout for Front Matter, Main Matter and Back Matter
#show: doc

/// ------------ ///
/// Front Matter ///
/// ------------ ///

#show: front-matter

// Preface Page
#preface(date: datetime(year: 2025, month: 5, day: 1))[
  #include "preface.typ"
]

// Outline Page
#outline-wrapper()

/// ----------- ///
/// Main Matter ///
/// ----------- ///

#show: main-matter

/// Load Chapters
#include "chapter/chapter1.typ"
#include "chapter/chapter2.typ"
#include "chapter/chapter3.typ"
#include "chapter/chapter4.typ"

/// ----------- ///
/// Back Matter ///
/// ----------- ///

#show: back-matter

#figure-list()

#table-list()
