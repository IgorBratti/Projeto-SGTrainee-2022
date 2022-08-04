//igor henrique bratti domingues
clear
                              // entrega
cNomeEntrega     := Space(35)
cEnderecoEntrega := Space(50)
                              // mesas
nNumeroMesa      := 0
nCodigoAtendente := 0
nNumeroMesa1     := 0
nNumeroMesa2     := 0

                              //pedido

nValorTotalPedidoEntrega := 0
nValorFinalPedidoEntrega := 0
nLinhaEntrega            := 10

nValorTotalPedido := 0
nValorFinalPedido := 0
nLinha            := 10


Do While .t.
   clear

   @ 02,28 say "RESTAURANTE SG"

   @ 08,27 to 10,42 double
   @ 09,28 say "Menu Principal"

   @ 11,31 prompt "Delivery"
   @ 12,31 prompt "  Mesas "


   Menu to nOpcaoMenuPrincipal

   If nOpcaoMenuPrincipal == 1
      Do While .t.
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


         Do While .t.
            cDescricaoPedidoEntrega  := Space(30)
            nQTDPedidoEntrega        := 0
            nPrecoUnitPedidoEntrega  := 0


            @ 07,28 say "PEDIDO"
            @ 09,02 say "          PRODUTO             |QTD| PREC. UNIT|    VALOR TOTAL | VALOR FINAL  "

            @ nLinhaEntrega,02 get cDescricaoPedidoEntrega  Picture "@!"                            Valid !Empty(cDescricaoPedidoEntrega)
            @ nLinhaEntrega,34 get nQTDPedidoEntrega        Picture "99"                            Valid nQTDPedidoEntrega > 0
            @ nLinhaEntrega,38 get nPrecoUnitPedidoEntrega  Picture "@E 999,999.99"                 Valid nPrecoUnitPedidoEntrega > 0
            read

            If LastKey() != 27

               nValorTotalPedidoEntrega := nPrecoUnitPedidoEntrega*nQTDPedidoEntrega
               nValorFinalPedidoEntrega += nValorTotalPedidoEntrega

               @ nLinhaEntrega,48 say nValorTotalPedidoEntrega Picture "@E 99,999,999.99"
               @ nLinhaEntrega,58 say nValorFinalPedidoEntrega Picture "@E 99,999,999.99"

               nLinhaEntrega++
               @ nLinhaEntrega,01 clear to nLinhaEntrega,79
            else
               nOpcaoPedidoEntrega := Alert("Deseja", {"Enviar Pedido para Producao","Continuar Digitando", "Abandonar Digitacao"})
               If nOpcaoPedidoEntrega == 1
                  Alert("Pedido Enviado")
                  exit
               elseif nOpcaoPedidoEntrega == 2
                  loop
               elseif nOpcaoPedidoEntrega == 3
                  Exit
               Endif
            Endif
         Enddo

         if nOpcaoPedidoEntrega == 3
            exit
         endif
         Do while .t.
            If nOpcaoPedidoEntrega == 1
               If Lastkey() != 27
                  cFormaPagamentoEntrega := Space(1)
                  nValorRecebidoEntrega  := 0
                  @ 07,01 clear to nLinhaEntrega,79
                  @ 07,02 say "[D]inheiro / [C]artao / Che[Q]ue:"
                  @ 08,02 say "Total pagar.....................:" + Transform(nValorFinalPedidoEntrega, "@E 999,999,999.99")
                  @ 09,02 say "Valor recebido..................:"

                  @ 07,36 get cFormaPagamentoEntrega Picture "@!"                                  Valid cFormaPagamentoEntrega $ "DCQ"
                  @ 09,36 get nValorRecebidoEntrega  Picture "@E 999,999,999.99"                   Valid nValorRecebidoEntrega >= nValorFinalPedidoEntrega
                  read

                  If nValorRecebidoEntrega > nValorFinalPedidoEntrega
                     nTrocoEntrega := nValorRecebidoEntrega - nValorFinalPedidoEntrega
                     @ 10,02 say "Troco...........................:" + Transform(nTrocoEntrega,"@E 999,999,999.99")
                     Inkey(0)
                  endif
               else
                  nOpcaoPagamento := Alert("",{"Cancelar Pagamento","Recomecar Pagamento"})
                  If nOpcaoPagamento == 1
                     exit
                  Endif
               Endif
            endif
         Enddo
         If nOpcaoPagamento == 1
            exit
         Endif
      Enddo





   Elseif nOpcaoMenuPrincipal == 2
      Do while .t.
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
                  loop
               Elseif  nNumeroMesa == 2 .and. nNumeroMesa2 == 1
                  nNumeroMesa2 := 0
                  loop
               Endif
            endif
         Endif



         If nNumeroMesa == 1
            nNumeroMesa1 := 1
         Elseif nNumeroMesa == 2
            nNUmeroMesa2 := 1
         Endif
         If LastKey() == 27
            nOpcaoSair := Alert("Deseja voltar para o menu Principal?", {"Sim", "Nao"})
            If nOpcaoSair == 1
               exit
            endif
         endif



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

            If LastKey() != 27

               nValorTotalPedido := nPrecoUnitPedido*nQTDPedido
               nValorFinalPedido += nValorTotalPedido

               @ nLinha,48 say nValorTotalPedido Picture "@E 99,999,999.99"
               @ nLinha,58 say nValorFinalPedido Picture "@E 99,999,999.99"

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
                  exit
               Endif
            Endif
         Enddo

         If nOpcaoPedido == 1 .or. nOpcaoPedido == 3
            exit
         endif

         Do while .t.
            If nOpcaoPedido == 1
               If Lastkey() != 27
                  nOpcaoTaxa := Alert("Aceita taxa de servico?",{"Sim","Nao"})
                  If nOpcaoTaxa == 1
                     nValorFinalPedido := (nValorFinalPedido*110)/100
                  endif

                  cFormaPagamento := Space(1)
                  nValorRecebido  := 0
                  @ 07,01 clear to nLinha,79
                  @ 07,02 say "[D]inheiro / [C]artao / Che[Q]ue:"
                  @ 08,02 say "Total pagar.....................:" + Transform(nValorFinalPedido, "@E 999,999,999.99")
                  @ 09,02 say "Valor recebido..................:"

                  @ 07,36 get cFormaPagamento Picture "@!"                                  Valid cFormaPagamento $ "DCQ"
                  @ 09,36 get nValorRecebido  Picture "@E 999,999,999.99"                   Valid nValorRecebido >= nValorFinalPedido
                  read

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
            endif
         Enddo
         If nOpcaoPagamento == 1
            exit
         Endif
      Enddo
   Endif
Enddo

