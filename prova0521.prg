set wrap on
set date to british
set epoch to 1930


clear

nOrdemDeServicoFinal   := 0
nOrdemDeServicoInicial := 0


Do while .t.

   cLogin := Space(10)
   cSenha := Space(10)

   @ 02,29 to 05,48
   @ 03,30 say "Login: "
   @ 04,30 say "Senha: "

   @ 03,37 get cLogin Picture "@!"
   @ 04,37 get cSenha Picture "@"
   read

   If cLogin = "SISTEMA" .and. cSenha = "mudar123"
      exit
   elseif cLogin != "SISTEMA"
      @ 05,30 say "Login Incorreta"
      loop
   elseif cSenha != "mudar123"
      @ 05,30 say "Senha Incorreta"
      loop
   else
      @ 05,30 say "Login e Senha Incorretos"
   endif
enddo


Do while .t.
   clear

   @ 02,29 to 06,43
   @ 03,30 prompt "Efetuar Venda"
   @ 05,30 prompt "    Sair     "

   Menu to nOpcaoMenu

   If nOpcaoMenu == 2
      exit
   elseif nOpcaoMenu == 1

      Do while  nOrdemDeServicoFinal >= nOrdemDeServicoInicial
      clear

         cNomeCliente            := Space(40)
         cNomeTecnico            := Space(30)
         cDescricaoEquipamento   := Space(40)
         cEntrega                := Space(1)
         dDataCompra             := cTod("")
         dDataServico            := cTod("")
         nContadorProduto        := 0
         nContadorServico        := 0
         nLimiteDeCredito        := 0
         cProdutoOuServico       := Space(1)

         @ 02,02 say "Ordem de servico.......: "
         @ 02,40 say "Ordem: " + Alltrim(Transform(nOrdemDeServicoInicial, "99999999"))
         @ 03,02 say "Data so servico........: "
         @ 04,02 say "Nome Cliente...........: "
         @ 05,02 say "Nome Tecnico...........: "
         @ 06,02 say "Descricao Equipamento..: "
         @ 07,02 say "Data da Compra.........: "
         @ 08,02 say "Entrega Domicilio?'S/N': "
         @ 09,02 say "Limite de Credito......: "

         @ 02,26 get nOrdemDeServicoFinal   Picture "99999999"
         @ 03,26 get dDataServico
         @ 04,26 get cNomeCliente           Picture "@!"
         @ 05,26 get cNomeTecnico           Picture "@!"
         @ 06,26 get cDescricaoEquipamento  Picture "@!"
         @ 07,26 get dDataCompra
         @ 08,26 get cEntrega               Picture "@!"                                   Valid cEntrega $ "SN"
         @ 09,26 get nLimiteDeCredito       Picture "@E 999,999.99"
         read

         If cEntrega == "S"
            cEndereco   := Space(20)
            cBairro     := Space(20)
            cReferencia := Space(20)
            cTelefone   := Space(20)

            @ 11,02 say "Endere‡o....:"
            @ 12,02 say "Bairro......:"
            @ 13,02 say "Referencia..:"
            @ 14,02 say "Telefone....:"

            @ 11,15 get cEndereco   Picture "@!"
            @ 12,15 get cBairro     Picture "@!"
            @ 13,15 get cReferencia Picture "@!"
            @ 14,15 get cTelefone   Picture "@!"
            read
         Endif
         nTotalComGarantia := 0
         nLinhaProduto := 05
         nLinhaServico := 12
         nOrdemDeServicoInicial++
         nValorFinalProdutoEServico := 0
         nGarantiaValorFinalProdutoEServico := 0
         clear
         Do while .t.

            cNomeProduto       := Space(30)
            nQtdProduto        := 0
            nValorProduto      := 0
            nPorProduto        := 0
            nValorTotalProduto := 0

            cNomeServico       := Space(25)
            nPorServico        := 0
            nValorUnitServico  := 0
            nPorComissao       := 0
            nValorTotalServico := 0

            @ 02,02 say "Produto/Servico?"

            @ 02,20 get cProdutoOuServico   Picture "@!"                              Valid cProdutoOuServico $ "PS"
            read


            If cProdutoOuServico == "P"

               @ 04,02 say            "|      NOME DO PRODUTO         |QTD|    VALOR UNIT     |  %DESCONTO  |"
               @ nLinhaProduto,02 say "|                              |   |                   |             |"

               @ nLinhaProduto,03 get cNomeProduto  Picture "@!"
               @ nLinhaProduto,35 get nQtdProduto   Picture "99"
               @ nLinhaProduto,38 get nValorProduto Picture "@E 99,999,999,999.99"
               @ nLinhaProduto,58 get nPorProduto   Picture "@E 99,999.99"
               read

               nValorTotalProduto   := (nValorProduto*nQtdProduto) * (1 - (nPorProduto/100))

               dDataGarantiaProduto := dDataCompra + 730

//               nTotalComGarantia := nValorTotalProduto
               if dDataServico > dDataGarantiaProduto// .and. nTotalComGarantia > 0
