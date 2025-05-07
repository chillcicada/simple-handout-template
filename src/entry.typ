#import "layouts/doc.typ": doc, doc-after-cover
#import "layouts/front-matter.typ": front-matter
#import "layouts/main-matter.typ": main-matter
#import "layouts/back-matter.typ": back-matter

#import "pages/font-display.typ": font-display
#import "pages/cover.typ": cover
#import "pages/preface.typ": preface
#import "pages/outline-wrapper.typ": outline-wrapper

#import "utils/font.typ": _support-font-family

#let define-config(
  font: (:),
  twoside: false,
  info: (
    title: (title: "标 题", subtitle: "副标题"),
    authors: ((name: "作者", email: "mail@example.com"),),
    version: "0.0.0",
  ),
) = {
  assert(
    font.keys() == _support-font-family,
    message: "Font family not supported, ensure the font family keys contain " + _support-font-family.join(", "),
  )

  return (
    /// entry options
    twoside: twoside,
    info: info,
    font: font,
    /// layouts
    // doc layout
    doc: (..args) => doc(
      info: info,
      ..args,
    ),
    // after cover layout
    doc-after-cover: (..args) => doc-after-cover(
      font: font,
      ..args,
    ),
    // front matter layout
    front-matter: (..args) => front-matter(
      font: font,
      ..args,
    ),
    // main matter layout
    main-matter: (..args) => main-matter(
      font: font,
      ..args,
    ),
    // back matter layout
    back-matter: (..args) => back-matter(
      font: font,
      ..args,
    ),
    /// pages
    // font display page
    font-display: (..args) => font-display(
      font: font,
      ..args,
    ),
    // cover page
    cover: (..args) => cover(
      info: info,
      font: font,
      ..args,
    ),
    // preface page
    preface: (..args) => preface(
      font: font,
      twoside: twoside,
      ..args,
    ),
    // outline page
    outline-wrapper: (..args) => outline-wrapper(
      font: font,
      twoside: twoside,
      ..args,
    ),
  )
}
