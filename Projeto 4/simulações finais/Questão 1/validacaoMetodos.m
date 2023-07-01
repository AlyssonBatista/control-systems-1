% Sistema de primeira ordem
% rodar o arquivo Questao1metodos no simulink 
 
dados_simulacao = out.metodosprimeira.signals.values;

%% NMRSE
NMRSE_ZN = (1-(sqrt(sum(dados_simulacao(:,2)- dados_simulacao(:,1)).^2)/length(dados_simulacao(:,2)))/mean(dados_simulacao(:,2)))*100
NMRSE_Smith1 = (1-(sqrt(sum(dados_simulacao(:,2)- dados_simulacao(:,2)).^2)/length(dados_simulacao(:,2)))/mean(dados_simulacao(:,2)))*100
NMRSE_Sundaresan = (1-(sqrt(sum(dados_simulacao(:,2)- dados_simulacao(:,3)).^2)/length(dados_simulacao(:,2)))/mean(dados_simulacao(:,2)))*100
NMRSE_Broida = (1-(sqrt(sum(dados_simulacao(:,2)- dados_simulacao(:,4)).^2)/length(dados_simulacao(:,2)))/mean(dados_simulacao(:,2)))*100
NMRSE_Harriot = (1-(sqrt(sum(dados_simulacao(:,2)- dados_simulacao(:,5)).^2)/length(dados_simulacao(:,2)))/mean(dados_simulacao(:,2)))*100
NMRSE_Mollenkamp = (1-(sqrt(sum(dados_simulacao(:,2)- dados_simulacao(:,6)).^2)/length(dados_simulacao(:,2)))/mean(dados_simulacao(:,2)))*100

%% r^2
R_2_ZN = (1 - sum((dados_simulacao(:,2) - dados_simulacao(:,1)).^2)/sum((dados_simulacao(:,2) - mean(dados_simulacao(:,2))).^2))*100
R_2_Smith1 = (1 - sum((dados_simulacao(:,2) - dados_simulacao(:,2)).^2)/sum((dados_simulacao(:,2) - mean(dados_simulacao(:,2))).^2))*100
R_2_Sundaresan = (1 - sum((dados_simulacao(:,2) - dados_simulacao(:,3)).^2)/sum((dados_simulacao(:,2) - mean(dados_simulacao(:,2))).^2))*100
R_2_Broida = (1 - sum((dados_simulacao(:,2) - dados_simulacao(:,4)).^2)/sum((dados_simulacao(:,2) - mean(dados_simulacao(:,2))).^2))*100
R_2_Harriot = (1 - sum((dados_simulacao(:,2) - dados_simulacao(:,5)).^2)/sum((dados_simulacao(:,2) - mean(dados_simulacao(:,2))).^2))*100
R_2_Mollenkamp = (1 - sum((dados_simulacao(:,2) - dados_simulacao(:,6)).^2)/sum((dados_simulacao(:,2) - mean(dados_simulacao(:,2))).^2))*100