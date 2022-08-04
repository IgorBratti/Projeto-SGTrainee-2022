Do while .t.

   Clear
   set message to 24 center

   @ 01,30 prompt "Exercicio21" message "ola igor"
   @ 03,30 prompt "Exercicio24"


   menu to nOpcao


   If nOpcao == 1
      Clear

      cNomeGordo  := Space(20)
      cNomeMagro  := Space(20)
      nPesoMaior  := 0
      nPesoMenor  := 0
      nQuantidade := 6
      nContador   := 1

      Do while nContador <= 6

         cNome       := Space(20)
         nPeso       := 0

         @ 03,03 say "Nome da pessoa " + AllTrim(Str(nContador)) + ": "
         @ 04,03 say "Peso da pessoa " + AllTrim(Str(nContador)) + ": "

         @ 03,21 get cNome    picture "@!"      valid !Empty(cNome)
         @ 04,21 get nPeso    picture "999.999" valid nPeso > 0
         read

         if nPeso > nPesoMaior
            nPesoMaior := nPeso
            cNomeGordo := cNome

         endif

         if nPeso < nPesoMenor .or. Empty(nPesoMenor)
            nPesoMenor := nPeso
            cNomeMagro := cNome

         endif
         nContador++
      Enddo

      @ 06,03 say "Pessoa mais gorda: " + AllTrim(cNomeGordo) + " com " + AllTrim(Str(nPesoMaior)) + " Kg."
      @ 07,03 say "Pessoa mais magra: " + AllTrim(cNomeMagro) + " com " + AllTrim(Str(nPesoMenor)) + " Kg."

      inKey(0)

      If LastKey() == 27
         exit
      Endif

      Inkey(0)
   elseif nOpcao == 2

      Clear
      cFruta := Space(20)

      @ 05,05 say "Digite o nome de uma fruta: "
      @ 05,34 get cFruta picture "@!" valid !Empty(cFruta)
      read

      nPosicao := at("BANANA",cFruta)

      If !empty(nPosicao)
         @ 07,05 say "Acertou"
      else
         @ 07,05 say "Errou"
      endif
    /*
      if cFruta == "BANANA"
         @ 07,05 say "Acertou"
      else
         @ 07,05 say "Errou"
      endif
   */
      inKey(0)

      If LastKey() == 27
         exit
      Endif
   else
      exit
   Endif
   Inkey(0)

Enddo
