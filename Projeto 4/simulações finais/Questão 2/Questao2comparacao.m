%% ITEM 2
% Rodar o arquivo Questao1metodos da pasta Questão 1 no simulink e se
% certificar que a variaével fig está importando o o arquivo esperimentoPlot
% da pasta Questão 2. No seu pc terá que mudar o caminho de importação.
% Todos os nossos cáculos se basearam nesse plot do esperimento!
clc
close all

simu = out.metodosprimeira;
a = simu.signals.values(:,2);

%esperimento
fig = openfig('C:\Users\batis\OneDrive\Certificados\Engenharia elétrica\2023.1 end\controle 1\Atividades\Projeto 4\simulações finais\Questão 2\esperimentoPlot.fig');
hold on
plot(simu.time,a,'black')

title('Modelo experimental')
xlabel('Tempo(s)')
ylabel('Amplitude(V)')
legend( 'Entrada degrau','Esperimento','Metodo Smith 1º ordem')
hold off
