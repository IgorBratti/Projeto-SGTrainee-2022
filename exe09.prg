clear
set epoch to 1930
set date to British

@ 02,02 to 11,55 Double
@ 02,12 say " SG Sistemas - Exercicio 09 "

cLetra         := Space(1)
dData          := cTod("")
nNumeroInteiro := 0
nNumeroDecimal := 0
cString        := Space(10)
nMonetario     := 0

@ 04,04 say "Digite uma Letra......................:"
@ 05,04 say "Digite uma Data.......................:"
@ 06,04 say "Digite um Numero Inteiro..............:"
@ 07,04 say "Digite um Numero com casas Decimais...:"
@ 08,04 say "Digite uma String.....................:"
@ 09,04 say "Digite um Valor Monetario. ...........:"

@ 04,44 get cLetra         Picture "@!"
@ 05,44 get dData
@ 06,44 get nNumeroInteiro Picture "999"
@ 07,44 get nNumeroDecimal Picture "99.99"
@ 08,44 get cString        Picture "@!"
@ 09,44 get nMonetario     Picture "@E 99,999.9"
read



