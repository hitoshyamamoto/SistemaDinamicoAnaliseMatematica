syms s t y(t) u(t)
sistemaEDO = diff(y(t),t,t) - diff(y(t),t) - 2*y(t)==2*u(t)
F(s)= laplace(sistemaEDO,t,s)
