let $step1_xsl := saxon:compile-stylesheet(doc("pandora.xsl"))
let $step2_xsl := saxon:compile-stylesheet(doc("pandora-step2.xsl"))
let $step3_xsl := saxon:compile-stylesheet(doc("pandora-step3.xsl"))
let $step1 := document {saxon:transform($step1_xsl, .)}
let $step2 := document {saxon:transform($step2_xsl, $step1)}
let $step3 := document {saxon:transform($step3_xsl, $step2)}
return
    $step3