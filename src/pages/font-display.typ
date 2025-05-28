#import "../utils/font.typ": use-size, _support-font-size

/// Font Display Page
#let font-display(
  // from entry
  font: (:),
  // options
  size: "小四",
) = {
  /// Auxiliary function to display fonts
  let display-font(cjk-name, latin-name) = [
    #line(length: 100%)

    #set text(font: font.at(latin-name))

    #cjk-name (#latin-name CJK Regular): 落霞与孤鹜齐飞，秋水共长天一色。

    #cjk-name (#latin-name Latin Regular): The fanfare of birds announces the morning.

    *#cjk-name (#latin-name CJK Bold): 落霞与孤鹜齐飞，秋水共长天一色。*

    *#cjk-name (#latin-name Latin Bold): The fanfare of birds announces the morning.*
  ]

  /// Render the page
  set text(size: use-size(size), font: font.SongTi)

  [
    *字体展示页 | 请调整字体配置至正确渲染*

    *Fonts Display Page | Adjust the font configuration to render correctly*
  ]

  let font-list = (
    ("宋体", "SongTi"),
    ("黑体", "HeiTi"),
    ("楷体", "KaiTi"),
    ("仿宋", "FangSong"),
    ("等宽", "Mono"),
  )

  for it in font-list { display-font(..it) }

  // always break page to odd page after this page
  pagebreak(to: "odd")
}
