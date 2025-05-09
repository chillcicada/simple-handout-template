#import "layouts/doc.typ": doc, doc-after-cover
#import "layouts/front-matter.typ": front-matter
#import "layouts/main-matter.typ": main-matter
#import "layouts/back-matter.typ": back-matter

#import "pages/font-display.typ": font-display
#import "pages/cover.typ": cover
#import "pages/preface.typ": preface
#import "pages/outline-wrapper.typ": outline-wrapper

#import "utils/font.typ": _support-font-family, font-check

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
    message: "Font family not supported, ensure the font family keys is " + _support-font-family.join(", "),
  )

  return (
    /// ------------- ///
    /// entry options ///
    /// ------------- ///
    twoside: twoside,
    info: info,
    font: font,
    /// ------- ///
    /// layouts ///
    /// ------- ///
    // doc layout
    doc: (..args) => doc(
      info: info,
      ..args,
    ),
    // after cover layout
    doc-after-cover: (..args) => doc-after-cover(
      ..args,
      font: font + font-check(args.named().at("font", default: (:))),
    ),
    // front matter layout
    front-matter: (..args) => front-matter(
      ..args,
      font: font + font-check(args.named().at("font", default: (:))),
    ),
    // main matter layout
    main-matter: (..args) => main-matter(
      ..args,
      font: font + font-check(args.named().at("font", default: (:))),
    ),
    // back matter layout
    back-matter: (..args) => back-matter(
      ..args,
      font: font + font-check(args.named().at("font", default: (:))),
    ),
    /// ----- ///
    /// pages ///
    /// ----- ///
    // font display page
    font-display: (..args) => font-display(
      ..args,
      font: font + font-check(args.named().at("font", default: (:))),
    ),
    // cover page
    cover: (..args) => cover(
      info: info,
      ..args,
      font: font + font-check(args.named().at("font", default: (:))),
    ),
    // preface page
    preface: (..args) => preface(
      twoside: twoside,
      ..args,
      font: font + font-check(args.named().at("font", default: (:))),
    ),
    // outline page
    outline-wrapper: (..args) => outline-wrapper(
      twoside: twoside,
      ..args,
      font: font + font-check(args.named().at("font", default: (:))),
    ),
  )
}
