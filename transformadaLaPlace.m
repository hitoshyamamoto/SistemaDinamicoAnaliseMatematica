function calcularTransformadaLaplace
  disp("1 - Transformada de Laplace\n2 - Transformada Inversa de Laplace\n\n")
  tipoOperacao = input("Escolha uma das opções, por favor\n")
  
  if(tipoOperacao == 1)
    disp("Coloque os valores no numerador da função:\n")
    disp("[ Por exemplo: ]\n(3*t + 2*exp(3*t))\n[ Resposta: ]\n2/(s-3) + 3/s^2\n")
    syms F f s t
    f = input("Sua função:\n")
    F = laplace(f,t,s)
  endif
  if(tipoOperacao == 2)
    disp("Coloque os valores no numerador da função:\n")
    disp("[ Por exemplo: ]\n1/((s+3)*(s-2))\n[ Resposta: ] exp(2*t)/5 - 1/(5*exp(3*t))\n")
    syms F f s t
    F = input("Sua funcao:\n")
    f = ilaplace(F,s,t)
  endif

endfunction