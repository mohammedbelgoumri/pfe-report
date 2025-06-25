#import "titlepage.typ": titelpage







#let date = datetime.today()
#let esi-thesis(
  lang: "fr",
  title: none,
  degree: none,
  option: none,
  date: none,
  defended: true,
  defense_date: datetime(day: 22, month: 6, year: 2023),
  doc,
) = {
  titelpage(lang, title, degree, option, date, defended: defended, defense_date)
  doc
}
