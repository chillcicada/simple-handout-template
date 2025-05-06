#import "../utils/font-size.typ": font-size

#let front-matter(
  font: (:),
  it,
) = {
  // Reset the counter
  counter(page).update(0)
  set page(numbering: "I")
  it
}
