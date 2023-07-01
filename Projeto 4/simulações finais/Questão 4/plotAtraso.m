%% ITEM 4 compensador por atraso
% rodar o arquivo atraso da pasta no simulink
clc
close all


figure('Position',[100,100,800,600])
simu = out.atraso;
a = simu.signals.values(:,1);
b = simu.signals.values(:,2);
plot(simu.time,a)
hold on
plot(simu.time,b) 
title('Compensador por atraso')
xlabel('Tempo(s)')
ylabel('Amplitude(V)')
legend('Entrada', 'Saída')
hold off

