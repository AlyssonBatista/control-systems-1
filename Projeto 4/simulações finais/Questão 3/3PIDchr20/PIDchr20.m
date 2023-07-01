%% CHR com critério de 20% de sobrevalor
% Antes rodar o arquivo PIDchrcom20 da pasta 

clc
close all

PIDchrVinte = out.PIDchrVinte;
PIchrVinte = out.PIchrVinte;
PchrVinte = out.PchrVinte;
semControlador = out.semControlador;

degrau = PIDchrVinte.signals.values(:,1);
a = PIDchrVinte.signals.values(:,2);
b = PIchrVinte.signals.values(:,2);
c = PchrVinte.signals.values(:,2);
d = semControlador.signals.values(:,2);

% Cria uma nova figura com o tamanho definido
figure('Position', [100, 100, 800, 600]);

plot(PIDchrVinte.time,degrau);
hold on
plot(PIDchrVinte.time,a);
plot(PIchrVinte.time,b);
plot(PchrVinte.time,c);
plot(semControlador.time,d);

xlabel('Tempo(s)');
ylabel('Amplitude(V)');
legend('Entrada degrau','PID CHR com critério de 20% de sobrevalor','PI CHR com critério de 20% de sobrevalor','P CHR com critério de 20% de sobrevalor','Sem controlador','Location', 'southeast');
title(' Método CHR com critério de 20% de sobrevalor ')
hold off