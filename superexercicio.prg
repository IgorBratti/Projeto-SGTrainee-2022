Do while .t.

Clear
set message to 24 center

@ 01,30 prompt "Exercicio01" message "ola igor"
@ 03,30 prompt "Exercicio02"
@ 05,30 prompt "Exercicio03"
@ 07,30 prompt "Exercicio04"

  menu to nOpcao


If nOpcao == 1

   clear

   @ 01,01 to 05,33 double                                                         // Criar esbo‡o do exercicio
   @ 01,04 say " SG Sistemas - Exercicio 01 "
   @ 03,04 say"Alo mundo!"                                                         // Escrever Mensagem

elseIf nOpcao == 2

   clear                                                                           // Limpar a Tela

   @ 01,01 to 07,64 double                                                         // Esbo‡o do exerc¡cio
   @ 01,19 say " Sg Sistemas - Exercicio 02 "
   @ 03,04 say "Nome...:"                                                          // Informa‡äes
   @ 04,04 say "Idade..:"
   @ 05,04 say "Peso...:"

   cNome  := Space(50)                                                             // V riaveis
   cIdade := Space(50)
   cPeso  := Space(50)

   @ 03,12 get cNome   Picture "@!"                                                // Get's
   @ 04,12 get cIdade  Picture "@!"
   @ 05,12 get cPeso   Picture "@!"
   read

elseIf nOpcao == 3

   clear
   nNumeroA := 0
   nNumeroB := 0

   @ 02,02 to 09,39 double
   @ 02,07 say " SG Sistemas - Exercicio 03 "
   @ 04,04 say "De um valor para A:"
   @ 05,04 say "De um valor para B:"

   @ 04,23 get nNumeroA picture "99"
   read
   @ 05,23 get nNumeroB picture "99"
   read

   @ 07,04 say "O produto desses 2 numeros e: " +Alltrim(Str(nNumeroA*nNumeroB))


elseIf nOpcao == 4

   clear

   @ 00,00 say Replicate("*", 57)
   @ 01,00 say "|*                     SUPER SISTEMA                   *|"
   @ 02,00 say "|***************(A P R E S E N T A C A O )**************|"
   @ 03,00 say "|*                                                     *|"
   @ 04,00 say "|*        Sistema desenvolvido pelos alunos do         *|"
   @ 05,00 say "|* Curso de Programacao da SG Sistemas-Proj. SGTrainee *|"
   @ 06,00 say "|*                                                     *|"
   @ 07,00 say "|* Aluno: [Igor Henrique Bratti]                       *|"
   @ 08,00 say "|* Linguagem de Programacao: Harbour                   *|"
   @ 09,00 say "|* [28/06/2022]                                        *|"
   @ 10,00 say "|*******************************************************|"

else
   exit
Endif
Inkey(0)

Enddo
