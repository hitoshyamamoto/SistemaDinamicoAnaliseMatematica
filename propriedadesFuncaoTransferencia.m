function propriedadesFuncaoTransferencia
  disp("Coloque a função de transferência:\n")
  disp("[ Por exemplo: ]\n")
  disp("Numerador: [2 5 1]\nDenominador: [1 3 5]\n")
  disp("[ Resposta: ]\n\t(2*s^2 + 5*s + 1)/(s^2 + 3*s + 5)\n\n")
  syms F
  
  #Inserção de valores da função de transferência
  numerador = input("Numerador: ")
  denominador = input("Denominador: ")
  F = tf(numerador, denominador)
  
  #Identicação dos Zeros, Polos e Ganho da Função de Transferência
  [zero, polo, ganho] = tf2zp(numerador,denominador)
  
  #Análise dos Zeros, se o sistema é estável ou instável
  for entrada = zero
    if(entrada < 0)
      printf("Zero[ %.5f ] = Sistema estável -> função converge\n",entrada)
    elseif(entrada > 0)
      printf("Zero[ %.5f ] = Sistema instavel -> função diverge\n",entrada)
    elseif(entrada ==0)
      printf("Zero[ %.5f ] = Sistema criticamente estável -> função converge\n",entrada)
    endif
  endfor
  
  #Identificação de Wn(frequencia natural) e Z(fator de amortecimento)
  [frequenciaNatural, fatorAmortecimento] = damp(F)
  
  #Análise do Ganho, se o sinal foi atenuado ou amplificado
  Ganho = 2*ganho/(frequenciaNatural.*frequenciaNatural)
  
  printf("ganho: %.5f\nGanho: %.5f\n",ganho,Ganho)
  
  printf("\n")
  if(Ganho>1)
    printf("[ K = %.5f ] Sinal Amplificado (K>1)\n",Ganho)
  elseif(Ganho==1)
    printf("[ K = %.5f ] Sinal Normal (K=1)\n",Ganho)
  elseif(Ganho<1)
    printf("[ K = %.5f ] Sinal Atenuado (K<1)\n",Ganho)
  endif
  
  #Informação pelo Z, identificando caracteristica do amortecimento do sistema
  if(fatorAmortecimento == 0)
    printf("[ Z = %.5f ] Sistema não amortecido (Z = 0)\n",fatorAmortecimento)
  elseif(fatorAmortecimento < 1)
    printf("[ Z = %.5f ] Sistema subamortecido (0 < Z < 1)\n",fatorAmortecimento)
  elseif(fatorAmortecimento == 1)
    printf("[ Z = %.5f ] Sistema criticamente amortecido (Z = 1)\n",fatorAmortecimento)
  elseif(fatorAmortecimento >1)
    printf("[ Z = %.5f ] Sistema sobreamortecido (Z > 1)\n",fatorAmortecimento)
  endif
  
  #AVISO: Todo e qualquer utilização de "*"(multiplicação), "/"(divisão) e "^"(elevado)
  #para utilização de operações escalares, coloque "." antes.
  #Pois, sem o ".", o Octave entende que é operação matricial.
  #Fonte: https://stackoverflow.com/questions/56759719/please-explain-octave-error-operator-nonconformant-arguments-op1-is-1x1-o/56760007
  
  #Calculo do T(Constante de Tempo)
  constanteTempo = 1./(fatorAmortecimento.*frequenciaNatural)
  
  #Calculo do TA(Tempo de Acomodação): 4*T tem valor de erro "<2%"
  TA = constanteTempo.*4
  
  #Calculo do Mp(Valor do Pico)
  Mp = Ganho.*(1+exp(((-1).*pi.*fatorAmortecimento)./(sqrt(1-fatorAmortecimento.^2))))
  
  #Calculo do Tp(Tempo do Pico)
  Tp = pi./(frequenciaNatural.*sqrt(1-(fatorAmortecimento.*fatorAmortecimento)))
  
  #Calculo do OvS(Overshoot)
  OvS = ((Mp-Ganho)./Ganho).*100
  
  #Conjunto de prints
  printf("\n")
  printf("Tempo constante:      T  = %.5f\n", constanteTempo)
  printf("Tempo de acomodação: TA  = %.5f\n", TA)
  printf("Valor do pico:       Mp  = %.5f\n", Mp)
  printf("Tempo do pico:       Tp  = %.5f\n", Tp)
  printf("Overshoot:           OvS = %.5f%%\n", OvS)
  
  subplot (1,2,1)
  pzmap(F)
  sgrid on
  
  subplot (1,2,2)
  step(F)
  grid on
  
endfunction
