/*
Fa‡a um algoritmo que leia o nome e o peso de seis pessoas e imprima o nome e peso do mais magro e mais gordo
*/

                        // limpar a tela
Clear
                        // Desenhar esbo‡o do exercicio
@ 01,01 to 20,32 double
@ 01,03 say " SG Sistemas - Exercicio 01 "                                      Color "B/N"
                        // Say's pedindo para Informar os Numeros
@ 03,03 say "Informe !"
@ 04,03 say "Numero 1:"
@ 05,03 say "Numero 2:"
@ 06,03 say "Numero 3:"
                        // Variaveis para armazenar os Numeros
cNumero1 := Space(3)
cNumero2 := Space(3)
cNumero3 := Space(3)
                        // Get's pedindo para Informar os Numeros
@ 04,13 get cNumero1 picture "@!"
@ 05,13 get cNumero2 picture "@!"
@ 06,13 get cNumero3 picture "@!"
read

                        // Variavel e Logica a pergunta
cMaior    := cNumero1

if cNumero2 > cMaior
   cMaior := cNumero2
endif

if cNumero3 > cMaior
   cMaior := cNumero3
endif
                        // resposta da pergunta para o maior numero
                       // Resposta da pergunta se forem os 3 iguais
if cNumero1 == cNumero2 .and. cNumero1 == cNumero3
   alert("Os tres numeros sao iguais!")
else
   alert("O Maior numero digitado:" +  Val( cMaior ))
endif

Inkey(0)

