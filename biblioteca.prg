// data certa

Set Date to British
Set Epoch to 1930


clear

dData        := cTod("")
cDiaDaSemana := Space(20)
cMes         := Space(20)

@ 01,01 say "Data do sistema:"
@ 01,18 get dData
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


@ 04,01 say "Maring , " + Str(day(dData)) + " de " + AllTrim(cMes) + " de " + Str(year(dData)) + " ( " + AllTrim(cDiaDaSemana) + " )"



Set Date to British
Set Epoch to 1930

// limpou

Do while .t.

   Clear

   nFilial                      := 0
   dData                         := cTod("")
   cNomeCliente                 := Space(15)
   cNomeVendedor                := Space(15)
   nPorcentagemComissaoVendedor := 0
   nValorTotalComDesconto       := 0
   nValorTotal                  := 0

   @ 01,20 say "Super mercado Bratti"
   @ 02,02 say "Filial:"
   @ 02,40 say "Data da Venda:"
   @ 03,02 say "Nome do Cliente:"
   @ 04,02 say "Nome do Vendedor:"
   @ 04,40 say "Comissao Vendedor:"
   @ 04,64 say "%"

   @ 02,09 get nFilial Picture "99"
   @ 02,54 get dData
   @ 03,18 get cNomeCliente Picture "@!"
   @ 04,19 get cNomeVendedor Picture "@!"
   @ 04,58 get nPorcentagemComissaoVendedor Picture "999.99"
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


   @ 06,01 say "|COD|    PRODUTO    |QTD|VALOR UN |VALOR DESC|TOTAL DESC|  TOTAL  |"

   nLinha    := 7
   nContador := 0

   do while nContador < 5

      nCodigoProduto              := 0
      cNomeProduto                := Space(15)
      nQuantidadeProduto          := 0
      nValorUnitProduto           := 0
      nValorDescontoProduto       := 0

      @ nLinha,01 say "|   |               |   |         |          |          |         |"
      @ nLinha,02 get nCodigoProduto         Picture "999"
      @ nLinha,06 get cNomeProduto           Picture "@!"
      @ nLinha,22 get nQuantidadeProduto     Picture "999"
      @ nLinha,26 get nValorUnitProduto      Picture "@E 99,999.99"
      @ nLinha,37 get nValorDescontoProduto  Picture "@E 99,999.99"
      read


      if LastKey() != 27
      nValorTotalComDesconto      += (( nValorUnitProduto - nValorDescontoProduto ) * nQuantidadeProduto)
      nValorTotal                 += (nValorUnitProduto*nQuantidadeProduto)

      @ nLinha,48 say nValorTotalComDesconto Picture "@E 99,999.99"
      @ nLinha,58 say nValorTotal            Picture "@E 99,999.99"

      nLinha++
      nContador++
      else
         nOpcaoVenda := alert("Oque deseja fazer?",{"Finalizar Venda","Retornar ao casdastro","Finalizar Programa"})
         @ nLinha, 01 Clear to nLinha,79
         if nOpcaoVenda == 1 .or. nOpcaoVenda == 3
            exit
         elseif nOpcaoVenda == 2
            nContador--
            if nContador == -1
               nContador := 0
            endif
         endif
      endif


   Enddo

   @ nLinha,12 say "Igor"
   @ nLinha,48 say nValorTotalcomDesconto Picture "@E 99,999.99"
   @ nLinha,58 say nValorTotal            Picture "@E 99,999.99"

    if nOpcaoVenda == 3
            Exit
    endif

   Inkey(0)

Enddo



