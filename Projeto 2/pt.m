syms s k

G = 5.56/(s^2+11.55*s+5.56)
E_estacionario = limit(((1.5*k*G)/(1+k*G)),s,0)
pretty(E_estacionario)
%E_estacionario = 5% = 5/100 = 1.5/(1+k)
% logo E_estacionario = 1.5/(1+k) = 0.05 
k_parcial = 1.5/0.05; %k_parcial = 20
k = k_parcial - 1
