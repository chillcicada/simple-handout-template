#import "../utils/font.typ": font-size

#let front-matter(
  // from entry
  font: (:),
  // self
  it,
) = {
  // Reset the counter
  counter(page).update(0)
  set page(numbering: "I")
  it
}
