/*
clear

Do While .t.

nContador := 0

   Do while nContador < 5
 //  @ 02,02 to 14,60 double
 //  @ 02,14 say " SG Sistemas - Exercicio 08 "

 //  nValorA := 10.00
 //  nValorB := 05.25
 //  nValorC := 20.00

   nQuantidadeA := 0
   nQuantidadeB := 0
   nQuantidadeC := 0

   @ 04,04 say "Produto A: R$" + Alltrim( Str( nValorA ) )
   @ 05,04 say "Produto B: R$" + Alltrim( Str( nValorB ) )
   @ 06,04 say "Produto C: R$" + Alltrim( Str( nValorC ) )

   @ 08,04 say "Informe a quantidade desejada do produto A: "
   @ 09,04 say "Informe a quantidade desejada do produto B: "
   @ 10,04 say "Informe a quantidade desejada do produto C: "

   @ 08,48 get nQuantidadeA picture "99"
   @ 09,48 get nQuantidadeB picture "99"
   @ 10,48 get nQuantidadeC picture "99"
   read

   If LastKey() == 27
      nSair := Alert("",{"Finalizar comprar?","Continuar comprando"})
      if nSair == 1
         exit
      elseif nSair == 2
         Loop
         clear
      endif
   endif


   Enddo

   If  nSair == 1

      alert("Forma de pagamento",{"Dinheiro","cartao","Moeda"})
   @ 12,04 say "Valor total da compra: R$" + Alltrim ( Str( ( nValorA*nQuantidadeA ) + ( nValorB*nQuantidadeB ) + ( nValorC*nQuantidadeC ) ) )
   endif

Enddo

Inkey(0)
*/


clear

Do While .t.


   cNome        := Space(40)
   nRepeticoesInicial  := 0
   nRepeticoesFinal    := 0
   nVezes := 2

   nLinha    := 5
   nContador := 0
   @ 01,02 say "Digite seu nome:"
   @ 02,02 say "Digite a Qtd De vezes para repetir:"

   @ 01,25 get cNome Picture "@!"
   @ 02,40 get nRepeticoesFinal Picture "999"
   read

   @ 04,04 say "Area de visuliaza‡ao"

   Do while nRepeticoesInicial < nRepeticoesFinal
      nLinha++
      nContador++
      nRepeticoesInicial++

      @ nLinha,20 say cNome
      @ nLinha,02 say nRepeticoesInicial
   Inkey(0.5)

   If nContador == 5

      @ 05,01 clear to 12 ,79
      @ 13,02 say "Pressione qualquer tecla p continuar!"
      Inkey(0)

      nLinha := 5
      nContador := 0

      nRepeticoesInicial++
      Loop
   Endif

   Enddo
Inkey(0)
Enddo



/*   If LastKey() != 27

      @ nLinha,01 say
   else
      nSair := Alert("",{"Finalizar comprar?","Continuar comprando"})
      if nSair == 1
         exit
      elseif nSair == 2
         Loop
         clear
      endif
   endif


   Enddo

Enddo

Inkey(0)
*/
