function propriedadesFuncaoTransferencia
  disp("Coloque a função de transferência:\n")
  disp("[ Por exemplo: ]\n")
  disp("Numerador: [2 5 1]\nDenominador: [1 3 5]\n")
  disp("[ Resposta: ]\n\t(2*s^2 + 5*s + 1)/(s^2 + 3*s + 5)\n\n")
  syms F
  numerador = input("Numerador: ")
  denominador = input("Denominador: ")
  F = tf(numerador, denominador)
  
  [zero, polo, ganho] = tf2zp(numerador,denominador)
  
  subplot (1,2,1)
  pzmap(F)
  sgrid on
  
  subplot (1,2,2)
  step(F)
  grid on
  
endfunction
