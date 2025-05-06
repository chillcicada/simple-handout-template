#import "@preview/cuti:0.3.0": show-fakebold

#let doc(
  info: (:),
  margin: (:),
  lang: "zh",
  font-fallback: false,
  it,
) = {
  // fix bold and italic
  show: show-fakebold

  set text(lang: lang, fallback: font-fallback)

  set page(margin: margin)

  set document(
    title: info.title.title,
    author: info.authors.map(author => author.name),
  )

  it
}
