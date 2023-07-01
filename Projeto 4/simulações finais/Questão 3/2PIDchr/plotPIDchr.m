%% CHR com critério sem sobrevalor
% Antes rodar o arquivo PIDchr da pasta 

clc
close all

PIDchr = out.PIDchr;
PIchr = out.PIchr;
Pchr = out.Pchr;
semControlador = out.semControlador;

degrau = PIDchr.signals.values(:,1);
a = PIDchr.signals.values(:,2);
b = PIchr.signals.values(:,2);
c = Pchr.signals.values(:,2);
d = semControlador.signals.values(:,2);

% Cria uma nova figura com o tamanho definido
figure('Position', [100, 100, 800, 600]);

plot(PIDchr.time,degrau);
hold on
plot(PIDchr.time,a);
plot(PIchr.time,b);
plot(Pchr.time,c);
plot(semControlador.time,d);

xlabel('Tempo(s)');
ylabel('Amplitude(V)');
legend('Degrau','PID CHR com critério sem sobrevalor','PI CHR com critério sem sobrevalor','P CHR com critério sem sobrevalor','Sem controlador','Location', 'southeast');
title(' Método CHR com critério sem sobrevalor ')
hold off