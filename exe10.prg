clear

@ 02,02 to 08,45 Double
@ 02,10 say " SG Sistemas - Exercicio 10 "

nIdade := 0

@ 04,04 say "Informe sua Idade"

@ 04,21 get nIdade Picture "99"
read

if nIdade > 21
   @ 06,04 say "Vocˆ tem mais de 21 anos!"
endif

if nIdade < 21
   @ 06,04 say "Vocˆ tem menos de 21 anos!"
endif

if nIdade = 21
   @06,04 say "Vocˆ tem 21 Anos!"
endif

Inkey(0)
