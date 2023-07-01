%% CHR com critério sem sobrevalor
% Antes rodar o arquivo PIDchr da pasta no simulink

clc
close all

PIDzn = out.PIDzn;
PIzn = out.PIzn;
Pzn = out.Pzn;
semControlador = out.semControlador;

degrau = PIDzn.signals.values(:,1);
a = PIDzn.signals.values(:,2);
b = PIzn.signals.values(:,2);
c = Pzn.signals.values(:,2);
d = semControlador.signals.values(:,2);

% Cria uma nova figura com o tamanho definido
figure('Position', [100, 100, 800, 600]);

plot(PIDzn.time,degrau);
hold on
plot(PIDzn.time,a);
plot(PIzn.time,b);
plot(Pzn.time,c);
plot(semControlador.time,d);

xlabel('Tempo(s)');
ylabel('Amplitude(V)');
legend('Entrada degrau','PID Ziegler-Nichols','PI Ziegler-Nichols','P Ziegler-Nichols','Sem controlador','Location', 'southeast');
title(' Método Ziegler-Nichols ')
hold off