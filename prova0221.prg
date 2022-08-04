// Igor Henrique Bratti Domingues

Set Date to British
Set Epoch to 1930

Do while .t.

   clear

   nQuantidadeAnalises          := 0
   nHomensAposentados           := 0
   nMulheresAposentadas         := 0
   nQuantidadeHomensMais80      := 0
   nQuantidadeMulheresAntes2003 := 0
   nValorTotalRemuneracao       := 0
   nContador                    := 0
   nHomensAposentados           := 0
   nMulheresAposentadas         := 0
   nHomensSuperiores            := 0
   nMulheresAdmitidasAntes      := 0
   nMulheresQuePagamIRRF        := 0
   nMulheresQueNaoPagamIRRF     := 0
   nPessoasPagamIRRF            := 0

   @ 02,03 say "Quantos empregados seram analisados?"
   @ 02,40 get nQuantidadeAnalises Picture "999"
   read

   If LastKey() == 27
      nOpcaoInicial := Alert("Oque Deseja?",{"Retornar ao Pograma", "Finalizar Programa"})
      If nOpcaoInicial == 1
         loop
      Else
         exit
      Endif
   endif

   Do while nContador < nQuantidadeAnalises
      nContador++
      @ 03, 01 Clear to 10, 79

      cNome                  := Space(25)
      cSexo                  := Space(1)
      dDataAtual             := date()
      dDataNascimento        := cTod ("")
      dDataAdmissao          := cTod ("")
      dDataDemissao          := cTod ("")
      nSalarioBase           := 0
      nValorLimiteIRRF       := 0
      nPorcAdicionaNoturno   := 0
      nPorcAdicionaInsalubre := 0

      @ 03,03 say "Nome " + AllTrim(Str(nContador)) + ": "
      @ 04,03 say "Sexo (M/F): "
      @ 05,03 say "Data de Nascimento: "
      @ 06,03 say "Data de Admissao: "
      @ 07,03 say "Data de Demissao: "
      @ 08,03 say "Valor do Salario Base: "
      @ 09,03 say "Valor Limite IRRF: "
      @ 10,03 say "Adicional Noturno:      %"
      @ 11,03 say "Adicional Insalubridade:      %"

      @ 03,10 get cNome                  picture "@!"                           valid !Empty(cNome)
      @ 04,14 get cSexo                  picture "@!"                           valid cSexo == "M" .or. cSexo == "F"
      @ 05,22 get dDataNascimento                                               valid !Empty(dDataNascimento)
      @ 06,20 get dDataAdmissao                                                 valid !Empty(dDataAdmissao) .and. dDataAdmissao > dDataNascimento
      @ 07,20 get dDataDemissao                                                 valid !Empty(dDataDemissao) .and. dDataDemissao >= dDataAdmissao
      @ 08,25 get nSalarioBase           picture "@E 999,999.99"                valid nSalarioBase > 0
      @ 09,21 get nValorLimiteIRRF       Picture "@E 99,999.99"                 valid nValorLimiteIRRF > 0
      @ 10,21 get nPorcAdicionaNoturno   picture "@E 999.99"                    valid nPorcAdicionaNoturno   >= 0 .and. nPorcAdicionaNoturno   <= 100
      @ 11,27 get nPorcAdicionaInsalubre picture "@E 999.99"                    valid nPorcAdicionaInsalubre >= 0 .and. nPorcAdicionaInsalubre <= 100
      read

      nIdade    := Year(dDataAtual) - Year(dDataNascimento)
      nTrabalho := Year(dDataDemissao) - Year(dDataAdmissao)
//      nAdcionalRemunera‡Æo :=

      if Month(dDataAtual) < Month(dDataNascimento)
         nIdade--
      ElseIf Month(dDataAtual) == Month(dDataNascimento) .and. Day(dDataAtual) < Day(dDataNascimento)
         nIdade--
      endif


      if Month(dDataDemissao) < Month(dDataAdmissao)
         nTrabalho--
      ElseIf Month(dDataDemissao) == Month(dDataAdmissao) .and. Day(dDataDemissao) < Day(dDataAdmissao)
         nTrabalho--
      endif


      If nIdade > 60 .and. nTrabalho > 27 .and. cSexo == "M"
         nHomensAposentados++

      endif
      If nIdade > 57 .and. nTrabalho > 22 .and. cSexo == "F"
         nMulheresAposentadas++
      endif

      nTotalAposentados := nHomensAposentados + nMulheresAposentadas
      nPorcentagemHomensAposentados   := (nHomensAposentados * 100) / nTotalAposentados
      nPorcentagemMulheresAposentadas := (nMulheresAposentadas * 100) / nTotalAposentados

      If nIdade > 85 .and. cSexo == "M"
         nHomensSuperiores++
      endif

      If Year(dDataAdmissao) < 2001 .and. cSexo == "F"
         nMulheresAdmitidasAntes++
      endif

      If nSalarioBase > nValorLimiteIRRF
         nPessoasPagamIRRF++
      Endif

      If nSalarioBase > nValorLimiteIRRF .and. cSexo == "F"
         nMulheresQuePagamIRRF++
      Elseif  nSalarioBase <= nValorLimiteIRRF .and. cSexo == "F"
         nMulheresQueNaoPagamIRRF++
      Endif

      nTotalMulheresIRRF := nMulheresQuePagamIRRF + nMulheresQueNaoPagamIRRF
      nPorcentagemMulheresQuePagamIRRF := (nMulheresQuePagamIRRF * 100) / nTotalMulheresIRRF

      if lastKey() == 27
         nOpcao := alert("Menu de Opcoes", {"Processar", "Retornar", "Cancelar"})
         if nOpcao == 1 .or. nOpcao == 3
            nContador--
            exit
         elseif nOpcao == 2
            nContador--
         endif
      endif
      If  nContador >= nQuantidadeAnalises
         exit
      Endif

      If nHomensAposentados
         if Year(dDataDemissao) >= 08 .and. Year(dDataAdmissao) <= 08
//         nSalarioBase := nSalarioBase*0.6
         nValorTotalRemuneracao += nSalarioBase*0.6
         endif
      Endif

   Enddo

   If nOpcao == 3
      exit
   Endif


   @ 13,03 say "Empregados analisados: " + Alltrim(Str(nContador))
   @ 14,03 say "Percentual de homens Aposentados: " + Transform(nPorcentagemHomensAposentados, "999.99") + "%"
   @ 15,03 say "Percentual de Mulheres Aposentados: " + Transform(nPorcentagemMulheresAposentadas, "999.99") + "%"
   @ 16,03 say "Valor total da remuneracao: " + Transform(nValorTotalRemuneracao, "99,999.99")
   @ 17,03 say "Quantidade de Homens maiores de 85 anos: " + Alltrim(Str(nHomensSuperiores))
   @ 18,03 say "Quantidade de Mulheres que trabalham antes de 2001: " + Alltrim(Str(nMulheresAdmitidasAntes))
   @ 19,03 say "Percentual de mulheres que pagam IRRF: " + Transform(nPorcentagemMulheresQuePagamIRRF, "999.99") + "%"

   Inkey(0)

   nOpcaoFinal := Alert("",{"Sair","Retornar"})
      If nOpcaoFinal == 1
         exit
      Else
         Loop
      endif

Enddo

