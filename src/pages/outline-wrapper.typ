#import "../utils/font.typ": font-size, _support-font-size, _support-font-family

#let outline-wrapper(
  // from entry
  font: (:),
  twoside: false,
  // self
  gap: 0pt,
  fill: (repeat([.], gap: 0.15em),),
  font-list: ("HeiTi", "SongTi", "FangSong"),
  size: ("小三", "四号", "小四"),
  depth: 3,
  title: "目　　录",
  indent: (0pt, 28pt, 32pt),
  above: (30pt, 18pt, 12pt),
) = {
  /// Parse the outline configuration
  for it in font-list {
    assert(
      _support-font-family.contains(it),
      message: "Font family " + it + " is not supported.",
    )
  }
  font-list = font-list.map(name => font.at(name))

  for it in size {
    if type(it) == str {
      assert(
        _support-font-size.contains(it),
        message: "Font size " + it + " is not supported.",
      )
    } else {
      assert(
        type(it) == length,
        message: "Invalid font size type.",
      )
    }
  }
  size = size.map(it => if type(it) == str { font-size.at(it) } else { it })

  /// Render the outline page
  pagebreak(weak: true, to: if twoside { "odd" })

  // title
  align(center, text(font: font.HeiTi, size: font-size.三号, title))

  v(2em)

  set outline(indent: level => indent.slice(0, calc.min(level + 1, indent.len())).sum())

  show outline.entry: entry => block(
    above: above.at(entry.level - 1, default: above.last()),
    link(
      entry.element.location(),
      entry.indented(
        none,
        {
          text(
            font: font-list.at(entry.level - 1, default: font-list.last()),
            size: size.at(entry.level - 1, default: size.last()),
            {
              if entry.prefix() not in (none, []) {
                entry.prefix()
                h(gap)
              }
              entry.body()
            },
          )
          box(width: 1fr, inset: (x: .25em), fill.at(entry.level - 1, default: fill.last()))
          entry.page()
        },
        gap: gap,
      ),
    ),
  )

  outline(title: none, depth: depth)
}
