/*
Fa‡a um programa que pergunte quantas vezes deve imprimir seu nome
*/

clear

@ 01,01 to 21,55 Double
@ 01,12 say " SG Sistemas - Exercicio 16 "

@ 03,03 say "Digite seu nome:"
@ 04,03 say "Informe a quantia de vezes para repetir:"

cNome     := Space(15)
nQtdVezes := 0
nInicial  := 0
nLinha    := 6

@ 03,20 get cNome     Picture "@!"                                              Valid !Empty(cNome)
@ 04,50 get nQtdVezes Picture "9"                                               Valid nQtdVezes > 0
read

Do while nInicial < nQtdVezes
   if nLinha < 15
      @ nLinha,03 say cNome
      nLinha++
      nInicial++
      Inkey(0.5)
   else
      exit
   Endif

 Inkey(0)


enddo

