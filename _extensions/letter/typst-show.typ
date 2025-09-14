#show: letter.with(
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$elseif(brand.typography.base.family)$
  font: $brand.typography.base.family$,
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$elseif(brand.typography.base.size)$
  fontsize: $brand.typography.base.size$,
$endif$
  pagenumbering: $if(page-numbering)$"$page-numbering$"$else$none$endif$,
$if(address)$
recipient: [
    $for(address)$
    $address$
    $if(address.last)$$else$ \ $endif$
    $endfor$
  ],
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(subject)$
  subject: [$subject$],
$endif$
$if(author)$
  author: [$author$],
$endif$
$if(ps)$
  ps: [$ps$],
$endif$
$if(signature)$
  sig: [$signature$],
$endif$
$if(opening)$
  opening: [$opening$],
$endif$
$if(closing)$
  closing: [$closing$],
$endif$
$if(qualifications)$
  qualifications: [$qualifications$],
$endif$
$if(position)$
  position: [$position$],
$endif$
$if(www)$
  www: "$www$",
$endif$
$if(email)$
  email: "$email$",
$endif$
$if(phone)$
  phone: "$phone$",
$endif$
$if(linestretch)$
  linestretch: $linestretch$,
$endif$
)
