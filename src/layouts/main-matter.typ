#import "../utils/font.typ": font-size
#import "../utils/custom-numbering.typ": custom-numbering

#let main-matter(
  // from entry
  font: (:),
  twoside: false,
  // options
  numbering-style: custom-numbering.with(first-level: "第一章　", depth: 4, "1.1　"),
  page-start: 1,
  page-numbering: "1",
  // self
  it,
) = {
  pagebreak(weak: true, to: if twoside { "odd" })

  // reset the counter
  counter(page).update(page-start)
  set page(numbering: page-numbering)

  set heading(numbering: numbering-style)

  show heading: set text(font: font.SongTi, size: font-size.小四, weight: "bold")

  show heading.where(level: 1): it => {
    pagebreak(weak: true, to: if twoside { "odd" })
    set text(font: font.HeiTi, size: font-size.三号, weight: "regular")
    align(center, it)
  }

  show heading.where(level: 2): it => {
    set text(font: font.HeiTi, size: font-size.小三, weight: "regular")
    align(center, it)
  }

  show heading.where(level: 3): it => {
    set text(font: font.SongTi, size: font-size.四号, weight: "bold")
    align(left, it)
  }

  // body text
  set text(font: font.SongTi, size: font-size.小四, weight: "regular")

  it
}
