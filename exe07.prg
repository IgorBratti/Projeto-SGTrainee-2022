clear

SetMode(25,80)

nNumeroA := 0
nNumeroB := 0


@ 02,02 to 12,52 double
@ 02,12 say " SG Sistemas - Exercicio 07 "
@ 04,04 say "De um valor para A: "
@ 05,04 say "De um valor para B: "

@ 04,23 get nNumeroA picture "999"
read
@ 05,23 get nNumeroB picture "999"
read

@ 07,04 say "A soma dos numeros "+Alltrim(Str(nNumeroA))+" e "+Alltrim(Str(nNumeroB))+" e: "+Alltrim(Str(nNumeroA+nNumeroB))
@ 08,04 say "A subtracao dos numeros "+Alltrim(Str(nNumeroA))+" e "+Alltrim(Str(nNumeroB))+" e: "+Alltrim(Str(nNumeroA-nNumeroB))
@ 09,04 say "A divisao dos numeros "+Alltrim(Str(nNumeroA))+" e "+Alltrim(Str(nNumeroB))+" e: "+Alltrim(Str(nNumeroA/nNumeroB))
@ 10,04 say "A multiplicacao dos numeros "+Alltrim(Str(nNumeroA))+" e "+Alltrim(Str(nNumeroB))+" e: "+Alltrim(Str(nNumeroA*nNumeroB))

Inkey (0)
