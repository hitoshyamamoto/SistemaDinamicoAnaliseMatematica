function calcularTransformadaLaplace
  disp("1 - Transformada de Laplace\n2 - Transformada Inversa de Laplace\n\n")
  tipoOperacao = input("Escolha uma das opções, por favor\n")
  
  if(tipoOperacao == 1)
    
  endif
  if(tipoOperacao == 2)
    s = tf('s')
    disp("Coloque os valores no numerador da função:\n")
    disp("Por exemplo:\n[1 2 3] = s^2 + 2s + 3\n\n")
    numerador = input("Numerador: ")
    denominador = input("Denominador: ")
    G = tf(numerador, denominador)
    disp("Valores de: Zeros, Polos e Ganho do Sistema\n")
    [zeros, polos, ganho_sistema] = zpkdata(G)
    disp("\nFunção em Transformada Inversa:\n")
    G = ilaplace(G, s, t)
  endif

endfunction