syms y(x)

#Entrada: equação diferencial
DiffEquat = diff(y,x)-4*y==0

#Solução de EDO
solucao = dsolve(DiffEquat)

#Solução com especificação de condições iniciais
solucao = dsolve(DiffEquat, y(0)==1)

#Solução ao invés de ser demonstrada como uma equação,
#é mostrada como uma expressão
rhs(solucao)
disp("\n=== === === === ===\n")


#Utilização do SymPy para mostrar a classificação
#da equação diferencial
DiffEquat = diff(y) == y^2
[solucao, classificacao] = dsolve(DiffEquat, y(0)==1)
disp("\n=== === === === ===\n")


#Exemplos Extras:
#EDO com valores iniciais e valores sobre contorno
DiffEquat = diff(y, 2) == -9*y
dsolve(DiffEquat,y(0)==1,diff(y)(0)==12)
dsolve(DiffEquat,y(0)==1,y(sym(pi)/2)==2)
disp("\n=== === === === ===\n")

#EDO com valores iniciais envolvendo sistemas lineares
#de primeira ordem com coeficiantes constantes
syms x(t) y(t)
EDO_Sistema = [diff(x(t),t)==2*y(t); diff(y(t),t)==2*x(t)]
solucao = dsolve(EDO_Sistema)
solucao{1}
solucao{2}
disp("\n=== === === === ===\n")
disp("\n=== === END === ===\n")