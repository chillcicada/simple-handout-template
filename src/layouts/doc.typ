#import "../utils/font.typ": use-size

#import "../imports.typ": show-cn-fakebold

#let meta(
  // from entry
  info: (:),
  // options
  margin: (:),
  lang: "zh",
  region: "zh",
  fallback: false,
  // self
  it,
) = {
  // fix bold and italic
  show: show-cn-fakebold

  set text(lang: lang, fallback: fallback, region: region)

  set page(margin: margin)

  set document(
    title: info.title.title,
    author: info.authors.map(author => author.name),
  )

  set heading(bookmarked: true)

  it
}

#let doc(
  // from entry
  font: (:),
  // options
  indent: 2em,
  justify: true,
  leading: 1.5 * 15.6pt - 0.7em,
  spacing: 1.5 * 15.6pt - 0.7em,
  code-block-leading: 1em,
  code-block-spacing: 1em,
  body-size: "小四",
  math-size: "小四",
  fontnote-size: "五号",
  underline-offset: .1em,
  underline-stroke: .05em,
  underline-evade: false,
  enum-numbering: "①",
  // self
  it,
) = {
  /// Paragraph
  ///
  /// set justify, leading, spacing, and first-line-indent
  set par(
    justify: justify,
    leading: leading,
    spacing: spacing,
    first-line-indent: (amount: indent, all: true),
  )

  /// List
  ///
  /// set indent for list
  set list(indent: indent)

  /// Raw
  ///
  /// set font for raw block
  show raw: set text(font: font.Mono)

  // unset paragraph for raw block
  show raw.where(block: true): set par(
    leading: code-block-leading,
    spacing: code-block-spacing,
  )

  /// Term
  ///
  /// disable first-line-indent for terms
  show terms: set par(first-line-indent: 0em)

  /// Fontnote
  show footnote.entry: set text(font: font.SongTi, size: use-size("五号"))

  /// Math Equation
  show math.equation: set text(font: font.Math, size: use-size(math-size))

  /// Heading
  ///
  /// only set default font family
  /// set font weight to "regular" for better HeiTi performance
  show heading: set text(font: font.HeiTi, weight: "regular")

  /// Body Text
  ///
  /// set default body font family and size
  set text(font: font.SongTi, size: use-size(body-size))

  /// Underline
  ///
  /// fix underline offset and stroke
  set underline(
    offset: underline-offset,
    stroke: underline-stroke,
    evade: underline-evade,
  )

  /// Enum
  ///
  /// set default enum numbering and indent
  set enum(numbering: enum-numbering, indent: indent)

  it
}
