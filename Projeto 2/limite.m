syms s k
kp = limit(1/(1+k*(5.56/(s^2+1.56*s+5.56))),s,0) 
%kp = 1/(1+k)

Valor = 1/0.05
k = Valor - 1

