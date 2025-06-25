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

#show: esi-thesis.with(
  title: title,
  degree: degree,
  option: option,
  authors: authors,
  supervisors: supervisors,
)
