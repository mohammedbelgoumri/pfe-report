#import "titlepage.typ": titelpage
#let conf(
  title,
  doc,
) = {
  titelpage(title)
  doc
}
