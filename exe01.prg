/*clear                                                                           // Limpar a  tela

@ 01,01 to 05,33 double                                                         // Criar esbo‡o do exercicio
@ 01,04 say " SG Sistemas - Exercicio 01 "
@ 03,04 say"Alo mundo!"                                                         // Escrever Mensagem

Inkey (0)                                                                       // Time para finalizar programa


set date to British
Set Epoch to 1930

Do while .t.

   Clear

   nFilial                      := 0
   cNomeCliente                 := Space(15)
   cNomeVendedor                := Space(15)
   nPorcentagemComissaoVendedor := 0
   nValorTotalComDesconto       := 0
   nValorTotal                  := 0
   dData                        := date()
   cDiaDaSemana                 := Space(20)
   cMes                         := Space(20)


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



   @ 02,15 say "Data do sistema:"
   @ 02,30 get dData
   read

   If dData
      @ 04,01 say "Maring , " + Str(day(dData)) + " de " + AllTrim(cMes) + " de " + Str(year(dData)) + " ( " + AllTrim(cDiaDaSemana) + " )"
   Endif

   Inkey(0)

Enddo
*/

Set date to British
Set Epoch To 1925

clear

dDataSistema := date()
dDataNascimento := cTod("")
dDataAdmissao := cTod("")
dDataDemissao := cTod("")

@ 02,02 say "Data nascimento"
@ 03,02 say "Data   Admissao"
@ 04,02 say "Data   Demissao"

@ 02,20 get dDataNascimento
@ 03,20 get dDataAdmissao
@ 04,20 get dDataDemissao
read

nIdade := Year(dDataSistema) - Year(dDataNascimento)


if  Month(dDataSistema) < Month(dDataNascimento)
   nIdade--
ElseIf Month(dDataSistema) == Month(dDataNascimento) .and. Day(dDataSistema) < Day(dDataNascimento)
   nIdade--
endif


@ 06,02 say nIdade

Inkey(0)
