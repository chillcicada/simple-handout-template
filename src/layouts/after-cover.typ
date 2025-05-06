#import "../utils/font-size.typ": font-size

#let after-cover(
  font: (:),
  leading: 1.5 * 15.6pt - 0.7em,
  spacing: 1.5 * 15.6pt - 0.7em,
  indent: 2em,
  justify: true,
  it,
) = {
  set par(
    justify: justify,
    leading: leading,
    spacing: spacing,
    first-line-indent: (amount: indent, all: true),
  )

  set list(indent: indent)

  show raw: set text(font: font.Mono)

  show terms: set par(first-line-indent: 0em)

  it
}
