//igor henrique bratti domingues

clear
                              // entrega
cNomeEntrega     := Space(35)
cEnderecoEntrega := Space(50)
                              // mesas

nNumeroMesa1     := 0
nNumeroMesa2     := 0
nOpcaoMesa       := 0
                              //pedido

nValorTotalPedidoEntrega := 0
nValorFinalPedidoEntrega := 0
nLinhaEntrega            := 10

nValorTotalPedidoDelivery := 0
nValorTotalPedidoMesas1   := 0
nValorTotalPedidoMesas2   := 0
nValorFinalPedidoDelivery := 0
nValorFinalPedidoMesas1   := 0
nValorFinalPedidoMesas2   := 0

// relatorio gerencial

nTotalVendasDelivery      := 0
nTotalVendasMesas1        := 0
nTotalVendasMesas2        := 0
nValorTotalVendasDelivery := 0
nValorTotalVendasMesas1   := 0
nValorTotalVendasMesas2   := 0
nValorTaxaDeServicoFunc1  := 0
nValorTaxaDeServicoFunc2  := 0

nMesas1Canceladas         := 0
nMesas2Canceladas         := 0
nValorTotalCanceladoMesa1 := 0
nValorTotalCanceladoMesa2 := 0

Do While .t.
   clear
   nLinha            := 10

   @ 02,28 say "RESTAURANTE SG"

   @ 08,27 to 10,42 double
   @ 09,28 say "Menu Principal"

      @ 11,31 prompt "Delivery"
      @ 12,31 prompt "  Mesas "

      Menu to nOpcaoMenuPrincipal
   If lastkey () == 27
      nOpcaoFinalizar := Alert("Finalizar programa?", {"sim", "Nao"})
      If nOpcaoFinalizar == 1
         exit
      endif
   Endif
   Do while .t.
      If nOpcaoMenuPrincipal == 1
         cNomeEntrega     := Space(35)
         cEnderecoEntrega := Space(50)

         @ 08,01 clear to 12,50
         @ 04,02 say "Nome......:"
         @ 05,02 say "Endereco..:"

         @ 04,20 get cNomeEntrega     Picture "@!"                              Valid !Empty(cNomeEntrega)
         @ 05,20 get cEnderecoEntrega Picture "@!"                              Valid !Empty(cEnderecoEntrega)
         read
         If LastKey() == 27
            nOpcaoSair := Alert("Deseja voltar para o menu Principal?", {"Sim", "Nao"})
            If nOpcaoSair == 1
               exit
            endif
         endif


      Elseif nOpcaoMenuPrincipal == 2
         nNumeroMesa      := 0
         nCodigoAtendente := 0
         @ 08,01 clear to 12,50

         If nNumeroMesa1 == 0
            @ 04,27 say "01"                                                     Color "N/G"
         Else
            @ 04,27 say "01"                                                     Color "N/R"
         endif

         If nNumeroMesa2 == 0
            @ 04,30 say "02"                                                     Color "N/G"
         Else
            @ 04,30 say "02"                                                     Color "N/R"
         Endif

         @ 04,02 say "Nø da mesa...........:"
         @ 05,02 say "Codigo do atendente..:"

         @ 04,25 get nNumeroMesa      Picture "9"                               Valid nNumeroMesa == 1      .or. nNumeroMesa == 2
         @ 05,25 get nCodigoAtendente Picture "9"                               Valid nCodigoAtendente == 1 .or. nCodigoAtendente == 2
         read

         If nNumeroMesa == 1 .and. nNumeroMesa1 == 1 .or. nNumeroMesa == 2 .and. nNumeroMesa2 == 1
            nOpcaoMesa := alert("Mesa Utilizada, Deseja?",{"Digitar outra mesa","Faturar Atendimento","Cancelar Atendimento"})
            If nOpcaoMesa == 1
               Loop
            Elseif nOpcaoMesa == 2
               exit
            Elseif nOpcaoMesa == 3
               If  nNumeroMesa == 1 .and. nNumeroMesa1 == 1
                  nNumeroMesa1 := 0
                  nValorFinalPedidoMesas1 := 0
                  nMesas1Canceladas++
                  nValorTotalCanceladoMesa1 += nValorTotalVendasMesas1
                  loop
               Elseif  nNumeroMesa == 2 .and. nNumeroMesa2 == 1
                  nNumeroMesa2 := 0
                  nValorFinalPedidoMesas2 := 0
                  nMesas2Canceladas++
                  nValorTotalCanceladoMesa2 += nValorTotalVendasMesas2

                  loop
               Endif
            endif
         Endif



         If nNumeroMesa == 1
            nNumeroMesa1 := 1
         Elseif nNumeroMesa == 2
            nNumeroMesa2 := 1
         Endif
         If LastKey() == 27
            nOpcaoSair := Alert("Deseja voltar para o menu Principal?", {"Sim", "Nao"})
            If nOpcaoSair == 1
               exit
            endif
         endif
      Endif

   exit
   Enddo

   Do While .t.
      cDescricaoPedido  := Space(30)
      nQTDPedido        := 0
      nPrecoUnitPedido  := 0


      @ 07,28 say "PEDIDO"
      @ 09,02 say "          PRODUTO             |QTD| PREC. UNIT|    VALOR TOTAL | VALOR FINAL  "

      @ nLinha,02 get cDescricaoPedido  Picture "@!"                            Valid !Empty(cDescricaoPedido)
      @ nLinha,34 get nQTDPedido        Picture "99"                            Valid nQTDPedido > 0
      @ nLinha,38 get nPrecoUnitPedido  Picture "@E 999,999.99"                 Valid nPrecoUnitPedido > 0
      read



      If nOpcaoMenuPrincipal == 1
         If LastKey() != 27
            nValorTotalPedidoDelivery := nPrecoUnitPedido*nQTDPedido
            nValorFinalPedidoDelivery += nValorTotalPedidoDelivery

            @ nLinha,48 say nValorTotalPedidoDelivery Picture "@E 99,999,999.99"
            @ nLinha,58 say nValorFinalPedidoDelivery Picture "@E 99,999,999.99"

            nLinha++
            @ nLinha,01 clear to nLinha,79

        else
            nOpcaoPedido := Alert("Deseja", {"Enviar Pedido para Producao","Continuar Digitando", "Abandonar Digitacao"})
            If nOpcaoPedido == 1
               Alert("Pedido Enviado")
               exit
            elseif nOpcaoPedido == 2
               loop
            elseif nOpcaoPedido == 3
               nValorFinalPedidoDelivery := 0
               exit
            Endif
         Endif



      Elseif nOpcaoMenuPrincipal == 2 .and. nNumeroMesa == 1
         If LastKey() != 27
            nValorTotalPedidoMesas1 := nPrecoUnitPedido*nQTDPedido
            nValorFinalPedidoMesas1 += nValorTotalPedidoMesas1

            @ nLinha,48 say nValorTotalPedidoMesas1 Picture "@E 99,999,999.99"
            @ nLinha,58 say nValorFinalPedidoMesas1 Picture "@E 99,999,999.99"

            nLinha++
            @ nLinha,01 clear to nLinha,79
         else
           nOpcaoPedido := Alert("Deseja", {"Enviar Pedido para Producao","Continuar Digitando", "Abandonar Digitacao"})
            If nOpcaoPedido == 1
               Alert("Pedido Enviado")
               exit
            elseif nOpcaoPedido == 2
               loop
            elseif nOpcaoPedido == 3
               nValorFinalPedidoMesas1 := 0
               exit
            Endif
         Endif



      Elseif nOpcaoMenuPrincipal == 2 .and. nNumeroMesa == 2
         If LastKey() != 27
            nValorTotalPedidoMesas2 := nPrecoUnitPedido*nQTDPedido
            nValorFinalPedidoMesas2 += nValorTotalPedidoMesas2

            @ nLinha,48 say nValorTotalPedidoMesas2 Picture "@E 99,999,999.99"
            @ nLinha,58 say nValorFinalPedidoMesas2 Picture "@E 99,999,999.99"

            nLinha++
            @ nLinha,01 clear to nLinha,79

          else
            nOpcaoPedido := Alert("Deseja", {"Enviar Pedido para Producao","Continuar Digitando", "Abandonar Digitacao"})
            If nOpcaoPedido == 1
               Alert("Pedido Enviado")
               exit
            elseif nOpcaoPedido == 2
               loop
            elseif nOpcaoPedido == 3
               nValorFinalPedidoMesas2 := 0
               exit
            Endif
         Endif

      Endif
   Enddo

   If nOpcaoMenuPrincipal == 2 .and. nNumeroMesa == 2 .or.nOpcaoMenuPrincipal == 2 .and. nNumeroMesa == 1

      If nOpcaoPedido == 1 .or. nOpcaoPedido == 3
         Loop
      endif
   Endif

   Do while .t.


      If nOpcaoMenuPrincipal == 1
         nValorFinalPedido := nValorFinalPedidoDelivery
      ElseIf nOpcaoMenuPrincipal == 2 .and. nNumeroMesa == 1
         nOpcaoTaxa := Alert("Aceita taxa de servico?",{"Sim","Nao"})
         If nOpcaoTaxa == 1
            nValorFinalPedido := (nValorFinalPedido*110)/100
         endif
         nValorFinalPedido := nValorFinalPedidoMesas1
      ElseIf nOpcaoMenuPrincipal == 2 .and. nNumeroMesa == 2
         nOpcaoTaxa := Alert("Aceita taxa de servico?",{"Sim","Nao"})
         If nOpcaoTaxa == 1
            nValorFinalPedido := (nValorFinalPedido*110)/100
         endif
         nValorFinalPedido := nValorFinalPedidoMesas2
      Endif

        If Lastkey() != 27

            cFormaPagamento := Space(1)
            nValorRecebido  := 0
            @ 07,01 clear to nLinha,79
            @ 07,02 say "[D]inheiro / [C]artao / Che[Q]ue:"

            @ 08,02 say "Total pagar.....................:" + Transform(nValorFinalPedido, "@E 999,999,999.99")
            @ 09,02 say "Valor recebido..................:"

            @ 07,36 get cFormaPagamento Picture "@!"                                  Valid cFormaPagamento $ "DCQ"
            @ 09,36 get nValorRecebido  Picture "@E 999,999,999.99"                   Valid nValorRecebido >= nValorFinalPedido
            read

            If nOpcaoMenuPrincipal == 1 .and. nValorRecebido >= nValorFinalPedido
               nTotalVendasDelivery++
               nValorTotalVendasDelivery += nValorFinalPedido
            ElseIf nOpcaoMenuPrincipal == 2 .and. nNumeroMesa == 1
               nTotalVendasMesas1++
               nValorTotalVendasMesas1 += nValorFinalPedido
               If nCodigoAtendente == 1
                  nValorTaxaDeServicoFunc1 += nValorFinalPedido/11
               ElseIf nCodigoAtendente == 2
                  nValorTaxaDeServicoFunc2 += nValorFinalPedido/11
               Endif
            ElseIf nOpcaoMenuPrincipal == 2 .and. nNumeroMesa == 2
               nTotalVendasMesas2++
               nValorTotalVendasMesas2 := nValorFinalPedido
               If nCodigoAtendente == 1
                  nValorTaxaDeServicoFunc1 += nValorFinalPedido/11
               ElseIf nCodigoAtendente == 2
                  nValorTaxaDeServicoFunc2 += nValorFinalPedido/11
               Endif
            endif

            If nValorRecebido > nValorFinalPedido
               nTroco := nValorRecebido - nValorFinalPedido
               @ 10,02 say "Troco...........................:" + Transform(nTroco,"@E 999,999,999.99")
               Inkey(0)
               exit
            endif
         else
            nOpcaoPagamento := Alert("",{"Cancelar Pagamento","Recomecar Pagamento"})
            If nOpcaoPagamento == 1
               exit
            Endif
         endif

   Enddo
