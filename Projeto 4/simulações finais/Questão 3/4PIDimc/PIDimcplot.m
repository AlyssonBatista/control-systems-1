%% Método IMC
% Antes rodar o arquivo PIDimc da pasta 

clc
close all

PIDimc = out.PIDimc;
PIimc = out.PIimc;
semControlador = out.semControlador;

degrau = PIDimc.signals.values(:,1);
a = PIDimc.signals.values(:,2);
b = PIimc.signals.values(:,2);
d = semControlador.signals.values(:,2);

% Cria uma nova figura com o tamanho definido
figure('Position', [100, 100, 800, 600]);

plot(PIDimc.time,degrau);
hold on
plot(PIDimc.time,a);
plot(PIimc.time,b);
plot(semControlador.time,d);

xlabel('Tempo(s)');
ylabel('Amplitude(V)');
legend('Entrada degrau','PID IMC','PI IMC','Sem controlador','Location', 'southeast');
title(' Método IMC ')
hold off