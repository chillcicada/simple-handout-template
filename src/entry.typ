#import "layouts/doc.typ": doc
#import "layouts/after-cover.typ": after-cover
#import "layouts/front-matter.typ": front-matter
#import "layouts/main-matter.typ": main-matter
#import "layouts/back-matter.typ": back-matter

#import "pages/font-display.typ": font-display
#import "pages/cover.typ": cover
#import "pages/preface.typ": preface
#import "pages/outline-wrapper.typ": outline-wrapper


#let define-config(
  twoside: false,
  info: (
    title: (
      title: "标 题",
      subtitle: "副标题",
    ),
    authors: (
      (
        name: "作者",
        email: "mail@example.com",
      ),
    ),
    version: "0.0.0",
  ),
  font: (:),
) = {
  return (
    /// options
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
    after-cover: (..args) => after-cover(
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
