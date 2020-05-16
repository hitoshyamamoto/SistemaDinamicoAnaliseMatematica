syms y(x)

#Entrada: equa��o diferencial
DiffEquat = diff(y,x)-4*y==0

#Solu��o de EDO
solucao = dsolve(DiffEquat)

#Solu��o com especifica��o de condi��es iniciais
solucao = dsolve(DiffEquat, y(0)==1)

#Solu��o ao inv�s de ser demonstrada como uma equa��o,
#� mostrada como uma express�o
rhs(solucao)
disp("\n=== === === === ===\n")


#Utiliza��o do SymPy para mostrar a classifica��o
#da equa��o diferencial
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