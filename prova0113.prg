// Igor Henrique Bratti Domingues

Set Date to British
Set Epoch to 1930


Do While .t.

   clear


                                            //Info Faculdade
   @ 01,04 say "Faculdade Harbour"
   @ 02,01 say "Cidade: Maringa"
   @ 03,01 say "Endere‡o: Rua Sebatiao de Paula e silva, 487"
   @ 04,01 say "Cep: 87025-589"
   @ 05,01 say "Telefone: (44) 99946-8154"
                                           //Variaveis Info Alunos
   cNome                  := Space(20)
   dDataDeNascimento      := cTod("")
   cCurso                 := Space(20)
   nSerie                 := 0
   nAnoLetivo             := 0
   nValorMensalidade      := 0
   cBolsistaOuNao         := Space(1)
                                           //Info Alunos
   @ 07,01 say "Nome do Aluno:"
   @ 07,40 say "Bolsista Integral, parcial ou nenhum?"
   @ 08,40 say "I= Integral, P= Parcial, N= Nenhum"
   @ 08,01 say "Data de Nascimento:"
   @ 09,01 say "Curso:"
   @ 10,01 say "Serie:"
   @ 11,01 say "Ano Letivo:"
   @ 12,01 say "Valor Mensalidade:"
                                           //get's info Aluno
   @ 07,16 get cNome picture "@!"                                                  Valid !Empty(cNome)
   @ 08,20 get dDataDeNascimento                                                   Valid !Empty(dDataDeNascimento)
   @ 09,10 get cCurso Picture "@!"                                                 Valid !Empty(cCurso)
   @ 10,10 get nSerie Picture "9"                                                  Valid nSerie >= 1 .and.nSerie <= 9
   @ 11,14 get nAnoLetivo Picture "9999"                                           Valid !Empty(nAnoLetivo)
   @ 12,20 get nValorMensalidade Picture "@E 99,999.99"                            Valid nValorMensalidade > 0
   @ 07,78 get cBolsistaOuNao Picture "@!"                                         Valid cBolsistaOuNao =="I" .or. cBolsistaOuNao == "P" .or. cBolsistaOuNao == "N"
   read

   if lastKey() == 27
      nOpcaoEncerrarAluno := alert("Oque deseja fazer?",{"Retornar ao casdastro","Pular Cadastro","Finalizar Programa"})
      if nOpcaoEncerrarAluno == 1
         Loop
      Elseif nOpcaoEncerrarAluno == 2
      Elseif nOpcaoEncerrarAluno == 3
         Exit
      endif

   endif


                                           //Variaveis para nome das Disciplinas
   cNomeDisciplina1              := Space(17)
   cNomeDisciplina2              := Space(17)
   cNomeDisciplina3              := Space(17)
   cNomeDisciplina4              := Space(17)
                                           //Variaveis para Notas das Disciplinas
   nNota1Disciplina1             := 0
   nNota1Disciplina2             := 0
   nNota1Disciplina3             := 0
   nNota1Disciplina4             := 0
   nNota2Disciplina1             := 0
   nNota2Disciplina2             := 0
   nNota2Disciplina3             := 0
   nNota2Disciplina4             := 0
   nNota3Disciplina1             := 0
   nNota3Disciplina2             := 0
   nNota3Disciplina3             := 0
   nNota3Disciplina4             := 0
   nNota4Disciplina1             := 0
   nNota4Disciplina2             := 0
   nNota4Disciplina3             := 0
   nNota4Disciplina4             := 0
                                           //Variaveis para Quantidade de Faltas
   nQtdFalta1Bimestre1Disciplina := 0
   nQtdFalta1Bimestre2Disciplina := 0
   nQtdFalta1Bimestre3Disciplina := 0
   nQtdFalta1Bimestre4Disciplina := 0
   nQtdFalta2Bimestre1Disciplina := 0
   nQtdFalta2Bimestre2Disciplina := 0
   nQtdFalta2Bimestre3Disciplina := 0
   nQtdFalta2Bimestre4Disciplina := 0
   nQtdFalta3Bimestre1Disciplina := 0
   nQtdFalta3Bimestre2Disciplina := 0
   nQtdFalta3Bimestre3Disciplina := 0
   nQtdFalta3Bimestre4Disciplina := 0
   nQtdFalta4Bimestre1Disciplina := 0
   nQtdFalta4Bimestre2Disciplina := 0
   nQtdFalta4Bimestre3Disciplina := 0
   nQtdFalta4Bimestre4Disciplina := 0
                                           //Esbo‡o boletim
   @ 14,30 say "Boletim"
   @ 16,02 say "Disciplina           1B    F    2B    F    3B    F    4B    F   Res. Final"

   @ 13,01 to 21,79
   @ 15,02 to 15,78
   @ 16,20 to 20,20
   @ 16,26 to 20,26
   @ 16,31 to 20,31
   @ 16,37 to 20,37
   @ 16,42 to 20,42
   @ 16,48 to 20,48
   @ 16,53 to 20,53
   @ 16,59 to 20,59
   @ 16,64 to 20,64
                                           //Get's para informar dados no Boletim
   @ 17,02 get cNomeDisciplina1              Picture "@!"                          Valid !Empty(cNomeDisciplina1)
   @ 18,02 get cNomeDisciplina2              Picture "@!"                          Valid !Empty(cNomeDisciplina2)
   @ 19,02 get cNomeDisciplina3              Picture "@!"                          Valid !Empty(cNomeDisciplina3)
   @ 20,02 get cNomeDisciplina4              Picture "@!"                          Valid !Empty(cNomeDisciplina4)

   @ 17,22 get nNota1Disciplina1             Picture "@E 99.9"                     Valid nNota1Disciplina1 >=0 .and. nNota1Disciplina1 <=10
   @ 17,28 get nQtdFalta1Bimestre1Disciplina Picture "@E 999"                      Valid nQtdFalta1Bimestre1Disciplina >=0

   @ 18,22 get nNota1Disciplina2             Picture "@E 99.9"                     Valid nNota1Disciplina2 >=0 .and. nNota1Disciplina2 <=10
   @ 18,28 get nQtdFalta1Bimestre2Disciplina Picture "@E 999"                      Valid nQtdFalta1Bimestre2Disciplina >=0


   @ 19,22 get nNota1Disciplina3             Picture "@E 99.9"                     Valid nNota1Disciplina3 >=0 .and. nNota1Disciplina3 <=10
   @ 19,28 get nQtdFalta1Bimestre3Disciplina Picture "@E 999"                      Valid nQtdFalta1Bimestre3Disciplina >=0

   @ 20,22 get nNota1Disciplina4             Picture "@E 99.9"                     Valid nNota1Disciplina4 >=0 .and. nNota1Disciplina4 <=10
   @ 20,28 get nQtdFalta1Bimestre4Disciplina Picture "@E 999"                      Valid nQtdFalta1Bimestre4Disciplina >=0


   @ 17,33 get nNota2Disciplina1             Picture "@E 99.9"                     Valid nNota2Disciplina1 >=0 .and. nNota2Disciplina1 <=10
   @ 17,39 get nQtdFalta2Bimestre1Disciplina Picture "@E 999"                      Valid nQtdFalta2Bimestre1Disciplina >=0

   @ 18,33 get nNota2Disciplina2             Picture "@E 99.9"                     Valid nNota2Disciplina2 >=0 .and. nNota2Disciplina2 <=10
   @ 18,39 get nQtdFalta2Bimestre2Disciplina Picture "@E 999"                      Valid nQtdFalta2Bimestre2Disciplina >=0

   @ 19,33 get nNota2Disciplina3             Picture "@E 99.9"                     Valid nNota2Disciplina3 >=0 .and. nNota2Disciplina3 <=10
   @ 19,39 get nQtdFalta2Bimestre3Disciplina Picture "@E 999"                      Valid nQtdFalta2Bimestre3Disciplina >=0

   @ 20,33 get nNota2Disciplina4             Picture "@E 99.9"                     Valid nNota2Disciplina4 >=0 .and. nNota2Disciplina4 <=10
   @ 20,39 get nQtdFalta2Bimestre4Disciplina Picture "@E 999"                      Valid nQtdFalta2Bimestre4Disciplina >=0



   @ 17,44 get nNota3Disciplina1             Picture "@E 99.9"                     Valid nNota3Disciplina1 >=0 .and. nNota3Disciplina1 <=10
   @ 17,50 get nQtdFalta3Bimestre1Disciplina Picture "@E 999"                      Valid nQtdFalta3Bimestre1Disciplina >=0

   @ 18,44 get nNota3Disciplina2             Picture "@E 99.9"                     Valid nNota3Disciplina2 >=0 .and. nNota3Disciplina2 <=10
   @ 18,50 get nQtdFalta3Bimestre2Disciplina Picture "@E 999"                      Valid nQtdFalta3Bimestre2Disciplina >=0

   @ 19,44 get nNota3Disciplina3             Picture "@E 99.9"                     Valid nNota3Disciplina3 >=0 .and. nNota3Disciplina3 <=10
   @ 19,50 get nQtdFalta3Bimestre3Disciplina Picture "@E 999"                      Valid nQtdFalta3Bimestre3Disciplina >=0

   @ 20,44 get nNota3Disciplina4             Picture "@E 99.9"                     Valid nNota3Disciplina4 >=0 .and. nNota3Disciplina4 <=10
   @ 20,50 get nQtdFalta3Bimestre4Disciplina Picture "@E 999"                      Valid nQtdFalta3Bimestre4Disciplina >=0



   @ 17,55 get nNota4Disciplina1             Picture "@E 99.9"                     Valid nNota4Disciplina1 >=0 .and. nNota4Disciplina1 <=10
   @ 17,61 get nQtdFalta4Bimestre1Disciplina Picture "@E 999"                      Valid nQtdFalta4Bimestre1Disciplina >=0

   @ 18,55 get nNota4Disciplina2             Picture "@E 99.9"                     Valid nNota4Disciplina2 >=0 .and. nNota4Disciplina2 <=10
   @ 18,61 get nQtdFalta4Bimestre2Disciplina Picture "@E 999"                      Valid nQtdFalta4Bimestre2Disciplina >=0

   @ 19,55 get nNota4Disciplina3             Picture "@E 99.9"                     Valid nNota4Disciplina3 >=0 .and. nNota4Disciplina3 <=10
   @ 19,61 get nQtdFalta4Bimestre3Disciplina Picture "@E 999"                      Valid nQtdFalta4Bimestre3Disciplina >=0

   @ 20,55 get nNota4Disciplina4             Picture "@E 99.9"                     Valid nNota4Disciplina4 >=0 .and. nNota4Disciplina4 <=10
   @ 20,61 get nQtdFalta4Bimestre4Disciplina Picture "@E 999"                      Valid nQtdFalta4Bimestre4Disciplina >=0
   read

                                           //Variaveis para armazenar info de DPs
   nQtdDP                      := 0
   cNomeMateriasDP             := Space(17)

   nDisciplina1Media       := ( nNota1Disciplina1 + nNota2Disciplina1 + nNota3Disciplina1 + nNota4Disciplina1 ) / 4
   nDisciplina2Media       := ( nNota1Disciplina2 + nNota2Disciplina2 + nNota3Disciplina2 + nNota4Disciplina2 ) / 4
   nDisciplina3Media       := ( nNota1Disciplina3 + nNota2Disciplina3 + nNota3Disciplina3 + nNota4Disciplina3 ) / 4
   nDisciplina4Media       := ( nNota1Disciplina4 + nNota2Disciplina4 + nNota3Disciplina4 + nNota4Disciplina4 ) / 4

   nFaltasDisciplina1Media := (nQtdFalta1Bimestre1Disciplina + nQtdFalta2Bimestre1Disciplina + nQtdFalta3Bimestre1Disciplina + nQtdFalta4Bimestre1Disciplina)
   nFaltasDisciplina2Media := (nQtdFalta1Bimestre2Disciplina + nQtdFalta2Bimestre2Disciplina + nQtdFalta3Bimestre2Disciplina + nQtdFalta4Bimestre2Disciplina)
   nFaltasDisciplina3Media := (nQtdFalta1Bimestre3Disciplina + nQtdFalta2Bimestre3Disciplina + nQtdFalta3Bimestre3Disciplina + nQtdFalta4Bimestre3Disciplina)
   nFaltasDisciplina4Media := (nQtdFalta1Bimestre4Disciplina + nQtdFalta2Bimestre4Disciplina + nQtdFalta3Bimestre4Disciplina + nQtdFalta4Bimestre4Disciplina)

   cSimOuNao               := Space(3)

   if nDisciplina1Media >= 6 .and. nFaltasDisciplina1Media <= 48
      @ 17,66 say "Aprv " + Alltrim( Str( nDisciplina1Media ))                                                 Color "G/N"
   elseif nDisciplina1Media >= 6 .and. nFaltasDisciplina1Media >= 49 .and. nFaltasDisciplina1Media <= 56
      @ 17,66 get cSimOuNao Picture "@! S.N"
      read

   elseif nDisciplina1Media >= 6 .and. nFaltasDisciplina1Media > 48
      @ 17,66 say "Rpvd Flt " + Alltrim( Str( nDisciplina1Media ))                                             Color "R/N"
      nQtdDP++
      cNomeMateriasDP += cNomeDisciplina1 + "|"

   else
      @ 17,66 say "Rpvd " + Alltrim( Str( nDisciplina1Media ))                                                 Color "R/N"
      nQtdDP++
      cNomeMateriasDP += cNomeDisciplina1 + "|"
   endif


   if nDisciplina2Media >= 6 .and. nFaltasDisciplina2Media <= 48
      @ 18,66 say "Aprv " + Alltrim( Str( nDisciplina2Media ))                                                 Color "G/N"
   elseif nDisciplina2Media >= 6 .and. nFaltasDisciplina2Media > 48
      @ 18,66 say "Rpvd Flt " + Alltrim( Str( nDisciplina2Media ))                                             Color "R/N"
      nQtdDP++
      cNomeMateriasDP += cNomeDisciplina2 + "|"
   else
      @ 18,66 say "Rpvd " + Alltrim( Str( nDisciplina2Media ))                                                 Color "R/N"
      nQtdDP++
      cNomeMateriasDP += cNomeDisciplina2 + "|"
   endif


   if nDisciplina3Media >= 6 .and. nFaltasDisciplina3Media <= 48
      @ 19,66 say "Aprv " + Alltrim( Str( nDisciplina3Media ))                                                 Color "G/N"
   elseif nDisciplina3Media >= 6 .and. nFaltasDisciplina3Media > 48
      @ 19,66 say "Rpvd Flt " + Alltrim( Str( nDisciplina3Media ))                                             Color "R/N"
      nQtdDP++
      cNomeMateriasDP += cNomeDisciplina3 + "|"
   else
      @ 19,66 say "Rpvd " + Alltrim( Str( nDisciplina3Media ))                                                 Color "R/N"
      nQtdDP++
      cNomeMateriasDP += cNomeDisciplina3 + "|"
   endif


   if nDisciplina4Media >= 6 .and. nFaltasDisciplina4Media <= 48
      @ 20,66 say "Aprv " + Alltrim( Str( nDisciplina4Media ))                                                 Color "G/N"
   elseif nDisciplina4Media >= 6 .and. nFaltasDisciplina4Media > 48
      @ 20,66 say "Rpvd flt " + Alltrim( Str( nDisciplina4Media ))                                             Color "R/N"
      nQtdDP++
      cNomeMateriasDP += cNomeDisciplina4 + "|"
   else
      @ 20,66 say "Rpvd " + Alltrim( Str( nDisciplina4Media ))                                                 Color "R/N"
      nQtdDP++
      cNomeMateriasDP += cNomeDisciplina4 + "|"
   endif

   if nQtdDP == 0 .and. cBolsistaOuNao == "I"
      @ 23,01 say "Aprovado, 0 DPs"                                                                            Color "G/N"
   elseif nQtdDP > 0 .and. cBolsistaOuNao == "I"
      @ 23,02 say "Reprovado"                                                                                  Color "R/N"
   endif

   if nQtdDP == 0 .and. cBolsistaOuNao == "P"
      @ 23,01 say "Aprovado, 0 DPs"                                                                            Color "G/N"
   elseif nQtdDP == 1 .and. cBolsistaOuNao == "P"
      @ 23,01 say "Aprovado, 1 DP: " + Alltrim(cNomeMateriasDP)                                                Color "Gr/N"
      @ 24,01 say "Novo Valor mensalidade: $" + Alltrim( Str(((( nValorMensalidade/100 )*10) + nValorMensalidade )))
   elseif nQtdDP > 1 .and. cBolsistaOuNao == "P"
      @ 23,02 say "Reprovado"                                                                                  Color "R/N"
   endif

   if nQtdDP == 0 .and. cBolsistaOuNao == "N"
      @ 23,01 say "Aprovado, 0 DPs"                                                                            Color "G/N"
   elseif nQtdDP == 1 .and. cBolsistaOuNao == "N"
      @ 23,01 say "Aprovado, 1 DP: " + Alltrim(cNomeMateriasDP)                                                Color "Gr/N"
      @ 24,01 say "Novo Valor mensalidade: $" + Alltrim( Str(((( nValorMensalidade/100 )*10) + nValorMensalidade )))
   elseif nQtdDP == 2 .and. cBolsistaOuNao == "N"
      @ 23,01 say "Aprovado, 2 DP: " + Alltrim(cNomeMateriasDP)                                                Color "Gr/N"
      @ 24,01 say "Valor mensalidade: $" + Alltrim( Str(((( nValorMensalidade/100 )*20) + nValorMensalidade )))
   elseif nQtdDP > 2 .and. cBolsistaOuNao == "N"
      @ 23,02 say "Reprovado"                                                                                  Color "R/N"
   endif
   Inkey(0)

                                   // Novo aluno ou finalizar
    nOpcaoFinalizar := alert("Registar novo aluno ou finalizar?", {"Novo Aluno", "Encerrar"})

   if nOpcaoFinalizar == 1
      loop
   else
      exit
   endif
enddo
