#let titelpage(
  title,
  degree,
  option,
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
  align(center)[
    #text("Mémoire de fin d'études", lang: "fr", size: 13pt, weight: "bold")
    #v(4mm)
    #text(
      degree,
      lang: "fr",
      size: 13pt,
      weight: "bold",
    )
    #v(4mm)
    #text(option, lang: "fr", size: 13pt, weight: "bold")
    #v(10mm)
    #line(length: 100%)
    #text(lang: "fr", size: 16pt, weight: "bold")[#title]
    #line(length: 100%)
  ]

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
        Dr. #smallcaps("LOnglois") David \
        #link("mailto:david.langlois@loria.fr") \
        Dr. #smallcaps("Zakaria") Chahnez \
        #link("mailto:c_zakaria@esi.dz")
      ]
    ],
  )

  v(1fr)

  align(center)[
    #box[
      #align(left)[
        #text(lang: "fr")[
          _Soutenu le
        #datetime(day:22, month: 6, year: 2023).display("[day] [month repr:long] [year]")
        devant le jury composé de:_\
          Dr. #smallcaps("Chebieb") AbdelKrim (ESI): Président\
          Dr. #smallcaps[Hammani] Nacer (ESI): Rapporteur\
          Dr. #smallcaps[Charabi] Leila (ESI): Examinateur
        ]
      ]
    ]
  ]

  v(1fr)
  let yearpair(date: datetime(day: 1, month: 9, year: 2022)) = {
    let this = date.year()
    let next = this + 1
    return (this, next)
  }
  let (this, next) = yearpair()
  align(center)[#this/#next]
}


