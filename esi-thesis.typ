#import "titlepage.typ": titelpage
#let esi-thesis(
  title: none,
  degree: none,
  option: none,
  doc,
) = {
  titelpage(title, degree, option)
  doc
}
