#import "../utils/font.typ": font-size, _support-font-family

#let preface(
  // from entry
  font: (:),
  twoside: false,
  // options
  date: datetime.today(),
  title: "前　　言",
  body-font: "FangSong",
  back-font: "KaiTi",
  // self
  it,
) = {
  assert(_support-font-family.contains(body-font), message: "不支持的字体族：" + body-font)
  assert(_support-font-family.contains(back-font), message: "不支持的字体族：" + body-font)

  /// Render the preface page
  pagebreak(weak: true, to: if twoside { "odd" })

  // title
  align(center, text(font: font.HeiTi, size: font-size.三号, title))

  v(2em)

  // body
  set text(font: font.at(body-font), size: font-size.小四)

  it

  // back
  align(right, text(font: font.at(back-font), size: font-size.小四, date.display("[year] 年 [month] 月 [day] 日")))
}
