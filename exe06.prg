clear

nNumeroA := 0
nNumeroB := 0
nNumeroC := 0

@ 02,02 to 10,38 double
@ 02,06 say " SG Sistemas - Exercicio 06 "
@ 04,04 say "De um valor para A:"
@ 05,04 say "De um valor para B:"
@ 06,04 say "De um valor para C:"

@ 04,23 get nNumeroA picture "9"
read
@ 05,23 get nNumeroB picture "9"
read
@ 06,23 get nNumeroC picture "9"
read

@ 08,04 say "A media desses 3 numeros e: " + Alltrim(Str((nNumeroA+nNumeroB+nNumeroC) / 3))

Inkey (0)
