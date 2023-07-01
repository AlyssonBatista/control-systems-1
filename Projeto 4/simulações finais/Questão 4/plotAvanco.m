%% ITEM 4 compensador por avanço
% rodar o arquivo avanco da pasta no simulink
clc
close all


figure('Position',[100,100,800,600])
simu = out.avanco;
a = simu.signals.values(:,1);
b = simu.signals.values(:,2);
plot(simu.time,a)
hold on
plot(simu.time,b)
title('Compensador por avanço')
xlabel('Tempo(s)')
ylabel('Amplitude(V)')
legend('Entrada', 'Saída')
hold off

