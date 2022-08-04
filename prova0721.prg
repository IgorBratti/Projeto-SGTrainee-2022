//Igor Henrioque Bratti Domingues

set wrap on
set date to british
set epoch to 1930


clear
nCodigoDeContato1 := 0
nCodigoDeContato2 := 0
nCodigoDeContato3 := 0
nCodigoDeContato4 := 0
nCodigoDeContato5 := 0


cNome1           := Space(20)
cTelefone1       := Space(15)
dDataNascimento1 := cTod("")
nIdade1          := 0
cSexo1           := Space(1)
nAltura1         := 0
cEndereco1       := Space(15)
nNumeroEndereco1 := 0
cCidade1         := Space(10)

cNome2           := Space(20)
cTelefone2       := Space(15)
dDataNascimento2 := cTod("")
nIdade2          := 0
cSexo2           := Space(1)
nAltura2         := 0
cEndereco2       := Space(15)
nNumeroEndereco2 := 0
cCidade2         := Space(10)

cNome3           := Space(20)
cTelefone3       := Space(15)
dDataNascimento3 := cTod("")
nIdade3          := 0
cSexo3           := Space(1)
nAltura3         := 0
cEndereco3       := Space(15)
nNumeroEndereco3 := 0
cCidade3         := Space(10)

cNome4           := Space(20)
cTelefone4       := Space(15)
dDataNascimento4 := cTod("")
nIdade4          := 0
cSexo4           := Space(1)
nAltura4         := 0
cEndereco4       := Space(15)
nNumeroEndereco4 := 0
cCidade4         := Space(10)

cNome5           := Space(20)
cTelefone5       := Space(15)
dDataNascimento5 := cTod("")
nIdade5          := 0
cSexo5           := Space(1)
nAltura5         := 0
cEndereco5       := Space(15)
nNumeroEndereco5 := 0
cCidade5         := Space(10)

nOpcaoLogin      := 0

