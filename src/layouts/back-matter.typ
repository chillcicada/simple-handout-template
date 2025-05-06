#import "../utils/font-size.typ": font-size

#let back-matter(
  font: (:),
  twoside: false,
  it,
) = {
  /// Render the back matter page
  pagebreak(weak: true, to: if twoside { "odd" })

  it
}
