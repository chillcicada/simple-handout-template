#import "../imports.typ": show-cn-fakebold

#let doc(
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

  it
}

#let doc-after-cover(
  // from entry
  font: (:),
  // options
  leading: 1.5 * 15.6pt - 0.7em,
  spacing: 1.5 * 15.6pt - 0.7em,
  indent: 2em,
  justify: true,
  // self
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
