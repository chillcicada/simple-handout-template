#let notation(
  // from entry
  twoside: false,
  // options
  outlined: true,
  title: [符号对照表],
  width: 100%,
  columns: (96pt, 1fr),
  row-gutter: 12pt,
  chunked: false,
  blank-row-gutter: none,
  ..args,
  // self
  it,
) = {
  assert(type(row-gutter) == length, message: "row-gutter must be a length value here.")

  let blank-row-gutter = if blank-row-gutter == none { 1.5 * row-gutter }

  let _blank-row-inset = if chunked { (blank-row-gutter - 2 * row-gutter) / 2 } else { -row-gutter / 2 }

  pagebreak(weak: true, to: if twoside { "odd" })

  heading(level: 1, numbering: none, outlined: outlined, bookmarked: true, title)

  align(center, block(width: width, align(start, grid(
    columns: columns,
    row-gutter: row-gutter,
    ..args,
    ..it
      .children
      .filter(it => it.func() == parbreak or it.func() == terms.item)
      .map(it => if (it.func() == parbreak) {
        grid.cell(none, colspan: 2, inset: (y: _blank-row-inset))
      } else { (it.term, it.description) }) // terms.item
      .flatten()
  ))))
}
