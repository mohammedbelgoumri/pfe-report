#import "titlepage.typ": titelpage
// #import "headings.typ": *


#let esi-thesis(
  lang: "fr",
  title: none,
  degree: none,
  option: none,
  authors: (),
  supervisors: (),
  ftl: none,
  date: none,
  defended: true,
  defense_date: datetime(day: 22, month: 6, year: 2023),
  jury: (),
  doc,
) = {
  set page(paper: "a4", margin: (top: 0.6in, bottom: 0.6in, left: 1in, right: 1in))
  set text(size: 12pt, font: "New Computer Modern")
  show link: set text(blue)
  titelpage(
    lang,
    title,
    degree,
    option,
    authors,
    supervisors,
    ftl,
    date,
    defended: defended,
    defense_date,
    jury: jury,
  )
  doc
}