//                  nTotalComGarantia -= nValorTotalProduto
  //             else
                  nTotalComGarantia += nValorTotalProduto
               endif

               nLinhaProduto++
               nContadorProduto++

            Elseif cProdutoOuServico == "S"

               @ 11,02 say            "|     NOME DO SERVICO     |     VALOR UNIT    |  %DESC   |  %COMISSAO  |"
               @ nLinhaServico,02 say "|                         |                   |          |             |"

               @ nLinhaServico,03 get cNomeServico      Picture "@!"
               @ nLinhaServico,30 get nValorUnitServico Picture "@E 99,999,999,999.99"
               @ nLinhaServico,50 get nPorServico       Picture "@E 99,999.99"
               @ nLinhaServico,60 get nPorComissao      Picture "@E 99,999.99"
               read

               nValorTotalServico := (nValorUnitServico) * (1 - (nPorServico/100))

               dDataGarantiaServico := dDataCompra + 365

  //             nTotalComGarantia := nValorUnitServico
               if dDataServico > dDataGarantiaServico // .and. nTotalComGarantia > 0
    //              nTotalComGarantia -= nValorTotalServico
      //         else
                  nTotalComGarantia += nValorTotalServico
                  nPorComissao      += nValorTotalServico * (nPorComissao / 100)
               endif


               nLinhaServico++
               nContadorServico++

            Endif


            If nLinhaProduto == 10
               nLinhaProduto := 05
               @ 05,01 clear to 10,79
            Elseif nLinhaServico == 17
               nLinhaServico := 12
               @ 12,01 clear to 17,79
            Endif

            if LastKey() != 27

               nValorFinalProdutoEServico += nValorTotalServico + nValorTotalProduto

               If cEntrega == "S"
                  nValorFinalProdutoEServico += nValorFinalProdutoEServico + (nValorFinalProdutoEServico*0.04)
               endif

                  @ 23,05 say "Valor Total Com Garantia: " + Transform(nTotalComGarantia, "@E 99,999,999,999.99")
                  @ 23,50 say "Valor Total: " + Transform(nValorFinalProdutoEServico, "@E 99,999,999,999.99")
                  If nValorFinalProdutoEServico > nLimiteDeCredito
                     Alert("Limite de Credito excedido")
                     Do while .t.
                        cLoginSupervisor := Space(15)
                        cSenhaSupervisor := Space(10)

                        @ 14,30 say "Login: "
                        @ 15,30 say "Senha: "

                        @ 14,37 get cLoginSupervisor Picture "@"
                        read
                        @ 15,37 get cSenhaSupervisor Picture "@"
                        read

                        If cLoginSupervisor = "SUPERVISOR" .and. cSenhaSupervisor = "LIBERE123"
                           @ 14,01 clear to 15,79
                           exit
                        elseif cLoginSupervisor != "SUPERVISOR"
                           @ 05,30 say "Login errado"
                           loop
                        elseif cSenhaSupervisor != "LIBERE123"
                           @ 05,30 say "Senha errado"
                           loop
                        endif
                     enddo

                     nValorFinalProdutoEServico -= nValorFinalProdutoEServico
                     @ nLinhaProduto, 01 Clear to nLinhaProduto,69
                     @ nLinhaServico, 01 Clear to nLinhaServico,69
                     loop
                  Endif
              // Endif
            Else
               nOpcaoVenda := alert("Oque deseja fazer?",{"Finalizar Ordem","Retornar ao cadastro","Finalizar Programa"})

               if nOpcaoVenda == 1 .or. nOpcaoVenda == 3
                  exit
               elseif nOpcaoVenda == 2
                  @ nLinhaProduto, 01 Clear to nLinhaProduto,68
                  @ nLinhaServico, 01 Clear to nLinhaServico,68
               Endif
            Endif
         Enddo

         nContadorDinheiro := 1
         nContadorCheque   := 1
         nContadorCartao   := 1
         nValorPago        := 0
         nValorRestante    := 0


         If nOpcaoVenda == 1 .and. nValorFinalProdutoEServico > 0
            clear
            nOpcaoPagamento := Alert ("Forma de Pagamento",{"Dinheiro","Cheque","Cartao"})
            If nOpcaoPagamento == 1 .and. nContadorDinheiro == 1 .or. nOpcaoPagamento == 2 .and. nContadorCheque == 1 .or. nOpcaoPagamento == 3 .and. nContadorCartao == 1



               @ 03,02 say "Valor Total: " + Transform(nValorFinalProdutoEServico, "@E 99,999,999,999.99")
               @ 04,02 say "Pagar......: "

               @ 04,17 get nValorPago  Picture "@E 99,999,999,999.99"
               read

               nValorRestante    :=  nValorFinalProdutoEServico-nValorPago

               If nValorPago == nValorFinalProdutoEServico

                  @ 06,02 say "Valor Total Pago"
                  Inkey(0)
                  exit
               Elseif nValorPago < nValorFinalProdutoEServico

                  @ 06,02 say "Valor restante: " + transform(nValorRestante, "@E 99,999,999,999.99")
                  Inkey(0)

               Else
                  @ 06,02 say "Troco: " +  transform(nValorRestante, "@E 99,999,999,999.99")
                  Inkey(0)
                  loop
               Endif
            Elseif nOpcaoPagamento == 1 .and. nContadorDinheiro > 1 .or. nOpcaoPagamento == 2 .and. nContadorCheque > 1 .or. nOpcaoPagamento == 3 .and. nContadorCartao > 1
               Alert("Forma de Pagamento ja usada, utilize outra")
               loop
            Elseif nContadorDinheiro > 1 .and. nContadorCartao > 1 .and. nContadorCheque > 1
               alert("Formas de Pagamento esgotadas")
               Alert("A dire‡Æo")
               exit
            Endif
         Endif
      Enddo
   endif

enddo
