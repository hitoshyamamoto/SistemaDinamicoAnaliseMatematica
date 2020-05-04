function calcularTransformadaLaplace
  disp("1 - Transformada de Laplace\n2 - Transformada Inversa de Laplace\n\n")
  tipoOperacao = input("Escolha uma das opções, por favor\n")
  
  if(tipoOperacao == 1)
    disp("Coloque os valores no numerador da função:\n")
    disp("[ Por exemplo: ]\n(3 + 2*exp(3*t))\n[ Resposta: ]\n(5*s - 9)/(s*(s-3))\n")
    syms F f s t
    f = input("Sua função:\n")
    F = laplace(f,t,s)
  endif
  if(tipoOperacao == 2)
    disp("Coloque os valores no numerador da função:\n")
    disp("[ Por exemplo: ]\n1/(s*(s+3))\n[ Resposta: ]\n1/3 - (e^(-3*t))/3\n")
    syms F f s t positive
    F = input("Sua função:\n")
    f = ilaplace(F,s,t)
  endif

endfunction