Enddo


nTotalVendasMesas1EMesas2       := nTotalVendasMesas2             + nTotalVendasMesas1
nValorTotalVendasMesas1EMesas2  := nValorTotalVendasMesas1        + nValorTotalVendasMesas2
nTicketMedioVendasMesas1EMesas2 := nValorTotalVendasMesas1EMesas2 / nTotalVendasMesas1EMesas2

nTicketMedioVendasDelivery      := nValorTotalVendasDelivery      / nTotalVendasDelivery

nValorTotalGeralVendas          := nValorTotalVendasMesas1EMesas2 + nValorTotalVendasDelivery
nValorTaxaDeServicoFunc1EFunc2  := nValorTaxaDeServicoFunc1      + nValorTaxaDeServicoFunc2

nMesas1e2Canceladas := nMesas1Canceladas + nMesas2Canceladas
nValorTotalCanceladoMesa1EMesa2 :=nValorTotalCanceladoMesa1 + nValorTotalCanceladoMesa2


@ 03,01 clear to 24,69

@ 04,28 say "RELATORIO GERENCIAL"

@ 06,02 say "                                      MESA1           MESA2          GERAL"
@ 07,02 say "Quantidade vendas mesas.......:           " + Alltrim(Str(nTotalVendasMesas1)) + "              " + Alltrim(Str(nTotalVendasMesas2)) + "              " + Alltrim(Str(nTotalVendasMesas1EMesas2))
@ 08,02 say "Quantidade cancelados mesas...:           " + Alltrim(Str(nMesas1Canceladas))  + "              " + Alltrim(Str(nMesas2Canceladas))  + "              " + Alltrim(Str(nMesas1e2Canceladas))
@ 09,02 say "Valor Total vendas mesas......:" + Transform(nValorTotalVendasMesas1, "@E 999,999,999.99")   + Transform(nValorTotalVendasMesas2, "@E 999,999,999.99")   + Transform(nValorTotalVendasMesas1EMesas2, "@E 999,999,999.99")
@ 10,02 say "Valor Total cancelados mesas..:" + Transform(nValorTotalCanceladoMesa1, "@E 999,999,999.99") + Transform(nValorTotalCanceladoMesa2, "@E 999,999,999.99") + Transform(nValorTotalCanceladoMesa1EMesa2, "@E 999,999,999.99")
@ 11,02 say "Ticket medio vendas mesas.....:   " + Transform(nTicketMedioVendasMesas1EMesas2, "@E 999,999,999.99")

@ 13,02 say "Quantidade vendas Delivery....:   " + Alltrim(Str(nTotalVendasDelivery))
@ 14,02 say "Valor Total vendas delivery...:   " + Transform(nValorTotalVendasDelivery, "@E 999,999,999.99")
@ 15,02 say "Ticket medio vendas delivery..:   " + Transform(nTicketMedioVendasDelivery, "@E 999,999,999.99")

@ 17,02 say "Total geral vendas............:   " + Transform(nValorTotalGeralVendas, "@E 999,999,999.99")

@ 19,02 say "                                   FUNC 1         FUNC 2           GERAL"
@ 20,02 say " Valor a receber..............:" + Transform(nValorTaxaDeServicoFunc1, "@E 99,999.99") + "      " + Transform(nValorTaxaDeServicoFunc2, "@E 99,999.99") + Transform(nValorTaxaDeServicoFunc1EFunc2, "@E 999,999,999.99")

Inkey(0)
