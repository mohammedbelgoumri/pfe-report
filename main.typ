#import "esi-thesis.typ": esi-thesis

#let title = "Création d’un corpus de l’aphasie de Broca et développement d’un système Speech-to-speech de réhabilitation de la parole"
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

#show: esi-thesis.with(
  title: title,
  degree: degree,
  option: option,
  authors: authors,
  supervisors: supervisors,
  jury: jury,
)
