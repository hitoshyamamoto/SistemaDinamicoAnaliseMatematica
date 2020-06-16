function graficoBode
  syms F
  
  #Inserção de valores da função de transferência
  numerador = input("Numerador: ")
  denominador = input("Denominador: ")
  F = tf(numerador, denominador)
  
  bode(F)

endfunction
