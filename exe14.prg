/*
 Encontre os ERROS na Seguinte rotina, Corrija indicando as Linhas:

do while.t.
   nCodCli := Space(06)
   @ 12,10 say "Informe o c¢digo do cliente:'
   @ 12,40 get nCodCli pict "999999"
   read

   if lastkey() == 27
      loop
   endif

endoo
*/

clear

do while .t.

   nCodCli := Space(06)
   @ 12,10 say "Informe o c¢digo do cliente:"
   @ 12,40 get nCodCli picture "999999"
   read

   if lastkey() == 27
     exit
   endif

enddo


