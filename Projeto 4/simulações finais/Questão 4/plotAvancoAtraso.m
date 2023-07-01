%% ITEM 4 compensador por avanço e atraso
% rodar o arquivo avancoAtraso da pasta no simulink
clc
close all


figure('Position',[100,100,800,600])
simu = out.avancoAtraso;
a = simu.signals.values(:,1);
b = simu.signals.values(:,2);
plot(simu.time,a)
hold on
plot(simu.time,b)
title('Compensador por avanço e atraso')
xlabel('Tempo(s)')
ylabel('Amplitude(V)')
legend('Entrada', 'Saída')
hold off 