Do while .t.
   cFormaLogin     := ""
   cFormaSenha     := ""
   cAcumulaSenha   := ""
   cAcumulaLogin   := ""
   nTamanhoPalavra := 0
   cBuscaLetra     := ""
   nContador := 1
   Do while .t.

      cLogin := Space(10)
      cSenha := Space(10)

      @ 02,29 to 05,48
      @ 03,30 say "Login: "
      @ 04,30 say "Senha: "

      @ 03,37 get cLogin Picture "@!"
      @ 04,37 get cSenha Picture "@!"  // Valid cSenha $ ""
      read

      nTamanhoPalavra := len(AllTrim(cSenha))
      cFormaSenha     += cSenha
      cFormaLogin     += cLogin

      If nTamanhoPalavra < 8
         @ 06,30 say "Possuir no Minimo 8 caracteres"
         Loop
      Else
         Do while nContador <= nTamanhoPalavra
            cBuscaLetra := substr(cSenha,nContador,1)
            If cBuscaLetra $ "1234567890"
            loop
            Else
               @ 07,30 say "Possuir no Minino 1 Caracteres Numerico"
               Inkey(0)
            endif

               nContador++
         Enddo

      Endif

      if cFormaLogin $ cSenha
         @ 07,30 say "Login nao pode fazer parte da senha"
         Inkey(0)
         Loop
      endif

      If LastKey() == 27
         nOpcaoLogin := Alert("Oque deseja?", {"Sair","Retornar ao Login"})

         If nOpcaoLogin == 1
            exit

         ElseIf nOpcaoLogin == 2
            Loop

         endif

      Endif
      cAcumulaSenha += cSenha
      cAcumulaLogin += cLogin

      If cSenha == cAcumulaSenha .and. cLogin == cAcumulaLogin
         Exit

      Else
         @ 06,30 say "Login ou senha errados"

      endif

   enddo

   If nOpcaoLogin == 1
      exit
   endif

   Do while .t.
      nCodigoDeContato := 0
      clear
      @ 02,02 say "Informe o codigo de contato"

      @ 02,30 get nCodigoDeContato Picture "9"
      read
      If LastKey() == 27
         nOpcaoMenu := Alert("Deseja sair?",{"sim","nao"})
         If nOpcaoMenu == 1
            clear
            exit
         Elseif nOpcaoMenu == 2
            Loop
         endif
      endif

      IF nCodigoDeContato == 1 .and. nCodigoDeContato1 == 0
         clear

         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome1           Picture "@"
         @ 03,23 get cTelefone1       Picture "@"
         @ 04,23 get dDataNascimento1
         @ 05,23 get nIdade1          Picture "999"
         @ 06,23 get cSexo1           Picture "@!"
         @ 07,23 get nAltura1         Picture "9,99"
         @ 08,23 get cEndereco1       Picture "@"
         @ 09,23 get nNumeroEndereco1 Picture "9999"
         @ 10,23 get cCidade1         Picture "@"
         read

         nCodigoDeContato1++
         Loop
      Elseif nCodigoDeContato == 2 .and. nCodigoDeContato2 == 0
         clear

         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome2           Picture "@"
         @ 03,23 get cTelefone2       Picture "@"
         @ 04,23 get dDataNascimento2
         @ 05,23 get nIdade2          Picture "999"
         @ 06,23 get cSexo2           Picture "@!"
         @ 07,23 get nAltura2         Picture "9,99"
         @ 08,23 get cEndereco2       Picture "@"
         @ 09,23 get nNumeroEndereco2 Picture "9999"
         @ 10,23 get cCidade2         Picture "@"
         read

         nCodigoDeContato2++
         Loop
      Elseif nCodigoDeContato == 3 .and. nCodigoDeContato3 == 0
         clear

         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome3           Picture "@"
         @ 03,23 get cTelefone3       Picture "@"
         @ 04,23 get dDataNascimento3
         @ 05,23 get nIdade3          Picture "999"
         @ 06,23 get cSexo3           Picture "@!"
         @ 07,23 get nAltura3         Picture "9,99"
         @ 08,23 get cEndereco3       Picture "@"
         @ 09,23 get nNumeroEndereco3 Picture "9999"
         @ 10,23 get cCidade3         Picture "@"
         read

         nCodigoDeContato3++
         Loop
      Elseif nCodigoDeContato == 4 .and. nCodigoDeContato4 == 0
         clear

         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome4           Picture "@"
         @ 03,23 get cTelefone4       Picture "@"
         @ 04,23 get dDataNascimento4
         @ 05,23 get nIdade4          Picture "999"
         @ 06,23 get cSexo4           Picture "@!"
         @ 07,23 get nAltura4         Picture "9,99"
         @ 08,23 get cEndereco4       Picture "@"
         @ 09,23 get nNumeroEndereco1 Picture "9999"
         @ 10,23 get cCidade4         Picture "@"
         read

         nCodigoDeContato4++
         Loop
      Elseif nCodigoDeContato == 5 .and. nCodigoDeContato5 == 0
         clear

         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome5           Picture "@"
         @ 03,23 get cTelefone5       Picture "@"
         @ 04,23 get dDataNascimento5
         @ 05,23 get nIdade5          Picture "999"
         @ 06,23 get cSexo5           Picture "@!"
         @ 07,23 get nAltura5         Picture "9,99"
         @ 08,23 get cEndereco5       Picture "@"
         @ 09,23 get nNumeroEndereco5 Picture "9999"
         @ 10,23 get cCidade5         Picture "@"
         read

         nCodigoDeContato5++
         Loop
      Elseif nCodigoDeContato == 1 .and. nCodigoDeContato1 > 0
         clear
         nOpcaoContato1 := Alert ("O codigo ja esta em uso!",{"Acessar Contato", "Excluir Contado"})

         If nOpcaoContato1 == 1
         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome1           Picture "@"
         @ 03,23 get cTelefone1       Picture "@"
         @ 04,23 get dDataNascimento1
         @ 05,23 get nIdade1          Picture "999"
         @ 06,23 get cSexo1           Picture "@!"
         @ 07,23 get nAltura1         Picture "9,99"
         @ 08,23 get cEndereco1       Picture "@"
         @ 09,23 get nNumeroEndereco1 Picture "9999"
         @ 10,23 get cCidade1         Picture "@"
         read
         elseif nOpcaoContato1 == 2
            cNome1           := Space(20)
            cTelefone1       := Space(15)
            dDataNascimento1 := cTod("")
            nIdade1          := 0
            cSexo1           := Space(1)
            nAltura1         := 0
            cEndereco1       := Space(15)
            nNumeroEndereco1 := 0
            cCidade1         := Space(10)

            nCodigoDeContato1 := 0
            Loop
         Endif



      Elseif nCodigoDeContato == 2 .and. nCodigoDeContato2 > 0
         clear
         clear
         nOpcaoContato2 := Alert ("O codigo ja esta em uso!",{"Acessar Contato", "Excluir Contado"})

         If nOpcaoContato2 == 1
         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome2           Picture "@"
         @ 03,23 get cTelefone2       Picture "@"
         @ 04,23 get dDataNascimento2
         @ 05,23 get nIdade2          Picture "999"
         @ 06,23 get cSexo2           Picture "@!"
         @ 07,23 get nAltura2         Picture "9,99"
         @ 08,23 get cEndereco2       Picture "@"
         @ 09,23 get nNumeroEndereco2 Picture "9999"
         @ 10,23 get cCidade2         Picture "@"
         read
         elseif nOpcaoContato2 == 2
            cNome2           := Space(20)
            cTelefone2       := Space(15)
            dDataNascimento2 := cTod("")
            nIdade2          := 0
            cSexo2           := Space(1)
            nAltura2         := 0
            cEndereco2       := Space(15)
            nNumeroEndereco2 := 0
            cCidade2         := Space(10)

            nCodigoDeContato2 := 0
         Endif



      Elseif nCodigoDeContato == 3 .and. nCodigoDeContato3 > 0
         clear

         clear
         nOpcaoContato3 := Alert ("O codigo ja esta em uso!",{"Acessar Contato", "Excluir Contado"})

         If nOpcaoContato3 == 1
         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome3           Picture "@"
         @ 03,23 get cTelefone3       Picture "@"
         @ 04,23 get dDataNascimento3
         @ 05,23 get nIdade3          Picture "999"
         @ 06,23 get cSexo3           Picture "@!"
         @ 07,23 get nAltura3         Picture "9,99"
         @ 08,23 get cEndereco3       Picture "@"
         @ 09,23 get nNumeroEndereco3 Picture "9999"
         @ 10,23 get cCidade3         Picture "@"
         read
         elseif nOpcaoContato3 == 2
            cNome3           := Space(20)
            cTelefone3       := Space(15)
            dDataNascimento3 := cTod("")
            nIdade3          := 0
            cSexo3           := Space(1)
            nAltura3         := 0
            cEndereco3       := Space(15)
            nNumeroEndereco3 := 0
            cCidade3         := Space(10)

            nCodigoDeContato3 := 0
         Endif



      Elseif nCodigoDeContato == 4 .and. nCodigoDeContato4 > 0
         clear

         clear
         nOpcaoContato4 := Alert ("O codigo ja esta em uso!",{"Acessar Contato", "Excluir Contado"})

         If nOpcaoContato4 == 1
         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome4           Picture "@"
         @ 03,23 get cTelefone4       Picture "@"
         @ 04,23 get dDataNascimento4
         @ 05,23 get nIdade4          Picture "999"
         @ 06,23 get cSexo4           Picture "@!"
         @ 07,23 get nAltura4         Picture "9,99"
         @ 08,23 get cEndereco4       Picture "@"
         @ 09,23 get nNumeroEndereco4 Picture "9999"
         @ 10,23 get cCidade4         Picture "@"
         read
         elseif nOpcaoContato4 == 2
            cNome4           := Space(20)
            cTelefone4       := Space(15)
            dDataNascimento4 := cTod("")
            nIdade4          := 0
            cSexo4           := Space(1)
            nAltura4         := 0
            cEndereco4       := Space(15)
            nNumeroEndereco4 := 0
            cCidade4         := Space(10)

            nCodigoDeContato4 := 0
         Endif



      Elseif nCodigoDeContato == 5 .and. nCodigoDeContato5 > 0
         clear

         clear
         nOpcaoContato5 := Alert ("O codigo ja esta em uso!",{"Acessar Contato", "Excluir Contado"})

         If nOpcaoContato5 == 1
         @ 02,02 say "Nome...............:"
         @ 03,02 say "Telefone...........:"
         @ 04,02 say "Data de Nascimento.:"
         @ 05,02 say "Idade..............:"
         @ 06,02 say "Sexo...............:"
         @ 07,02 say "Altura.............:"
         @ 08,02 say "Endere‡o...........:"
         @ 09,02 say "Nø.................:"
         @ 10,02 say "Cidade.............:"

         @ 02,23 get cNome5           Picture "@"
         @ 03,23 get cTelefone5       Picture "@"
         @ 04,23 get dDataNascimento5
         @ 05,23 get nIdade5          Picture "999"
         @ 06,23 get cSexo5           Picture "@!"
         @ 07,23 get nAltura5         Picture "9,99"
         @ 08,23 get cEndereco5       Picture "@"
         @ 09,23 get nNumeroEndereco5 Picture "9999"
         @ 10,23 get cCidade5         Picture "@"
         read
         elseif nOpcaoContato5 == 2
            cNome5           := Space(20)
            cTelefone5       := Space(15)
            dDataNascimento5 := cTod("")
            nIdade5          := 0
            cSexo5           := Space(1)
            nAltura5         := 0
            cEndereco5       := Space(15)
            nNumeroEndereco5 := 0
            cCidade5         := Space(10)

            nCodigoDeContato5 := 0
         Endif

      Endif
      exit











   Enddo

Enddo