/*
Set Date to British
Set Epoch to 1930

Do while .t.

   Clear

   nFilial                      := 0
   dData                         := cTod("")
   cNomeCliente                 := Space(15)
   cNomeVendedor                := Space(15)
   nPorcentagemComissaoVendedor := 0



   @ 01,20 say "Super mercado Bratti"
   @ 02,02 say "Filial:"
   @ 02,40 say "Data da Venda:"
   @ 03,02 say "Nome do Cliente:"
   @ 04,02 say "Nome do Vendedor:"
   @ 04,40 say "Comissao Vendedor:"
   @ 04,64 say "%"

   @ 02,09 get nFilial Picture "99"
   @ 02,54 get dData
   @ 03,18 get cNomeCliente Picture "@!"
   @ 04,19 get cNomeVendedor Picture "@!"
   @ 04,58 get nPorcentagemComissaoVendedor Picture "999.99"
   read

   if lastKey() == 27
      nOpcaoInfo := alert("Oque deseja fazer?",{"Retornar ao casdastro","Pular Cadastro","Finalizar Programa"})
      if nOpcaoInfo == 1
         Loop
      Elseif nOpcaoInfo == 2
      Elseif nOpcaoInfo == 3
         Exit
      endif
   endif


   nCodigoProduto1              := 0
   cNomeProduto1                := Space(15)
   nQuantidadeProduto1          := 0
   nValorUnitProduto1           := 0
   nValorDescontoProduto1       := 0

   nCodigoProduto2              := 0
   cNomeProduto2                := Space(15)
   nQuantidadeProduto2          := 0
   nValorUnitProduto2           := 0
   nValorDescontoProduto2       := 0

   nCodigoProduto3              := 0
   cNomeProduto3                := Space(15)
   nQuantidadeProduto3          := 0
   nValorUnitProduto3           := 0
   nValorDescontoProduto3       := 0

   nCodigoProduto4              := 0
   cNomeProduto4                := Space(15)
   nQuantidadeProduto4          := 0
   nValorUnitProduto4           := 0
   nValorDescontoProduto4       := 0

   @ 07,01 say "|COD|    PRODUTO    |QTD|VALOR UN |VALOR DESC|TOTAL DESC|  TOTAL  |"

   @ 08,01 say "|   |               |   |         |          |          |         |"
   @ 09,01 say "|   |               |   |         |          |          |         |"
   @ 10,01 say "|   |               |   |         |          |          |         |"
   @ 11,01 say "|   |               |   |         |          |          |         |"

   @ 08,02 get nCodigoProduto1         Picture "999"
   @ 08,06 get cNomeProduto1           Picture "@!"
   @ 08,22 get nQuantidadeProduto1     Picture "999"
   @ 08,26 get nValorUnitProduto1      Picture "@E 99,999.99"
   @ 08,37 get nValorDescontoProduto1  Picture "@E 99,999.99"
   read

   nValorTotalComDesconto1      := (( nValorUnitProduto1 - nValorDescontoProduto1 ) * nQuantidadeProduto1)
   nValorTotal1                 := (nValorUnitProduto1*nQuantidadeProduto1)

   @ 08,48 say nValorTotalComDesconto1 Picture "@E 99,999.99"
   @ 08,58 say nValorTotal1            Picture "@E 99,999.99"

   @ 09,02 get nCodigoProduto2         Picture "999"
   @ 09,06 get cNomeProduto2           Picture "@!"
   @ 09,22 get nQuantidadeProduto2     Picture "999"
   @ 09,26 get nValorUnitProduto2      Picture "@E 99,999.99"
   @ 09,37 get nValorDescontoProduto2  Picture "@E 99,999.99"
   read

   nValorTotalComDesconto2      := ((nValorUnitProduto2-nValorDescontoProduto2)*nQuantidadeProduto2)
   nValorTotal2                 := (nValorUnitProduto2*nQuantidadeProduto2)

   @ 09,48 say nValorTotalComDesconto2 Picture "@E 99,999.99"
   @ 09,58 say nValorTotal2            Picture "@E 99,999.99"

   @ 10,02 get nCodigoProduto3         Picture "999"
   @ 10,06 get cNomeProduto3           Picture "@!"
   @ 10,22 get nQuantidadeProduto3     Picture "999"
   @ 10,26 get nValorUnitProduto3      Picture "@E 99,999.99"
   @ 10,37 get nValorDescontoProduto3  Picture "@E 99,999.99"
   read

   nValorTotalComDesconto3      := ((nValorUnitProduto3-nValorDescontoProduto3)*nQuantidadeProduto3)
   nValorTotal3                 := (nValorUnitProduto3*nQuantidadeProduto3)

   @ 10,48 say nValorTotalComDesconto3 Picture "@E 99,999.99"
   @ 10,58 say nValorTotal3            Picture "@E 99,999.99"

   @ 11,02 get nCodigoProduto4         Picture "999"
   @ 11,06 get cNomeProduto4           Picture "@!"
   @ 11,22 get nQuantidadeProduto4     Picture "999"
   @ 11,26 get nValorUnitProduto4      Picture "@E 99,999.99"
   @ 11,37 get nValorDescontoProduto4  Picture "@E 99,999.99"
   read

   nValorTotalComDesconto4      := ((nValorUnitProduto4-nValorDescontoProduto4)*nQuantidadeProduto4)
   nValorTotal4                 := (nValorUnitProduto4*nQuantidadeProduto4)

   @ 11,48 say nValorTotalComDesconto4 Picture "@E 99,999.99"
   @ 11,58 say nValorTotal4            Picture "@E 99,999.99"

   nValorFinalcomDesconto := nValorTotalComDesconto1 + nValorTotalComDesconto2 + nValorTotalComDesconto3 + nValorTotalComDesconto4
   nValorFinal            := nValorTotal1 + nValorTotal2 + nValorTotal3 + nValorTotal4

   @ 13,45 say "Valor Final com Desconto: "
   @ 14,45 say "Valor Final sem Desconto: "

   @ 13,70 say nValorFinalcomDesconto Picture "@E 99,999.99"
   @ 14,70 say nValorFinal Picture "@E 99,999.99"

   Inkey(0)


Enddo
*/

// Se deseja Encerrar

   nOpcaoEncerrar                        := alert("Iniciar novo aluno ou Encerrar ?", {"Retornar ao inicio", "Encerrar"})

   if nOpcaoEncerrar == 1
      loop
   else
      exit
   endif


// fun‡Æo prazo

 nQuantidadeParcelas   := 0

            @ nLinha+2, 06 say "NUMERO DE PARCELAS: "

            @ nLinha+2, 26 get nQuantidadeParcelas picture "99"           valid nQuantidadeParcelas >= 2 .and. nQuantidadeParcelas <= 10                  color 'w/n'
            read

            @ nLinha+3, 03 say "|NUM.P.|   VALOR   | VENCTO |"

            nLinhaLacoPrazo       := nLinha+4
            nContador             := 1

            do while nContador <= nQuantidadeParcelas

               @ nLinhaLacoPrazo, 03 say "|"
               @ nLinhaLacoPrazo, 10 say "|"
               @ nLinhaLacoPrazo, 22 say "|"
               @ nLinhaLacoPrazo, 31 say "|"

               @ nLinhaLacoPrazo, 07 say AllTrim(StrZero((nContador),2))
               @ nLinhaLacoPrazo, 13 say AllTrim(Transform((nValorTotalCompraDesconto/nQuantidadeParcelas), "@E 99,999.99"))
               @ nLinhaLacoPrazo, 24 say dDataVenda+(30*nContador)

               nLinhaLacoPrazo++
               nContador++

            enddo


