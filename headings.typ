#let heading_conf(lang) = {
  let chapter = if lang == "fr" {
    "Chapitre"
  } else {
    "Chapter"
  }
  set heading(numbering: "1.1")
  show heading.where(level: 1): set heading(supplement: [chapter])
  show heading.where(level: 1): it => {
    it.supplement + " " + context { numbering(it.numbering, counter(heading).get().first()) }
    +" " + it.body
  }
}



// #set heading(numbering: "1.1.1")
// #show heading.where(level: 1): it => pagebreak(weak: true) + chapter + " " + it

