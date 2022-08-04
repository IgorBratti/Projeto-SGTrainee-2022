set Date to British
Set Epoch to 1930

Do while .t.

   Clear


   nFinalEstoqueBanana               := 98
   cNomeCliente                 := Space(15)
   nLimiteDeCredito             := 0
   nValorTotalProduto           := 0
   nValorFinalProduto           := 0
   dData                        := cTod("")
   cDiaDaSemana                 := Space(20)
   cMes                         := Space(20)
   nDescontoMaximo              := 0
   @ 01,20 say "Super mercado Bratti"
   @ 03,01 say "Data da Venda:"
   @ 03,18 get dData                                                            Valid !Empty(dData)
   read


   if dow(dData) == 1
      cDiaDaSemana := "Domingo"
   elseif dow(dData) == 2
      cDiaDaSemana := "Segunda-Feira"
   elseif dow(dData) == 3
      cDiaDaSemana := "terca-feira"
   elseif dow(dData) == 4
      cDiaDaSemana := "Quarta-Feira"
   elseif dow(dData) == 5
      cDiaDaSemana := "Quinta-Feira"
   elseif dow(dData) == 6
      cDiaDaSemana := "Sexta-Feira"
   elseif dow(dData) == 7
      cDiaDaSemana := "Sabado"
   endif

   if month(dData) == 1
      cMes := "Janeiro"
   elseif month(dData) == 2
      cMes := "Fevereiro"
   elseif month(dData) == 3
      cMes := "Marco"
   elseif month(dData) == 4
      cMes := "Abril"
   elseif month(dData) == 5
      cMes := "Maio"
   elseif month(dData) == 6
      cMes := "Junho"
   elseif month(dData) == 7
      cMes := "Julho"
   elseif month(dData) == 8
      cMes := "Agosto"
   elseif month(dData) == 9
      cMes := "Setembro"
   elseif month(dData) == 10
      cMes := "Outubro"
   elseif month (dData) == 11
      cMes := "Novembro"
   elseif month(dData) == 12
      cMes := "Dezembro"
   endif

   clear

   @ 01,01 to 06,67 Double
   @ 01,23 say " Super mercado Bratti "
   @ 02,03 say "Maring , " + Str(day(dData)) + " de " + AllTrim(cMes) + " de " + Str(year(dData)) + " ( " + AllTrim(cDiaDaSemana) + " )"
   @ 04,03 say "Nome do Cliente..:"
   @ 05,03 say "Limite de Credito:"




   @ 04,21 get cNomeCliente Picture "@!"
   @ 05,21 get nLimiteDeCredito Picture "@E 99,999.99"

   read

   if LastKey() == 27
      nOpcaoInfo := alert("Oque deseja fazer?",{"Retornar ao casdastro","Pular Cadastro","Finalizar Programa"})
      if nOpcaoInfo == 1
         Loop
      Elseif nOpcaoInfo == 2
      Elseif nOpcaoInfo == 3
         Exit
      endif
   endif
