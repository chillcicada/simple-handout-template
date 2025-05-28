#import "../utils/font.typ": use-size
#import "../utils/numbering.typ": custom-numbering

#import "../imports.typ": i-figured

#let main-matter(
  // from entry
  font: (:),
  twoside: false,
  // options
  page-start: 1,
  page-numbering: "1",
  heading-numbering: (first-level: "第一章 ", depth: 4, format: "1.1 "),
  caption-separator: "  ",
  caption-style: strong,
  caption-size: "五号",
  // self
  it,
) = {
  pagebreak(weak: true, to: if twoside { "odd" })

  // reset the counter
  counter(page).update(page-start)
  set page(numbering: page-numbering)

  show heading: i-figured.reset-counters

  set heading(
    numbering: custom-numbering.with(
      first-level: heading-numbering.first-level,
      depth: heading-numbering.depth,
      heading-numbering.format,
    ),
  )

  show heading: set text(font: font.SongTi, size: use-size("小四"), weight: "bold")

  show heading.where(level: 1): it => {
    pagebreak(weak: true, to: if twoside { "odd" })
    set text(font: font.HeiTi, size: use-size("三号"), weight: "regular")
    align(center, it)
  }

  show heading.where(level: 2): it => {
    set text(font: font.HeiTi, size: use-size("小三"), weight: "regular")
    align(center, it)
  }

  show heading.where(level: 3): it => {
    set text(font: font.SongTi, size: use-size("四号"), weight: "bold")
    align(left, it)
  }

  show math.equation.where(block: true): i-figured.show-equation

  show figure: i-figured.show-figure
  show figure.where(kind: table): set figure.caption(position: top)
  set figure.caption(separator: caption-separator)
  show figure.caption: caption-style
  show figure.caption: set text(font: font.SongTi, size: use-size(caption-size))

  // body text
  set text(font: font.SongTi, size: use-size("小四"), weight: "regular")

  it
}
