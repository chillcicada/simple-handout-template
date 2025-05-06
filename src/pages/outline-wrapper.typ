#import "../utils/font-size.typ": font-size

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
  above: (30pt, 18pt, 14pt),
  below: (14pt, 14pt, 14pt),
) = {
  /// Parse the outline configuration
  font-list = font-list.map(name => font.at(name))
  size = size.map(name => font-size.at(name))

  /// Render the outline page
  pagebreak(weak: true, to: if twoside { "odd" })

  // title
  align(center, text(font: font.HeiTi, size: font-size.三号, title))

  v(2em)

  set outline(indent: level => indent.slice(0, calc.min(level + 1, indent.len())).sum())

  show outline.entry: entry => block(
    above: above.at(entry.level - 1, default: above.last()),
    below: below.at(entry.level - 1, default: below.last()),
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
