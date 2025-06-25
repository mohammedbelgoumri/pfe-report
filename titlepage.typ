
// Degree block
#let degree_block(
  lang,
  degree,
  option,
) = {
  // Validate inputs
  assert(lang in ("fr", "en"), message: "Invalid language")
  assert(degree in ("master", "engineering"), message: "Invalid degree")


  // Language maps
  let en = (
    "to obtain": "To obtain the degree of",
    "master": (
      "degree": "Master in Computer Science",
      "doctype": "Master Thesis",
    ),
    "engineering": (
      "degree": "State Engineer in Computer Science",
      "doctype": "End of Studies Thesis",
    ),
    "option": (
      "siq": "Computer Systems",
      "sil": "Computer and Software Systems",
      "sid": "Computer and Data Systems",
      "sit": "Computer and Information Systems",
    ),
  )

  let fr = (
    "to obtain": "Pour l'obtention du diplôme",
    "master": (
      "degree": "de Master en Informatique",
      "doctype": "Mémoire de master",
    ),
    "engineering": (
      "degree": "d'Ingénieur d'État en Informatique",
      "doctype": "Mémoire de fin d'études",
    ),
    "option": (
      "siq": "Systèmes Informatiques",
      "sil": "Systèmes Informatiques et Logiciels",
      "sid": "Systèmes Informatiques et Données",
      "sit": "Systèmes Informatiques et Systèmes d'Information",
    ),
  )

  let language_map = if lang == "fr" { fr } else { en }
  let tobtain = language_map.at("to obtain")
  let degree = language_map.at(degree)
  let doctype = degree.doctype
  degree = degree.degree
  option = if option in language_map.option.keys() {
    language_map.option.at(option)
  } else {
    option
  }

  align(center)[
    #text(lang: lang, size: 13pt, weight: "bold")[#doctype]
    #v(4mm)
    #text(lang: lang, size: 13pt, weight: "bold")[#tobtain #degree]
    #v(4mm)
    #text(lang: lang, size: 13pt, weight: "bold")[Option: #option]
  ]
}


// Creators block
#let creators_block(
  lang,
  authors,
  supervisors,
  ftl: false,
) = {
  // Validate inputs
  assert(lang in ("fr", "en"), message: "Invalid language")

  let madeby = if lang == "fr" {
    "Réalisé par"
  } else {
    "Made by"
  }

  let supervisedby = if lang == "fr" {
    "Encadré par"
  } else {
    "Supervised by"
  }

  let authorblock = text(lang: lang)[
    _#madeby:_\
    #for author in authors {
      let (fname, lname, email) = author.values()
      lname = smallcaps(lname)
      email = link("mailto:" + email)
      let name = if ftl {
        fname + " " + lname
      } else {
        lname + " " + fname
      }
      text(lang: lang)[
        #name\
        #email\
      ]
    }
  ]

  let supervisorblock = text(lang: lang)[
    _#supervisedby:_\
    #for supervisor in supervisors {
      let (title, fname, lname, email) = supervisor
      lname = smallcaps(lname)
      email = link("mailto:" + email)
      let name = if ftl {
        fname + " " + lname
      } else {
        lname + " " + fname
      }
      text(lang: lang)[
        #title #name\
        #email\
      ]
    }
  ]

  grid(
    align: left,
    columns: (auto, 1fr, auto),
    [
      #authorblock
    ],
    [],
    [
      #supervisorblock
    ],
  )
}


#let titelpage(
  lang,
  title,
  degree,
  option,
  authors,
  supervisors,
  ftl,
  date,
  defended: false,
  defense_date,
) = {
  set page(paper: "a4", margin: (top: 0.6in, bottom: 0.6in, left: 1in, right: 1in))
  set text(size: 12pt, font: "New Computer Modern")
  show link: set text(blue)


  // Validate inputs
  assert(lang in ("fr", "en"), message: "Invalid language")
  assert(
    degree in ("engineering", "master"),
    message: "Invalid degree",
  )
  assert(ftl in (true, false, none), message: "Invalid ftl")
  if ftl == none {
    ftl = if lang == "fr" {
      false
    } else {
      true
    }
  }

  align(center)[
    #text("République Algérienne Démocratique et Populaire", lang: "fr", size: 10pt)\
    #text("الجمهورية الجزائرية الديـموقراطية الشعبية", lang: "ar", font: "Amiri")\
    #text("Ministère de l'Enseignement Supérieur et de la Recherche Scientifique", lang: "fr", size: 10pt)\
    #text("وزارة التعليم العالي والبحث العلمي", lang: "ar", font: "Amiri")
  ]
  align(center, line(length: 100%, stroke: 0.3mm))
  v(4mm)
  grid(
    align: (left, auto, right),
    columns: (auto, 1fr, auto),
    [#box(image("assets/images/esi_logo.png"), width: 5cm)],
    [],
    [
      #text("المدرسة الوطنية العليا للاعلام الآلي", lang: "ar", font: "Amiri")\
      #text("(المعهد الوطني للتكوين في الاعلام الآلي سابقا)", lang: "ar", font: "Amiri")\
      #text("École naationale Supérieure d'informatique", lang: "fr", size: 10pt)\
      #text("ex. INI (Institut National de formation en Informatiques)", lang: "fr", size: 10pt)
    ],
  )
  //
  v(20mm)
  degree_block(lang, degree, option)
  v(10mm)
  align(center)[
    #line(length: 100%)
    #text(lang: "fr", size: 16pt, weight: "bold")[#title]
    #line(length: 100%)
  ]
  v(1cm)

  creators_block(lang, authors, supervisors)

  if defended {
    v(1fr)

    align(center)[
      #box[
        #align(left)[
          #text(lang: "fr")[
            _Soutenu le
            #defense_date.display("[day] [month repr:long] [year]")
            devant le jury composé de:_\
            Dr. #smallcaps("Chebieb") AbdelKrim (ESI): Président\
            Dr. #smallcaps[Hammani] Nacer (ESI): Rapporteur\
            Dr. #smallcaps[Charabi] Leila (ESI): Examinateur
          ]
        ]
      ]
    ]

    v(1fr)
  }
  let yearpair(date: datetime(day: 1, month: 9, year: 2022)) = {
    let month = date.month()
    let start = if month > 8 {
      date.year()
    } else {
      date.year() - 1
    }

    let end = start + 1
    return (start, end)
  }
  date = if date == none { datetime(day: 1, month: 9, year: 2022) } else { date }
  let (start, end) = yearpair(date: date)
  align(center)[#start/#end]
}


