function graficoBode
  syms F
  
  #Inser��o de valores da fun��o de transfer�ncia
  numerador = input("Numerador: ")
  denominador = input("Denominador: ")
  F = tf(numerador, denominador)
  
  bode(F)

endfunction
