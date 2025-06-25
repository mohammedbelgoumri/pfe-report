
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



#let titelpage(
  lang,
  title,
  degree,
  option,
  date,
  defended: false,
  defense_date,
) = {
  set page(paper: "a4", margin: (top: 0.6in, bottom: 0.6in, left: 1in, right: 1in))
  set text(size: 12pt, font: "New Computer Modern")
  show link: set text(blue)
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
  //
  // align(center)[
  //   #text("Mémoire de fin d'études", lang: "fr", size: 13pt, weight: "bold")
  //   #v(4mm)
  //   #text(
  //     degree,
  //     lang: "fr",
  //     size: 13pt,
  //     weight: "bold",
  //   )
  //   #v(4mm)
  //   #text(option, lang: "fr", size: 13pt, weight: "bold")
  //   #v(10mm)
  //   #line(length: 100%)
  //   #text(lang: "fr", size: 16pt, weight: "bold")[#title]
  //   #line(length: 100%)
  // ]

  degree_block(lang, degree, option)
  v(1cm)

  grid(
    align: left,
    columns: (auto, 1fr, auto),
    [
      #text(lang: "fr")[
        _Réalisé par:_ \
        #smallcaps("Belgoumri") Mohammed Djameleddine \
        #link("mailto:im_belgoumri@esi.dz")
      ]
    ],
    [],
    [
      #text(lang: "fr")[
        _Encadré par:_ \
        Pr. #smallcaps("Smaili") Kamel \
        #link("mailto:smaili@loria.fr") \
        Dr. #smallcaps("Langlois") David \
        #link("mailto:david.langlois@loria.fr") \
        Dr. #smallcaps("Zakaria") Chahnez \
        #link("mailto:c_zakaria@esi.dz")
      ]
    ],
  )

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


