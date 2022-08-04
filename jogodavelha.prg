Set wrap on
set Epoch to 1930

clear

Do while .t.
clear
   @ 02,30 say "Jogo da Forca"

   @ 04,30 Prompt "JOGADOR 1"
   @ 06,30 Prompt "JOGADOR 2"

   menu to nOpcaoJogador

   If nOpcaoJogador == 1
      Clear

      cPalavraForca := Space (10)

      @ 02,02 say "Digite uma palavra para a forca"

      @ 02,40 get cPalavraForca Picture "@!"
      read
      nTamanhoPalavra := len(alltrim(cPalavraForca))

   Elseif nOpcaoJogador == 2
      clear

      @ 02,04 say "__________________"
      @ 03,21 say "|"
      @ 03,04 to 10,04
      @ 10,01 say "___|___"

      @ 10,09 say Replicate(" _", nTamanhoPalavra)

      cLetra := Space(1)
      nErros := 0
      nContador:= 0
      nColuna := 10
      Do while nContador < 10

         @ 12,03 say "Digite uma Letra: "
         @ 12,21 get cLetra Picture "@!"
         read


         nPosicao := at(cLetra,cPalavraForca)

         If nPosicao > 0
            nPosicao := nPosicao+nColuna
            @ 10,nPosicao say cLetra
         Else
            nErros++
            If nErros == 1
               @ 03,20 to 04,21
            elseif nErros == 2
               @ 05,21 say "|"
            Endif
         endif
      nContador++

      Enddo
      Inkey(0)

   Endif
Enddo
