% rodar o arquivo Questao1metodos no simulink 
clc
close all

%%  ITEM 1 Plot dos métodos matemáticos 
% Ziegler-Nichols
num = 0.997;
den = [2.294 1];
Td = 11.09+0.06;
Gs = tf(num,den, 'InputDelay', Td)
figure('Position',[100,100,800,600])
step(3*Gs)
hold on
title('Ziegler-Nichols')

% Smith 1 ordem
num = 0.997;
den = [1.044 1];
Td = 11.09+0.846;
Gt=tf(num,den, 'InputDelay', Td)
figure('Position',[100,100,800,600])
step(3*Gt)

title('Smith 1° ordem')

% Sundaresan
num = 0.997;
den = [1.002 1];
Td = 11.09+0.6317;
Gs = tf(num,den, 'InputDelay', Td)
figure('Position',[100,100,800,600])
step(3*Gs)
title('Sundaresan')

% Broida
num = 0.997;
den = [0.0194 1];
Td = 11.09+0.002016;
Gs = tf(num,den, 'InputDelay', Td)
figure('Position',[100,100,800,600])
step(3*Gs)
title('Broida')

% Harriot
num = 0.223079;
den = [1 1.429 0.22375];
Td = 11.09+18.05;
Gs = tf(num,den, 'InputDelay', Td)
figure('Position',[100,100,800,600])
step(3*Gs)
title('Harriot')

% Mollenkamp
num = 0.997*(0.87)^2;
den = [1 1.19 0.87^2];
Td = 11.09+10.52;
Gs = tf(num,den, 'InputDelay', Td)
figure('Position',[100,100,800,600])
step(3*Gs)
title('Mollenkamp')


metodosprimeira = out.metodosprimeira;

a = metodosprimeira.signals.values(:,1);
b = metodosprimeira.signals.values(:,2);
c = metodosprimeira.signals.values(:,3);
d = metodosprimeira.signals.values(:,4);
e = metodosprimeira.signals.values(:,5);
f = metodosprimeira.signals.values(:,6);
g = metodosprimeira.signals.values(:,7);

figure('Position',[100,100,800,600])
plot(metodosprimeira.time,a);
hold on

plot(metodosprimeira.time,b)
plot(metodosprimeira.time,c)
plot(metodosprimeira.time,d)
plot(metodosprimeira.time,e)
plot(metodosprimeira.time,f)
plot(metodosprimeira.time,g)
title('Comparação dos métodos')
xlabel('Tempo(s)')
ylabel('Amplitude(V)')
legend('Ziegler-Nichols','Smith 1°','Sundaresan','Broida','Harriot','Mollenkamp','Entrada Degrau=3')
hold off


