/*
Fa‡a um programa que pergunte ao usu rio uma fruta, repita at‚ que a fruta
digitada for "BANANA"
*/

do while .t.

   Clear
   cFruta := Space(20)

   @ 05, 05 say "Digite o nome de uma fruta: "
   @ 05, 34 get cFruta picture "@!" valid !Empty(cFruta)
   read
   if cFruta == "BANANA"
     @ 07, 05 say "Acertou"
   else
     @ 07, 05 say "Errou"
   endif
   inKey(0)


enddo

