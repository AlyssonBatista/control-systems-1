% Instituto Federal da Paraíba
% Data: 31/04/2023
% Ademar Gonçalves da Costa Júnior
% Sistemas de Controle I
% Projeto 3 - Sistemas de Controle I
% Grupo 3: Alysson, Fabrício,Gabriel


close all
clear all

%##########################################################################
%##########################################################################
 
% 1. Considerando a inserção de um ganho K na malha direta, e uma realimentação
% unitária para o sistema em malha fechada, esbocem manualmente o LGR do sistema
% em malha fechada (deve ser apresentado todos os cálculos para este esboço como
% justificativa);

% Função de transferência do sistema em malha aberta

numA = [5.55];
denA = [1 11.55 5.55];
G = tf(numA, denA);
figure('Units', 'inches', 'Position', [0 3.1 5 5]);
rlocus(G);
pole(G);
title('Lugar das raízes para malha aberta item 1');
grid off;
hold on;
pause(0.01)

%##########################################################################
%##########################################################################
 
% 2. Com a premissa de projeto de overshoot máximo permitido de 12% e tempo de
% estabelecimento, no critério de 2%, de 5 segundos, determinem o valor de K para estes
% polos especificados;

% Definir overshoot máximo permitido e tempo de estabelecimento desejado
OS_max = 0.12; % 12% de overshoot máximo permitido
Ts_desired = 5; % Tempo de estabelecimento desejado (2% de critério)

% Calcular o coeficiente de amortecimento a partir do overshoot máximo permitido
zeta = -log(OS_max) / sqrt(pi^2 + log(OS_max)^2);

% Calcular a frequência natural não amortecida a partir do tempo de estabelecimento desejado
omega_n = 4 / (zeta * Ts_desired);

% Determinar o valor de K
K = omega_n^2;

% Exibir os resultados
disp(['Valor de K: ' num2str(K)]);
disp(['Coeficiente de amortecimento (\zeta): ' num2str(zeta)]);
disp(['Frequência natural não amortecida (\omega_n): ' num2str(omega_n)]);

figure('Units', 'inches', 'Position', [5 3.1 6 5])  
tempo = 0:0.001:10;
nume1 = [5.55*2.2271];
poly1 = [1 1.6 2.04423];
sistema=tf(nume1,poly1);
step(sistema,tempo);
hold on
degrau = tempo;
degrau(1,:) = (1);
plot(tempo,degrau,'r');
grid off

title('Comportamento dinâmico do sistema em malha fechada item 2 ');
xlabel('Eixo Real');
ylabel('Eixo Imaginário');
hold on

figure('Units', 'inches', 'Position', [0 1.5 5 5])
rlocus(sistema);
title('Lugar das raízes para malha fechada item 2');
grid off
pause(0.01)
%##########################################################################
%##########################################################################
 
% Com a mesma premissa do item anterior (overshoot máximo permitido de 12% e
% tempo de estabelecimento, no critério de 2%, de 5 segundos), projetem os compensadores
% pelas técnicas de avanço de fase (por condição de fase/ganho e análise direta), atraso de
% fase, e avanço e atraso de fase. O erro em regime permanente permitido será de 0,5% para
% o sistema em malha fechada.

time = 0:0.001:5;

num1_3a = [5.56*1];
den1_3a = [1 11.56 5.56*(1+1)];
f1 = tf(num1_3a, den1_3a);

num2_3b = [5.56*197.75];
den2_3b = [1 11.56 5.56*(1+197.75)];
f2 = tf(num2_3b,den2_3b);
% numerador da planta
num=5.56;

% denominador da planta
den=[1 11.56 5.56]

% funcao de transferencia da planta
sys=tf(num,den);

%% funcao de transferencia de malha fechada (com indicacao de polos. O sistema nao tem zeros)
     
numF=[5.56*197.75];
denF=[1 11.56 5.56*(1+197.75)];
T1=tf(numF,denF);
     
disp('polos em malha fechada do sistema original:')
pole(T1)

% resposta ao degrau em malha fechada do sistema original
to=0:0.01:10;
yo=step(T1,to);

% sobressinal em %
disp('sobressinal em % do sistema original:')
(max(yo)-yo(end))*100/yo(end)

% erro em estado estacionario
disp('erro em estado estacionario do sistema original:')
1-yo(end)

%% Compensador por atraso 
 
% funcao de transferencia da planta
sys=tf(num,den);

p=0.00575;
% pelas restricoes de ganho chega-se a
z=p*197.75;

% a condicao de modulo para ter polos de mf em -0.8+-j1.185 resulta em
A1 = sqrt(1.185^2+(11.05-0.8)^2);
A2 = sqrt(1.185^2+(0.8-0.5)^2);
A3 = sqrt(1.185^2+(0.8-z)^2);
B1 = sqrt(1.185^2+(A2-0.8)^2);
Kc = (A1*A2*A3)/(5.56*B1)


numc=Kc*[1 z];
denc=[1 p];
C=tf(numc,denc);

% funcao de transferencia de ramo direto
CG=series(C,sys)

% funcao de transferencia de malha fechada (indicacao de polos e zeros)
T2=CG/(1+CG);

figure('Units', 'inches', 'Position', [5 1 6 5]);
step(time,T2);
hold on
degrau = time;
degrau(1,:) = (1);
plot(time,degrau,'r');
title('Comportamento dinâmico do sistema em malha fechada do item 3');
xlabel('Eixo Real');
ylabel('Eixo Imaginário');

disp('polos em malha fechada com controlador em atraso de fase:')
pole(T2)
disp('zero em malha fechada com controlador em atraso de fase:')
zero(T2)

t2=0:0.01:8;

% resposta ao degrau unitario
y2=step(t2,T2);
 
% sobressinal em %
disp('sobressinal em % do sistema com controlador em atraso de fase:')
(max(y2)-y2(end))*100/y2(end)

% erro em estado estacionario
disp('erro em estado estacionario do sistema com controlador em atraso de fase:')
1-y2(end)

% Lugar das raizes do sistema com compensador

figure('Units', 'inches', 'Position', [0 0 5 5])
rlocus(CG)
title('Lugar das raízes para malha fechada do item 3');
axis([-11 1 -4 4])

figure('Units', 'inches', 'Position', [10.96 3.1 5 5]); 
%step(to,T1);
hold on;
step(to,T2);
%step(to,sys);

degrau = to;
degrau(1,:) = (1);
%plot(to,degrau,'r');

title('Simulação do compensador por atraso do projeto 3');
xlabel('Tempo');
ylabel('Amplitude(V)');
legend('Malha fechada com compensador por atraso','Malha aberta','Entrada degrau1');