/*
   @ 08,03 say "         PRODUTOS DIPONIVEIS"
   @ 09,03 say " CODIGO DO PRODUTO | NOME DO PRODUTO "
   @ 10,03 say "       3130        |     BANANA"
   @ 11,03 say "       4999        | PERA ARGENTINA"
   @ 12,03 say "       7423        | BATATA PERUANA"
   @ 13,03 say "       6123        |  ABACATE NEGRO"
*/
   @ 07,03 say "COD.|NOME DO PRODUTO|QTDE|%DESC.|VALOR UNIT|VALOR TOTAL|VALOR FINAL"

   nLinha      := 08
   nLinhaBorda := 09
   nContador   := 0

   do while nContador < 5

      nCodigoDoProduto       := 0
      cNomeProduto           := Space(20)
      nQuantidadeDoProduto   := 0
      nPorcertagemDeDesconto := 0
      nValorUnitProduto      := 0

      @ 06,02 to nLinhaBorda,70
      @ nLinha,03 say "    |               |    |      |          |           |"
      @ nLinha,03 get nCodigoDoProduto       Picture "9999"                     Valid nCodigoDoProduto == 3130 .or.nCodigoDoProduto == 4999 .or. nCodigoDoProduto == 7423 .or. nCodigoDoProduto == 6123
      read


      If nCodigoDoProduto == 3130
         cNomeProduto         := "BANANA"
         nValorUnitProduto    := 1.50
         nDescontoMaximo      := 14
         nInicialEstoqueBanana := nFinalEstoqueBanana
         nInicialEstoqueBanana -= nQuantidadeDoProduto
      Elseif nCodigoDoProduto == 4999
         cNomeProduto := "PERA ARGENTINA"
         nValorUnitProduto := 3.70
         nEstoqueProdutoPera := 139.50
            nDescontoMaximo              := 11
      Elseif nCodigoDoProduto == 7423
         cNomeProduto := "BATATA PERUANA"
         nValorUnitProduto := 2.50
         nEstoqueProdutoBatata := 895.00
            nDescontoMaximo              := 3
      Elseif nCodigoDoProduto == 6123
         cNomeProduto := "ABACATE NEGRO"
         nValorUnitProduto := 1.95
         nEstoqueProdutoAbacate := 301.00
            nDescontoMaximo              := 9
      endif




      @ nLinha,09 say cNomeProduto
      @ nLinha,37 say nValorUnitProduto Picture "@E 99,999.99"

      @ nLinha,24 get nQuantidadeDoProduto   Picture "9999"
      @ nLinha,29 get nPorcertagemDeDesconto Picture "999.99"
      read



      if nInicialEstoqueBanana < 0
         Alert("Estoque insuficiente")
         nInicialEstoqueBanana -= nQuantidadeDoProduto
         @ nLinha, 01 Clear to nLinha,69
         loop
      else
         nInicialEstoqueBanana -= nQuantidadeDoProduto
      Endif




      If nPorcertagemDeDesconto <= nDescontoMaximo
         nValorTotalProduto := ((1 - (nPorcertagemDeDesconto/100))*(nValorUnitProduto*nQuantidadeDoProduto))
         nValorFinalProduto += nValorTotalProduto
      else
         Alert("Limite de Desconto excedido")
         @ nLinha, 01 Clear to nLinha,69
         loop
      endif

      if LastKey() != 27



      @ nLinha,49 say nValorTotalProduto       Picture "@E 99,999.99"
      @ nLinha,61 say nValorFinalProduto       Picture "@E 99,999.99"

      If nValorFinalProduto > nLimiteDeCredito
         Alert("Limite de Credito excedido")
         nValorFinalProduto -= nValorTotalProduto
                 @ nLinha, 01 Clear to nLinha,69
         loop
      Endif



      nLinha++
        @ nLinha, 01 Clear to nLinha,69
      nLinhaBorda++
      nContador++

      Else
         nOpcaoVenda := alert("Oque deseja fazer?",{"Finalizar Venda","Retornar ao casdastro","Finalizar Programa"})
       //  @ nLinha, 01 Clear to nLinha,68
         if nOpcaoVenda == 1 .or. nOpcaoVenda == 3
            nLinha++
            exit
         elseif nOpcaoVenda == 2
             @ nLinha, 01 Clear to nLinha,68
  //          nContador--
    //        if nContador == -1
      //         nContador := 0
        //    endif
         endif
      endif

      if nContador == 5
         @ 15,02 say "Precione 'Enter' para Continuar "
         Inkey(0)
         @ 08,01 clear to 35,78
         nLinha      := 07
         nContador   := 0
         nLinhaBorda := 08
      endif

   Enddo

   If nOpcaoVenda == 3
      Exit
   endif

   nLinha++
   @ nLinha,46 say "Valor Final: " + Alltrim(Transform( nValorFinalProduto, "@E 99,999.99"))
   Inkey(0)

enddo


/*
nEstoque1 := 100

nEstoqueT1 := nEstoque1

nEstoqueT1 -= nQuantidade
*/
