%% ITEM 1 Modelo experimental
% rodar o arquivo Questao1EsperimentoCircuito no simulink 
clc
close all


figure('Position',[100,100,800,600])
simu = out.simout;
a = simu.signals.values(:,1);
b = simu.signals.values(:,2);
plot(simu.time,a)
hold on
plot(simu.time,b)
hold off 
title('Modelo experimental')
xlabel('Tempo(s)')
ylabel('Amplitude(V)')
legend('Entrada', 'Saída')
hold off

save esperimento simu a b