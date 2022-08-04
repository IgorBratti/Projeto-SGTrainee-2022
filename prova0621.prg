//Igor Henrique Bratti Domingues
Set Date to British
Set Epoch to 1930
set wrap on

nVeiculoPopular := 0
nVeiculoLuxo    := 0


do while .t.
   clear

   @ 02,22 say "Locadora de Veiculos SG"
   @ 03,01 to 07,60
   @ 04,02 say "              Itens             |  Popular  |   Luxo"
   @ 05,02 say " Di ria                         | R$ 40,00  | R$ 70,00"
   @ 06,02 say " Percentual de Multas (Atrasos) |   12,5%   |    15%"

   @ 08,27 to 10,42 double
   @ 09,28 say "Menu Principal"

   @ 11,31 prompt "Locacao"
   @ 12,30 prompt "Devolucao"
   @ 13,30 prompt "Consultar"
   Menu to nOpcaoMenuPrincipal

   If nOpcaoMenuPrincipal == 1

      clear
      nVeiculo        := 1
      @ 05,01 say "Selecione o veiculo:"

      do while .t.

         @ 04,22 clear to 06,42

         @ 05,23 say "POPULAR      LUXO"

         if nVeiculo == 1
            @ 04,22 to 06,31
         else
            @ 04,33 to 06,42
         endif

         nTecla := Inkey( 0 )

         if nTecla == 27 /* ESC */
            nVeiculo := 0
            exit

         elseif nTecla == 13 /* ENTER */
            exit

         elseif ntecla == 19 /* ESQUERDA */

            nVeiculo := 1


         elseif ntecla == 4 /* DIREITA */

            nVeiculo := 2

         endif

      enddo

      /****** Apenas DEBUG *******/
      if !Empty( nVeiculo )
         Alert( "Veiculo selecionado foi:" + Alltrim( Str( nVeiculo ) ) )
      endif
      /***************************/
      If nVeiculo == 2
         nVeiculoLuxo++
         clear
         cNomeClienteLuxo           := Space(20)
         cTelefoneClienteLuxo       := Space(10)
         cCPFClienteLuxo            := Space(10)
         dDataNascimentoClienteLuxo := cTod("")
         dDataLocacaoClienteLuxo    := cTod("")
         nQTDDiasLocacaoClienteLuxo := 0

         @ 02,02 say "Nome................:"
         @ 03,02 say "Telefone............:"
         @ 04,02 say "Data de Nascimento..:"
         @ 05,02 say "CPF.................:"
         @ 06,02 say "Data da Locacao.....:"
         @ 07,02 say "Quantidade de Dias..:"

         @ 02,24 get cNomeClienteLuxo           Picture "@!"
         @ 03,24 get cTelefoneClienteLuxo       Picture "@!"
         @ 04,24 get dDataNascimentoClienteLuxo
         @ 05,24 get cCPFClienteLuxo            Picture "@!"
         @ 06,24 get dDataLocacaoClienteLuxo
         @ 07,24 get nQTDDiasLocacaoClienteLuxo Picture "999"
         read

         dDataPrevistaDevolucaoLuxo := dDataLocacaoClienteLuxo + nQTDDiasLocacaoClienteLuxo
         nValorTotalLuxo    := 70*nQTDDiasLocacaoClienteLuxo

         @ 10,02 say "Data da Devolucao:"
         @ 10,21 say  dDataPrevistaDevolucaoLuxo
         @ 11,02 say "Valor Total......: " + Alltrim(Transform(nValorTotalLuxo, "@E 99,999.99"))
         inkey(0)
      Endif
      If nVeiculo == 1
         nVeiculoPopular++
         clear
         cNomeClientePopular           := Space(20)
         cTelefoneClientePopular       := Space(10)
         cCPFClientePopular            := Space(10)
         dDataNascimentoClientePopular := cTod("")
         dDataLocacaoClientePopular    := cTod("")
         nQTDDiasLocacaoClientePopular := 0

         @ 02,02 say "Nome................:"
         @ 03,02 say "Telefone............:"
         @ 04,02 say "Data de Nascimento..:"
         @ 05,02 say "CPF.................:"
         @ 06,02 say "Data da Locacao.....:"
         @ 07,02 say "Quantidade de Dias..:"

         @ 02,24 get cNomeClientePopular           Picture "@!"
         @ 03,24 get cTelefoneClientePopular       Picture "@!"
         @ 04,24 get dDataNascimentoClientePopular
         @ 05,24 get cCPFClientePopular            Picture "@!"
         @ 06,24 get dDataLocacaoClientePopular
         @ 07,24 get nQTDDiasLocacaoClientePopular Picture "999"
         read

         dDataPrevistaDevolucaoPopular := dDataLocacaoClientePopular + nQTDDiasLocacaoClientePopular
         nValorTotalPopular    := 40*nQTDDiasLocacaoClientePopular

         @ 10,02 say "Data da Devolucao: "
         @ 10,21 say dDataPrevistaDevolucaoPopular
         @ 11,02 say "Valor Total......: " + Alltrim(Transform(nValorTotalPopular, "@E 99,999.99"))
         Inkey(0)
      Endif
   Elseif nOpcaoMenuPrincipal == 2
      clear
      nVeiculo := 1

      @ 05,01 say "Selecione o veiculo:"

      do while .t.

         @ 04,22 clear to 06,42

         @ 05,23 say "POPULAR      LUXO"

         if nVeiculo == 1
            @ 04,22 to 06,31
         else
            @ 04,33 to 06,42
         endif

         nTecla := Inkey( 0 )

         if nTecla == 27 /* ESC */
            nVeiculo := 0
            exit

         elseif nTecla == 13 /* ENTER */
            exit

         elseif ntecla == 19 /* ESQUERDA */
            nVeiculo := 1

         elseif ntecla == 4 /* DIREITA */
            nVeiculo := 2

         endif

      enddo

      /****** Apenas DEBUG *******/
      if !Empty( nVeiculo )
         Alert( "Veiculo selecionado foi:" + Alltrim( Str( nVeiculo ) ) )
      endif
      /***************************/



      If nVeiculo == 1 .and. nVeiculoPopular > 0
         dDataDevolucaoPopular := ctod("")
         @ 08,02 say "Informe a data para devolucao:"
         @ 08,32 get dDataDevolucaoPopular
         read
         clear

         @ 02,18 say "Locadora de Veiculos SG"
         @ 03,01 to 07,43
         @ 04,02 say "              Itens             |  Popular"
         @ 05,02 say " Di ria                         | R$ 40,00"
         @ 06,02 say " Percentual de Multas (Atrasos) |   12,5% "


         If dDataDevolucaoPopular > dDataPrevistaDevolucaoPopular
            nValorTotalPopular := nValorTotalPopular + (((40*(dDataDevolucaoPopular - dDataPrevistaDevolucaoPopular))*112.5)/100)

         Elseif dDataDevolucaoPopular <= dDataPrevistaDevolucaoPopular
            nValorTotalPopular := 40*(dDataDevolucaoPopular - dDataLocacaoClientePopular)

         endif
         nDiasUsadosCarroPopular := dDataDevolucaoPopular - dDataLocacaoClientePopular
         @ 09,02 say "Nome do Cliente.............: " + Alltrim(cNomeClientePopular)
         @ 10,02 say "Data prevista para Devolucao: "
         @ 10,33 say dDataPrevistaDevolucaoPopular
         @ 11,02 say "Data da Devolucao...........: "
         @ 11,33 say dDataDevolucaoPopular
         @ 12,02 say "Dias Usado..................: " + Alltrim(Str(nDiasUsadosCarroPopular))
         @ 13,02 say "Valor a Pagar...............: " + alltrim(transform(nValorTotalPopular, "@E 99,999.99"))
         Inkey(0)


      nPagamento := 1

      @ 16,01 say "Forma de Pagamento: "

      do while .t.

        // @ 04,22 clear to 06,61

         @ 16,22 say "  DINHEIRO    CARTAO DEB.   CARTAO CRE."

         if nPagamento == 1
            @ 15,22 to 17,34
         elseif nPagamento == 2
            @ 15,35 to 17,47
         else
            @ 15,49 to 17,61
         endif

         nTecla := Inkey( 0 )

         if nTecla == 27 /* ESC */
            nPagamento := 0
            exit

         elseif nTecla == 13 /* ENTER */
            exit

         elseif nTecla == 4 /* DIREITA */
            if nPagamento == 1 .or. nPagamento == 2
               nPagamento++
            endif

         elseif nTecla == 19 /* ESQUERDA */
            if nPagamento == 2 .or. nPagamento == 3
               nPagamento--
            endif

         endif

      enddo


      /************** DEBUG ***************/
      if !Empty( nPagamento )
         Alert( 'Forma de pagamento selecionada: ' + AllTrim( Str( nPagamento ) ) )
      endif
      /************************************/

      /*
      .
      . Continua com sua logica
      .
      */




      ElseIf nVeiculo == 2 .and. nVeiculoLuxo > 0
         dDataDevolucaoLuxo := ctod("")
         @ 08,02 say "Informe a data para devolucao:"
         @ 08,32 get dDataDevolucaoLuxo
         read
         clear
         @ 02,18 say "Locadora de Veiculos SG"
         @ 03,02 to 07,40
         @ 04,02 say "              Itens             |   Luxo  "
         @ 05,02 say " Di ria                         | R$ 70,00"
         @ 06,02 say " Percentual de Multas (Atrasos) |    15%  "

         If dDataDevolucaoLuxo > dDataPrevistaDevolucaoLuxo
            nValorTotalLuxo := nValorTotalLuxo + (((40*(dDataDevolucaoLuxo - dDataPrevistaDevolucaoLuxo))*115)/100)

         Elseif dDataDevolucaoLuxo <= dDataPrevistaDevolucaoLuxo
            nValorTotal := 70*(dDataDevolucaoLuxo - dDataLocacaoClienteLuxo)

         endif

         nDiasUsadosCarroLuxo := dDataDevolucaoLuxo - dDataLocacaoClienteLuxo

         @ 09,02 say "Nome do Cliente.: " + Alltrim(cNomeClienteLuxo)
         @ 10,02 say "Data prevista para Devolucao: "
         @ 10,33 say dDataPrevistaDevolucaoLuxo
         @ 11,02 say "Data da Devolucao...........: "
         @ 11,33 say dDataDevolucaoLuxo
         @ 12,02 say "Dias Usado......: " + Alltrim(Str(nDiasUsadosCarroLuxo))
         @ 13,02 say "Valor a Pagar...: " + transform(nValorTotalLuxo, "@E 99,999.99")


      nPagamento := 1

      @ 16,01 say "Forma de Pagamento: "

      do while .t.

        // @ 04,22 clear to 06,61

         @ 16,22 say "  DINHEIRO    CARTAO DEB.   CARTAO CRE."

         if nPagamento == 1
            @ 15,22 to 17,34
         elseif nPagamento == 2
            @ 15,35 to 17,47
         else
            @ 15,49 to 17,61
         endif

         nTecla := Inkey( 0 )

         if nTecla == 27 /* ESC */
            nPagamento := 0
            exit

         elseif nTecla == 13 /* ENTER */
            exit

         elseif nTecla == 4 /* DIREITA */
            if nPagamento == 1 .or. nPagamento == 2
               nPagamento++
            endif

         elseif nTecla == 19 /* ESQUERDA */
            if nPagamento == 2 .or. nPagamento == 3
               nPagamento--
            endif

         endif

      enddo


      /************** DEBUG ***************/
      if !Empty( nPagamento )
         Alert( 'Forma de pagamento selecionada: ' + AllTrim( Str( nPagamento ) ) )
      endif
      /************************************/

      /*
      .
      . Continua com sua logica
      .
      */



      Elseif nVeiculo == 2 .and. nVeiculoLuxo == 0 .or. nVeiculo == 1 .and. nVeiculoPopular == 0
         Alert("Veiculo nao locado")
         exit
      endif

   Elseif nOpcaoMenuPrincipal == 3
      clear
      nVeiculo := 1

      @ 05,01 say "Selecione o veiculo:"

      do while .t.

         @ 04,22 clear to 06,42

         @ 05,23 say "POPULAR      LUXO"

         if nVeiculo == 1
            @ 04,22 to 06,31
         else
            @ 04,33 to 06,42
         endif

         nTecla := Inkey( 0 )

         if nTecla == 27 /* ESC */
            nVeiculo := 0
            exit

         elseif nTecla == 13 /* ENTER */
            exit

         elseif ntecla == 19 /* ESQUERDA */
            nVeiculo := 1

         elseif ntecla == 4 /* DIREITA */
            nVeiculo := 2

         endif

      enddo

      /****** Apenas DEBUG *******/
      if !Empty( nVeiculo )
         Alert( "Veiculo selecionado foi:" + Alltrim( Str( nVeiculo ) ) )
      endif
      /***************************/
       dDataConsulta := cTod("")

      @ 01,02 say "Data da Consulta:"
      @ 01,20 get dDataConsulta
      read



      If nVeiculo == 1 .and. nVeiculoPopular > 0


         dDataAtual    := date()
         nIdadePopular := Year(dDataAtual) - Year(dDataNascimentoClientePopular)
         if Month(dDataAtual) < Month(dDataNascimentoClientePopular)
            nIdadePopular--
         ElseIf Month(dDataAtual) == Month(dDataNascimentoClientePopular) .and. Day(dDataAtual) < Day(dDataNascimentoClientePopular)
            nIdadePopular--
         endif


         @ 02,02 say "Nome................:"
         @ 03,02 say "Telefone............:"
         @ 04,02 say "Data de Nascimento..:"
         @ 05,02 say "CPF.................:"
         @ 06,02 say "Data da Locacao.....:"
         @ 07,02 say "Quantidade de Dias..:"
         @ 08,02 say "Idade...............:"


         @ 02,30 say cNomeClientePopular
         @ 03,30 say cTelefoneClientePopular
         @ 04,30 say dDataNascimentoClientePopular
         @ 05,30 say cCPFClientePopular
         @ 06,30 say dDataLocacaoClientePopular
         @ 07,30 say nQTDDiasLocacaoClientePopular
         @ 08,30 say nIdadePopular

      Elseif nVeiculo == 1 .and. nVeiculoPopular == 0

         @ 02,02 say "Carro Disponivel"

         dDiasLocadoPopular := dDataDevolucaoPopular -  dDataLocacaoClientePopular
         @ 02,02 say "Carro Disponivel"
         @ 03,02 say "dias Locados:"
         @ 03,20 say dDiasLocadoPopular
         Inkey(0)

      Elseif nVeiculo == 2 .and. nVeiculoLuxo > 0

         dDataAtual    := date()
         nIdadeLuxo := Year(dDataAtual) - Year(dDataNascimentoClienteLuxo)
         if Month(dDataAtual) < Month(dDataNascimentoClienteLuxo)
            nIdadeLuxo--
         ElseIf Month(dDataAtual) == Month(dDataNascimentoClienteLuxo) .and. Day(dDataAtual) < Day(dDataNascimentoClienteLuxo)
            nIdadeLuxo--
         endif


         @ 02,02 say "Nome................:"
         @ 03,02 say "Telefone............:"
         @ 04,02 say "Data de Nascimento..:"
         @ 05,02 say "CPF.................:"
         @ 06,02 say "Data da Locacao.....:"
         @ 07,02 say "Quantidade de Dias..:"
         @ 08,02 say "Idade...............:"


         @ 02,30 say cNomeClienteLuxo
         @ 03,30 say cTelefoneClienteLuxo
         @ 04,30 say dDataNascimentoClienteLuxo
         @ 05,30 say cCPFClienteLuxo
         @ 06,30 say dDataLocacaoClienteLuxo
         @ 07,30 say nQTDDiasLocacaoClienteLuxo
         @ 08,30 say nIdadeLuxo

      Elseif nVeiculo == 2 .and. nVeiculoLuxo == 0

         dDiasLocadoLuxo := dDataDevolucaoLuxo -  dDataLocacaoClienteLuxo
         @ 02,02 say "Carro Disponivel"
         @ 03,02 say "dias Locados:"
         @ 03,20 say dDiasLocadoLuxo
         Inkey(0)
      Endif
   Endif
enddo
