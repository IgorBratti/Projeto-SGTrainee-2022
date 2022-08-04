clear

@ 02,02 to 10,65 double
@ 02,18 say " SG Sistemas - Exercicio 05 "
nVariavelA := 10
nVariavelB := 20

@ 04,04 say "O valor da nVariavelA e = " + Alltrim( Str(nVariavelA)) + ", e o valor da nVariavelB e = " + Alltrim( Str(nVariavelB))

nTroca     := nVariavelA
nVariavelA := nVariavelB
nVariavelB := nTroca

@ 06,04 say "O valor da troca da nVariavelA com nVariavelB e = " +Alltrim(Str(nVariavelA))
@ 08,04 say "O valor da troca da nVariavelB com nVariavelA e = " +Alltrim(Str(nVariavelB))

Inkey(0)


