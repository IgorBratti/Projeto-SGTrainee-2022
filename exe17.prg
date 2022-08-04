/*
Fa‡a um programa que leia uma palavra e imprima invertida
*/

Clear

Do While .t.

   cPalavra := Space(40)

   @ 03,03 say "Digite uma palavra: "
   @ 03,25 get cPalavra Picture "@!"
   read

   nTamanhoPalavra := Len(Alltrim(cPalavra))
   cPalavraInvertida := ""

   Do While nTamanhoPalavra > 0

      cPalavraInvertida += SubStr(cPalavra,nTamanhoPalavra--,1)

   Enddo

   @ 05,03 say "Palavra Invertida: " + Alltrim(cPalavraInvertida)

   Inkey(0)

Enddo

