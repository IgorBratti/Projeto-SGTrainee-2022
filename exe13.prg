clear

nNumero := 0

@ 05,04 say "Digite um numero: "
@ 05,26 get nNumero Picture "99"
read

if nNumero = 1
   cSay := "Alimento nao-perecivel"
elseif nNumero >= 2 .and. nNumero <= 4
   cSay := "Alimento perecivel"
elseif nNumero >= 5 .and. nNumero <= 6
   cSay := "Vestuario"
elseif nNumero = 7
   cSay := "Higiene pessoal"
elseif nNumero >= 8 .and.nNumero <= 15
   cSay := "Limpeza e utensilios domesticos"
else
   cSay := "Codigo invalido"
endif

@ 07,04 say cSay

Inkey(0)
