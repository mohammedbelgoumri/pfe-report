#import "esi-thesis.typ": esi-thesis

#let title = [
  Création d’un corpus de l’aphasie de Broca
  et développement d’un système Speech-to-speech de réhabilitation de la parole
]

#let degree = "engineering"
#let option = "siq"
#let authors = (
  (
    "fname": "Mohammed Djameleddine",
    "lname": "Belgoumri",
    "email": "im_belgoumri@esi.dz",
  ),
)
#let supervisors = (
  (
    "title": "Pr.",
    "fname": "Kamel",
    "lname": "Smaïli",
    "email": "smaili@loria.fr",
  ),
  (
    "title": "Dr.",
    "fname": "David",
    "lname": "Langlois",
    "email": "david.langlois@loria.fr",
  ),
  (
    "title": "Dr.",
    "fname": "Chahnez",
    "lname": "Zakaria",
    "email": "c_zakaria@esi.dz",
  ),
)

#let jury = (
  (
    "title": "Dr.",
    "fname": "Chebieb",
    "lname": "AbdelKrim",
    "affiliation": "ESI",
    "role": "Président",
  ),
  (
    "title": "Dr.",
    "fname": "Nacer",
    "lname": "Hammani",
    "affiliation": "ESI",
    "role": "Rapporteur",
  ),
  (
    "title": "Dr.",
    "fname": "Leila",
    "lname": "Charabi",
    "affiliation": "ESI",
    "role": "Examinatrice",
  ),
)

#let date = datetime(day: 1, month: 9, year: 2022)
#let defense_date = datetime(day: 22, month: 6, year: 2023)

#show: esi-thesis.with(
  lang: "fr",
  title: title,
  degree: degree,
  option: option,
  authors: authors,
  date: date,
  supervisors: supervisors,
  defended: true,
  defense_date: defense_date,
  jury: jury,
)


#let lang = "fr"
#let chapter = if lang == "fr" {
  "Chapitre"
} else {
  "Chapter"
}
#set heading(numbering: "1.")
#show heading.where(level: 1): set heading(supplement: chapter, numbering: "1")
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  text(
    size: 25pt,
    weight: "bold",
    (
      it.supplement
        + " "
        + context { numbering(it.numbering, counter(heading).get().first()) } + v(5mm) + it.body + v(5mm)
    ),
  )
}

= Notions générales


= a

// #counter(page).update(1)
// #set page(numbering: "i")


