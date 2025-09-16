// This function gets your whole document as its `body`
// and formats it as a simple letter.

#let letter(
  margin: (x: 2cm, y: 2cm, top: 1.5cm, bottom: 4.5cm),
  paper: "a4",
  lang: "en",
  region: "AU",
  font: "libertinus serif",
  fontsize: 11pt,
  linestretch: 1.3,
  pagenumbering: "1",
  qualifications: none,
  position: none,
  www: none,
  email: none,
  phone: none,
  department: "Department of Econometrics & Business Statistics",
  university: "Monash University, Victoria 3800, Australia.",
  ps: none,
  opening: "To whom it may concern",
  closing: "Yours sincerely",
  sig: "",
  // The letter's recipient, which is displayed close to the top.
  recipient: none,

  // The date, displayed to the right.
  date: none,

  // The subject line.
  subject: none,

  // The name with which the letter closes.
  author: "",

  // The letter's content.
  body
) = {
  // Configure page and text properties - normal margins for all pages
  set page(
    paper: paper,
    margin: margin,
    // Remove default numbering and use custom footer instead
    footer: context {
      let page-num = here().page()
      if page-num > 1 {
        v(1.7cm)  // Push page number 1cm lower
        align(center, str(page-num))
      }
    }
  )

  set par(
    justify: true,
    leading: linestretch * 0.7em,
    spacing: linestretch * 1.3em
  )
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set text(font: "libertinus serif", size: 11pt)

  // Make all links blue
  show link: set text(fill: rgb(0, 0, 255))

  // Place footer content on first page only
  place(
    bottom + right,
    dx: 0.7cm,
    dy: 3.5cm,
    context {
      if here().page() == 1 {
        grid(
          columns: 3,
          column-gutter: 9pt,
          image("AACSB.png", height: 0.6cm),
          image("EQUIS.png", height: 0.6cm),
          image("AMBA.png", height: 0.6cm)
        )
      }
    }
  )

  // Display sender at bottom left of first page only
  place(
    bottom + left,
    dx: -0.8cm,
    dy: 3.5cm,
    context {
      if here().page() == 1 {
        block[
          #set text(font: "fira sans", fill: rgb(100,100,100), size: 9pt)
          #set par(leading: 0.6em)
          #strong(author)#if(qualifications != none) [, #qualifications] \
          #if(position != none) [
            #position \
          ]
          #if (department != none) [
            #department \
          ]
          #if(university != none) [
            #university \
          ]
          #v(1pt)
          #if(email != none or phone != none or www != none) [
            #let contact-items = ()
            #if(email != none) {
              contact-items.push([#text(font: "Font Awesome 6 Free", size: 8pt, "\u{f0e0}") #email.replace("\\@", "@")])
            }
            #if(phone != none) {
              contact-items.push([#text(font: "Font Awesome 6 Free", size: 8pt, "\u{f095}") #phone])
            }
            #if(www != none) {
              contact-items.push([#text(font: "Font Awesome 6 Free", size: 8pt, "\u{f015}") #www])
            }
            #contact-items.join([#h(10pt)])
          ]
          #v(1pt)
          ABN: 12 377 614 012    CRICOS Provider Number: 00008C
        ]
      }
    }
  )

  v(-16pt)
  grid(
      columns: (1fr, 1fr),
      align: (left, right),
      [
        #image("monash2.png", height: 1.5cm)
      ],
      [
        #image("MBSportrait.jpg", height: 1.5cm)
      ]
  )
  v(25pt)

  // Display date. If there's no date add some hidden
  // text to keep the same spacing.
  align(left, if date != none {
    date
  } else {
    hide("a")
  })

  v(0.25cm)

  // Display recipient
  if recipient != none {
    block[
      #set par(leading: 0.6em)
      #recipient
    ]
  }

  v(0.5cm)

  // Add opening salutation
  if opening != none {
    opening
    v(0.2cm)
  }

  // Add the subject line, if any.
  if subject != none {
    pad(right: 10%, strong("Re: " + subject))
  }

  // Add body and name.
  body

  v(0.2cm)

  closing

  if(sig != "" and sig != none) {
    v(-0.2cm)
    pad(left: 0.5cm, bottom: -0.5cm)[
      #let sig-path = if type(sig) == content {
        repr(sig).slice(1, -1) // Remove quotes from repr
      } else {
        sig
      }
      #image(sig-path, height: 1.5cm)
    ]
  } else {
    v(1cm)
  }
  if ps != none {
    v(1cm)
    ps
  }
}
