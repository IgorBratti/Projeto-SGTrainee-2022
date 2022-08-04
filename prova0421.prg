set wrap on
                                       //La‡o true
do while .t.
                                       //Limpar a Tela
   clear
                                       //Variaveis
   cNomeJogador1     := space(20)
   cNomeJogador2     := space(20)
   cPalavraJogo      := Space(10)

   cFormaPalavra     := ""
   cVerificaLetra    := ""
   cAcumulaLetra     := ""

   nTamanhoPalavra   := 0
   nContaLetra       := 1
   nContaErrada      := 0
   nTamanhoAcumula   := 0

   nColunaletracerta := 49
                                       //Pedir nomes e Palavra chave
   @ 01,02 say "Nome Jogador 1......:"
   @ 02,02 say "Nome Jogador 2......:"
   @ 03,02 say "Palavra para Forca..:"

   @ 01,24 get cNomeJogador1 Picture "@!"                                       Valid !Empty(cNomeJogador1)
   @ 02,24 get cNomeJogador2 Picture "@!"                                       Valid !Empty(cNomeJogador2)
   @ 03,24 get cPalavraJogo  Picture "@!"                                       Valid !Empty(cPalavraJogo)
   read
                                       //Limpar a Palavra
   @ 03,01 clear to 03,79

                                       //Op‡Æo para sair do jogo
   if lastkey() == 27
      nRespostaSair := alert("Deseja Sair do Jogo?",{"Sim","Nao"})
      if nRespostaSair == 1
         clear
         exit
      else
         loop
      endif
   endif
                                       //descobrir tamanho da string
   nTamanhoPalavra := len(AllTrim(cPalavraJogo))
                                       //Replicate aqui fora para nÆo tampar as Letras
   @ 12,50 say Replicate("_", nTamanhoPalavra)
                                       // dificuldade jogo
   nNivelDificuldade := alert("Escolha o nivel de dificuldade do jogo!",{"Facil","Medio","Dificil"})

   do while .t.

      cLetraDigitada  := space(1)
      cChance1        := space (15)
      cChance2        := space (15)
      cChance3        := space (15)

                                       // Esbo‡o forca
      @ 04,44 say "__________________"
      @ 05,61 say "|"
      @ 05,44 to 12,44
      @ 12,41 say "___|___"


      @ 04,02 say "Letras ja digitadas: "
      @ 06,02 say "Digite uma letra: "

      @ 06,19 get cLetraDigitada Picture "@!"                                   Valid !Empty(cLetraDigitada)
      read

      if lastkey() == 27
         nRespostaSair := alert("Deseja Sair do Programa?",{"Sim","Nao"})
         if nRespostaSair == 1
            clear
            exit
         else
            loop
         endif
      endif

      if cLetraDigitada $ cAcumulaLetra .and. nContaLetra > 1
         alert("Letra Ja foi digitada")
         loop
      else
                                       //Verificar se esta Contido
         if cLetraDigitada $ cPalavraJogo
            cBuscaLetra     := ""
            nContador       := 1
            nTamanhoPalavra := len(AllTrim(cPalavraJogo))
                                       //la‡o para validar letra
            do while nContador <= nTamanhoPalavra
               cBuscaLetra := substr(cPalavraJogo,nContador,1)

               if cBuscaLetra == cLetraDigitada
                  cFormaPalavra += cBuscaLetra
                  @ 12,nContador+nColunaletracerta say cBuscaLetra
               endif

               nContador++

            enddo
                                       //nTentativas erradas
         else
            nContaErrada++
                                       //Esbo‡o boneco
            If nContaErrada == 1
               @ 06,60 to 07,62
            ElseIf nContaErrada == 2
               @ 08,61 to 10,61
            ElseIf nContaErrada == 3
               @ 08,59 say "\_"
            ElseIf nContaErrada == 4
               @ 08,62 say "_/"
            ElseIf nContaErrada == 5
               @ 11,60 say "/"
               @ 12,59 say "/"
            ElseIf nContaErrada == 6
               @ 11,62 say "\"
               @ 12,63 say "\"
            ElseIf nContaErrada == 7
               @ 08,61 say "\"
            Endif
                                       //If facil ==> dicas
            if nNivelDificuldade == 1
               if nContaErrada == 2
                  @ 08,05 say "Dica 1"

                  @ 09,01 get cChance1 picture "@!" valid !Empty(cChance1)
                  read
               Elseif nContaErrada == 4
                  @ 10,05 say "Dica 2"

                  @ 11,01 get cChance2 picture "@!" valid !Empty(cChance2)
                  read
               Elseif nContaErrada == 6
                  @ 12,05 say "Dica 3"

                  @ 13,01 get cChance3 picture "@!" valid !Empty(cChance3)
                  read
               endif
            endif
         endif
         nContaLetra++
         cAcumulaLetra   += cLetraDigitada
         nTamanhoAcumula :=  len(AllTrim(cFormaPalavra))
         @ 04,23 say cAcumulaLetra
         if nTamanhoAcumula == nTamanhoPalavra
            Alert("Parab‚ns, Vocˆ adivinhou a Palavra!")

            exit
         endif
         if nContaErrada == 7
            Alert("Que Pena, Vocˆ nÆo adivinhou a Palavra!")

            exit
         endif
      endif
   enddo
   clear

   @ 02,25 to 06,43 Double
   @ 03,27 prompt "Jogar Novamente"
   @ 05,33 prompt "Sair"

   MENU TO nOpcaoFinal

   If nOpcaoFinal == 1
      loop
   Else
      exit
   endif

enddo

