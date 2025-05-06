#import "../utils/font-size.typ": font-size
#import "../utils/custom-numbering.typ": custom-numbering

#let main-matter(
  font: (:),
  twoside: false,
  numbering: custom-numbering.with(first-level: "第一章　", depth: 3, "1.1　"),
  // self
  it,
) = {
  // reset the counter
  pagebreak(weak: true, to: if twoside { "odd" })

  counter(page).update(1)
  set page(numbering: "1")

  set heading(numbering: numbering)

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

  it
}
