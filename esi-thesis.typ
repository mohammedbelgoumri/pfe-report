#import "titlepage.typ": titelpage
#let esi-thesis(
  title,
  degree,
  option,
  doc,
) = {
  titelpage(title, degree, option)
  doc
}
