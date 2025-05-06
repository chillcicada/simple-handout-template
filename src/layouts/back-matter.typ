#import "../utils/font.typ": font-size

#let back-matter(
  // from entry
  font: (:),
  twoside: false,
  // self
  it,
) = {
  /// Render the back matter page
  pagebreak(weak: true, to: if twoside { "odd" })

  it
}
