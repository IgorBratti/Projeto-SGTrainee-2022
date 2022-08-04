//Shift + L para selecionar a linha e depois F8 para passar a coluna

// para preciosar ESC e sair do programa (usar quase sempre depois do read)

clear

do while .t.
   nCodigo := 0
   @ 01,01 say "Codigo:"
   @ 01,09 get nCodigo Picture "99"
   read

   if LastKey()  == 27
      exit
   endif

enddo


// alert para sair ou nao do programa

clear

do while .t.
   nSair := Alert("Deseja sair",{"Sim","Nao"})

   if nSair == 1
      exit
   Endif

enddo


// para escrever datas exatas com nome

Year() = Retorna o Ano           de uma determinada data
Month() = Retorna o Mes           de uma determinada data
Day() = Retorna o Dia           de uma determinada data
Dow() = Retorna o Dia da semana de uma determinada data //1 -domingo, 2 -segunda feira...

Exemplo nAno := Year (dData) // tras o mes da variavel dData
Exemplo nMes := Mes (dDate()) // tras o mes atual

// subtrair

SubStr(cString,nPosInicial,nQtdeExtra‡Æo)

cPalavra := "Jos‚"

cPalavraExtraida := SubStr(cPalavra,2,2) = "os"

//

@ 10,02 Prompt "Primeira Op‡Æo"
@ 11,02 Prompt "Segunda Op‡Æo"

Menu To nOpcao

If nOpcao == 1

ElseIf nOpcao == 2

else

endif
//
/*
Fa‡a um programa que leia uma palavra e imprima invertida
*/

Clear

Do While .t.

   cPalavra := Space(40)

   @ 03,03 say "Digite uma palavra: "
   @ 03,25 get cPalavra Picture "@!"
   read

   nTamanhoPalavra := Len(Alltrim(cPalavra))
   cPalavraInvertida := ""

   Do While nTamanhoPalavra > 0

      cPalavraInvertida += SubStr(cPalavra,nTamanhoPalavra--,1)

   Enddo

   @ 05,03 say "Palavra Invertida: " + Alltrim(cPalavraInvertida)

   Inkey(0)

Enddo
// replace

@ 01,01 say Replicate("String",nNumeros)

//
Str(nNumero) == cNumero
Val(cNumero) == nNumero

