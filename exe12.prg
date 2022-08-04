/*
Costrua um algoritmo que receba trˆs n£meros inteiros e verifique qual ‚ o maior
*/

                        // limpar a tela
Clear
                        // Desenhar esbo‡o do exercicio
@ 01,01 to 10,32 double
@ 01,03 say " SG Sistemas - Exercicio 01 "                                      Color "B/N"
                        // Say's pedindo para Informar os Numeros
@ 03,03 say "Informe 3 numeros!"
@ 04,03 say "Numero 1:"
@ 05,03 say "Numero 2:"
@ 06,03 say "Numero 3:"
                        // Variaveis para armazenar os Numeros
nNumero1 := 0
nNumero2 := 0
nNumero3 := 0
                        // Get's pedindo para Informar os Numeros
@ 04,13 get nNumero1 picture "999"
@ 05,13 get nNumero2 picture "999"
@ 06,13 get nNumero3 picture "999"
read


                        // Variavel e Logica a pergunta
nMaior    := nNumero1

if nNumero2 > nMaior
   nMaior := nNumero2
endif

if nNumero3 > nMaior
   nMaior := nNumero3
endif
                        // resposta da pergunta para o maior numero
                       // Resposta da pergunta se forem os 3 iguais
if nNumero1 == nNumero2 .and. nNumero1 == nNumero3
   alert("Os tres numeros sao iguais!")
else
   alert("O Maior numero digitado:" + AllTrim( Str( nMaior )))
endif

Inkey(0)


