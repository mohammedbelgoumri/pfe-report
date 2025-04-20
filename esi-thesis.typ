#import "titlepage.typ": titelpage
#let conf(
  title,
  degree,
  option,
  doc,
) = {
  titelpage(title, degree, option)
  doc
}
