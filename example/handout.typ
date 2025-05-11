#import "../src/lib.typ": define-config

/// 以下字体配置适用于安装了 Windows 10/11 字体及 Windows 10/11 简体中文字体扩展的设备，
/// 请勿修改 font-family 中定义的键值，一般情况下，其含义为：
/// - SongTi: 宋体，正文字体，通常对应西文中的衬线字体
/// - HeiTi: 黑体，标题字体，通常对应西文中的无衬线字体
/// - KaiTi: 楷体，用于说明性文本和主观性的表达
/// - FangSong: 仿宋，通常用于注释、引文及权威性阐述
/// - Mono: 等宽字体，对于代码，会优先使用此项，推荐中文字体使用黑体或楷体，或者一些流行的中文等宽字体
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
  doc-after-cover,
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
      title: "高 分 子 流 变 学 讲 义",
      subtitle: "Ploymer Rheology",
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
    version: "0.1.0",
  ),
  font: font-family,
)

/// Document Configuration
#show: doc

/// Font Display Page
// #font-display()

/// Cover Page
// #cover()

/// After Cover Layout, basical layout for Front Matter, Main Matter and Back Matter
#show: doc-after-cover

/// ------------ ///
/// Front Matter ///
/// ------------ ///

#show: front-matter.with(page-start: 1)

// Preface Page
// #preface(date: datetime(year: 2025, month: 5, day: 1))[
//   #include "preface.typ"
// ]

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
