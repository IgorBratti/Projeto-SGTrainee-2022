clear
nNumeroA := 0
nNumeroB := 0

@ 02,02 to 09,39 double
@ 02,07 say " SG Sistemas - Exercicio 03 "
@ 04,04 say "De um valor para A:"
@ 05,04 say "De um valor para B:"

@ 04,23 get nNumeroA picture "99"
read
@ 05,23 get nNumeroB picture "99"
read

@ 07,04 say "O produto desses 2 numeros e: " +Alltrim(Str(nNumeroA*nNumeroB))

Inkey(0)

    /*
@ 02,01 say "A multiplicacao do numero "+Alltrim(Str(nNumero1))+" e " +Alltrim(Str(nNumero2)) +"="
@ 02,33 get nProduto picture "99"

read  */


