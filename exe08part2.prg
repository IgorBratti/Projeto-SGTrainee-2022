clear
//borda, excercicio
@ 02,02 to 22,79 double
@ 02,20 say " SG Sistemas - Exercicio 08part2 "

//variaveis e print cliente e vendedor
cCliente  := Space(50)
cVendedor := Space(30)
cColor    := "R/N"

@ 04,04 say "Vendedor: " Color cColor
@ 05,04 say "Cliente.: " Color cColor

@ 04,14 get cCliente picture "@!" Valid !Empty(cCliente) Color cColor
@ 05,14 get cVendedor picture "@!" Valid !Empty(cVendedor) Color cColor
read

//Bordas, Colunas e Linhas
@ 07,04 to 17,72

@ 09,32 to 16,32
@ 09,45 to 16,45
@ 09,58 to 16,58

@ 09,05 to 09,71
@ 11,05 to 11,71
@ 13,05 to 13,71
@ 15,05 to 15,71

//Informa‡äes da tabela
@ 08,20 say "** Cupom Fiscal**"
@ 10,05 say "Descricao do Produto"
@ 10,34 say "Quantidade"
@ 10,47 say "Valor Unit."
@ 10,60 say "Valor Total"

//Variaveis Produtos, QUantidade e Valores
cProduto1 := Space(25)
cProduto2 := Space(25)
cProduto3 := Space(25)

nQuantidade1 := 0
nQuantidade2 := 0
nQuantidade3 := 0

nValor1 := 0
nValor2 := 0
nValor3 := 0





// Picture infos Produtos, Quantidade e Valores
@ 12,05 get cProduto1    picture "@!"
@ 12,34 get nQuantidade1 picture "999.99" Valid nQuantidade1 >= 0 .and. nQuantidade1 <= 100
@ 12,47 get nValor1      picture "@E 9,999.99"
read

nValorTotal1 := nQuantidade1*nValor1
@ 12,60 say "R$"
@ 12,63 say nValorTotal1 Picture "@E 9,999.99"

@ 14,05 get cProduto2    picture "@!"
@ 14,34 get nQuantidade2 picture "999.99" Valid nQuantidade2 >= 0 .and. nQuantidade2 <= 100
@ 14,47 get nValor2      picture "@E 9,999.99"
read

nValorTotal2 := nQuantidade2*nValor2
@ 14,60 say "R$"
@ 14,63 say nValorTotal2 Picture "@E 9,999.99"

@ 16,05 get cProduto3    picture "@!"
@ 16,34 get nQuantidade3 picture "999.99" Valid nQuantidade3 >= 0 .and. nQuantidade3 <= 100
@ 16,47 get nValor3      picture "@E 9,999.99"
read

nValorTotal3 := nQuantidade3*nValor3
@ 16,60 say "R$"
@ 16,63 say nValorTotal3 Picture "@E 9,999.99"

//Variavel e print valor total
nValorTotal := ( nQuantidade1*nValor1 ) + ( nQuantidade2*nValor2 ) + ( nQuantidade3*nValor3 )

@ 20,05 say "O valor a pagar e: R$" + Transform(nValorTotal, "@E 9,999.99")
// @ 20,27 say nValorTotal picture "@E 9,999.99"

Inkey (0)
