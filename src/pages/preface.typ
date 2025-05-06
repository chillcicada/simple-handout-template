#import "../utils/font-size.typ": font-size

#let preface(
  font: (:),
  title: "前　　言",
  twoside: false,
  it,
) = {
  /// Render the preface page
  pagebreak(weak: true, to: if twoside { "odd" })

  // title
  align(center, text(font: font.HeiTi, size: font-size.三号, title))

  v(2em)

  // body
  set text(font: font.SongTi, size: font-size.小四)

  it
}
