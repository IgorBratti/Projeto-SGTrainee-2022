/*
Apresentar os resultados de uma tabuada de um n£mero digitado (a estrutura de repeti‡Æo deve variar de 1 … 10)
*/

   nValorTabuada := 0

   @ 01, 07 say 'Tabuada Automatica'
   @ 02, 04 say 'Valor da Tabuada Desejada: '

   @ 02, 30 get nValorTabuada picture '99' valid nValorTabuada >= 0 .and. nValorTabuada <= 10 color 'w/n'
   read

   nColuna          := 3

   if Empty(nValorTabuada)

      for n1 := 1 to 10

         if n1 <= 5

            nLinha  := 3

         else

  nLinha  := 14

endif
   for n2 := 1 to 10

@ nLinha, nColuna say AllTrim(StrZero(n1, 2))   + ' X ' + AllTrim(StrZero(n2, 2)) + ' = ' + AllTrim(StrZero(n1*n2, 3))
nLinha++

next

 if nColuna >= 63
   nColuna := 3
else
   nColuna += 15

endif

   next

else

   for n:= 1 to 10

   @ nLinha, 05 say AllTrim(StrZero(nValorTabuada, 2)) + ' X ' + AllTrim(StrZero(n, 2)) + ' = ' + AllTrim(StrZero(nValorTabuada*n, 2))
   nLinha++

   next

endif

inKey(0)

