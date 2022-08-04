clear

@ 02,02 to 10,77 Double
@ 02,20 say " SG sistemas - exercicio 11 "

cNome  := Space(50)
nIdade := 0

@ 04,04 say "Informe seu nome....:"
@ 05,04 say "Informe sua idade...:"

@ 04,26 get cNome Picture "@!"
@ 05,26 get nIdade Picture "99"
read


if nIdade >= 5 .and. nIdade <= 7
   cSay:= "Voce esta na categoria Infantil A!"
elseif nIdade >= 8 .and. nIdade <= 10
   cSay:= "Voce esta na categoria Infantil B!"
elseif nIdade >= 11 .and. nIdade <= 13
   cSay:= "Voce esta na categoria Juvenil A!"
elseif nIdade >= 14 .and. nIdade <= 17
   cSay:= "Voce esta na categoria Juvenil B!"
elseif nIdade >= 18
   cSay:= "Voce esta na categoria Senior!"
else
   cSay:= "Voce nao esta em nenhuma categoria!"
endif

@ 07,04 say cSay
Inkey(0)

