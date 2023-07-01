72% de armazenamento usado … Você consome armazenamento quando salva arquivos no Drive, faz backup no Google Fotos e envia ou recebe e-mails do Gmail
% Instituto Federal da Paraíba
% Data: 16/04/2021
% Ademar Gonçalves da Costa Júnior
% Sistemas de Controle I
% Projeto 2 - Sistemas de Controle I
% Grupo 9: Cleiston, Everton e Yuri

% Circuito 4:
% R1 = 4,7 kohms; R2 = 10 kohms; R3 = 180 ohms; R4 = 220 ohms;
% C1 = C2 = 33 uF; Degrau com amplitude de 0,7

close all
clear all

% sistema original
num = [-23.88];
den = [1 6.48 19.54];
%-----------------------------------------------------------------------------------
% Caracteristica do sistema de segunda ordem do circuito 4
omegan = sqrt(den(3));              % frequência natural
csi = den(2)/(2*omegan);            % coeficiente de amortecimento
Ts = 4/(csi*omegan);                % tempo de estabelecimento
Tp = pi/(omegan*sqrt(1-csi^2));     % tempo de pico
overshoot = 100*exp((-csi*pi)/sqrt(1-csi^2)); % overshoot ou sobressinal
raizes_den = roots(den);            % raízes do denominador 
%-----------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------
disp(' '); disp('DIGITE QUALQUER TECLA PARA CONTINUAR'); disp(' ');
pause;
disp('Omega_n:'); disp(omegan);
disp('csi:'); disp(csi);
disp('Tr:'); disp(Ts);
disp('Tp:'); disp(Tp);
disp('Overshoot:'); disp(overshoot);
disp('Raízes_denominador:'); disp(raizes_den);
%-----------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------
disp(' '); disp('DIGITE QUALQUER TECLA PARA CONTINUAR'); disp(' ');
pause
%-----------------------------------------------------------------------------------
% gerar gráfico
sysc = tf(num,den);                 % objeto função de transferência
 opt = stepDataOptions('StepAmplitude',0.7);
[y,t] = step(sysc);                 % gera o gráfico para um degrau UNITÁRIO
figure()                            % cria objeto figura
title('Gráfico da função');
plot(t,y)                           % gera gráfico
xlabel('tempo(s)')                  % título do eixo x
ylabel('Amplitude do sistema')      % título do eixo y
grid                                % coloca grid no gráfico
%-----------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------
disp(' '); disp('DIGITE QUALQUER TECLA PARA CONTINUAR'); disp(' ');
pause

% Sistema 4 - Acréscimo de um polo ao eixo real, 
% afastado dos polos dominantes (sistema original)
%-----------------------------------------------------------------------------------
poly_den4 = conv(den,[1 17]);
num_4 = poly_den4(4);

% gerar gráfico
sysc4 = tf(num_4,poly_den4);    % objeto função de transferência
[y4,t4] = step(sysc4,opt);

figure()
plot(t,y), hold on, plot(t4,y4)
title('Acréscimo de um polo ao eixo real')
xlabel('tempo(s)')
ylabel('Amplitude')
grid 
legend('Sistema original', 'Sistema 4')

% Sistema 5 - sistema original com acréscimo de zero (semiplano da direita em s)
%-----------------------------------------------------------------------------------
num_5 = [-16.71];
% gerar gráfico
sysc5 = tf(num_5,den);  % objeto função de transferência
[y5,t5] = step(sysc5,opt);
figure()
plot(t,y), hold on, plot(t5,y5)
title('Acréscimo de zero')
xlabel('tempo(s)')
ylabel('Amplitude')
grid
legend('Sistema original', 'Sistema 5')

%-----------------------------------------------------------------------------------
% ganho K antes do sistema dinâmico
% (o sistema em malha fechada apresente overshoot máximo de 7%)
%-----------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------
disp(' '); disp('DIGITE QUALQUER TECLA PARA CONTINUAR'); disp(' ');
pause

% para um overshoot de 7%, temos:
k_ov = -0.235
% num_e = [k_ov*1.222*19.54];
% poly_den_e = [1 6.48 19.54-k_ov*1.222*19.54];
num_e = [-5.6113];
poly_den_e = [1 6.48 25.15];

% gerar gráfico
sysc6 = tf(num_e,poly_den_e);    % objeto função de transferência
[y6,t6] = step(sysc6,opt);
figure()
plot(t,y), hold on, plot(t6,y6)
title('Comparação do sistema dinâmico com ganho K anterior e com overshoot fixo de 7% ');
xlabel('tempo(s)')
ylabel('Amplitude')
grid on
legend('Sistema original', 'Sistema 6')
%-----------------------------------------------------------------------------------
% diagrama de polos e zeros do sistema em malha fechada, comparando
% com o diagrama de polos e zeros em malha aberta
%-----------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------
disp(' '); disp('DIGITE QUALQUER TECLA PARA CONTINUAR'); disp(' ');
pause
% Variáveis dos polos, zeros e ganho do sistema malha aberta
z_a = []; p_a = [-3.24+3.006*i, -3.24-3.006*i]; g_a = -23.87788 ;
% Variáveis dos polos, zeros e ganho do sistema malha fechada
z_f = []; p_f = [0.612, -7.0919]; g_f = -23.87788 ;
disp(' '); disp('>>>> Criando o diagrama de polos e zeros do sistema em malha aberta...'); disp(' ');
%  plotoptions = pzoptions;
%  Hzpk_teste = pzplot(zpk(z_a,p_a,g_a),plotoptions);
% pzmap(Hzpk_teste);
Hzpk_a = zpk(z_a,p_a,g_a)
disp(' '); disp('>>>> Criando o diagrama de polos e zeros do sistema em malha fechada...'); disp(' ');
Hzpk_f = zpk(z_f,p_f,g_f)
% Plotando polos e zeros no plano s
pzmap(Hzpk_a), hold on, pzmap(Hzpk_f);
% pzmap(Hzpk_a);
% pzmap(Hzpk_f);
title('Comparativo Mapa de Polos e Zeros dos sistemas em malha aberta e Malha fechada ');
grid on
xlabel('Real(s)'); ylabel('Imag(s)');
%-----------------------------------------------------------------------------------
% Determine a faixa de valores do ganho K do sistema em malha fechada
% para que o sistema seja estável, instável e marginalmente estável
%-----------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------
disp(' '); disp('DIGITE QUALQUER TECLA PARA CONTINUAR'); disp(' ');
pause

% Critério de Estabilidade Routh-Hurwitz:
entrada = input('Você quer calcular uma nova tabela de Routh-Hurwitz S/N ', 's');
if entrada == 's' || entrada == 'S'
    
    % Pega coef do vetor e constroi as duas primeiras linhas
    coeffVector = input('Digite os coeficientes do sistema:[an an-1 an-2 ... a0] = ');
    ceoffLength = length(coeffVector);
    rhTableColumn = round(ceoffLength/2);
    %  Inicializa a tabela Routh-Hurwitz com vetor nulo
    rhTable = zeros(ceoffLength,rhTableColumn);
    %  Computa a primeira linha da tabela
    rhTable(1,:) = coeffVector(1,1:2:ceoffLength);
    %  Verifica se o comprimento do vetor de coeficientes é par ou ímpar
    if (rem(ceoffLength,2) ~= 0)
        % se par, a segunda linha da tabela será
        rhTable(2,1:rhTableColumn - 1) = coeffVector(1,2:2:ceoffLength);
    else
        % se impar, a segunda linha da tabela será
        rhTable(2,:) = coeffVector(1,2:2:ceoffLength);
    end
    %% Calcular as linhas da tabela de Routh-Hurwitz
    % Define epss como um valor pequeno

    epss = 0.01;
    %  Calcula outros elementos da tabela
    for i = 3:ceoffLength

        %  caso especial: linhas de zeros
        if rhTable(i-1,:) == 0
            order = (ceoffLength - i);
            cnt1 = 0;
            cnt2 = 1;
            for j = 1:rhTableColumn - 1
                rhTable(i-1,j) = (order - cnt1) * rhTable(i-2,cnt2);
                cnt2 = cnt2 + 1;
                cnt1 = cnt1 + 2;
            end
        end

        for j = 1:rhTableColumn - 1
            %  fprimeiro elemento da linha superior
            firstElemUpperRow = rhTable(i-1,1);

            %  computa cada elemento da tabela
            rhTable(i,j) = ((rhTable(i-1,1) * rhTable(i-2,j+1)) - ....
                (rhTable(i-2,1) * rhTable(i-1,j+1))) / firstElemUpperRow;
        end


        %  caso especial: zero na primeira coluna
        if rhTable(i,1) == 0
            rhTable(i,1) = epss;
        end
    end
    %% Calcula o número de pólos do lado direito (pólos instáveis)
    % Inicializa pólos instáveis ??com zero
    unstablePoles = 0;
    %   Verifica a mudança do sinal
    for i = 1:ceoffLength - 1
        if sign(rhTable(i,1)) * sign(rhTable(i+1,1)) == -1
            unstablePoles = unstablePoles + 1;
        end
    end
    %   Print dados na command window
    fprintf('\n Tabela Routh-Hurwitz:\n')
    rhTable
    %   Printa o resultado
    if unstablePoles == 0
        fprintf('~~~~~> É um sistema estável! <~~~~~\n')
    else
        fprintf('~~~~~> É um sistema instável! <~~~~~\n')
    end
    fprintf('\n Number of right hand side poles =%2.0f\n',unstablePoles)
    reply = input('Você quer ver as raízes do sistema? Y/N ', 's');
    if reply == 'y' || reply == 'Y'
        sysRoots = roots(coeffVector);
        fprintf('\n Given polynomial coefficients roots :\n')
        sysRoots
    end    
end

disp('Já que não deseja calcular uma nova tabela Routh-Hurwitz...');
k_s = input('Informe um valor de K para determinar a Sensibilidade do Sistema: ');
if k_s == 0.81825
        fprintf('~~~~~> É um sistema marginalmente estavel! <~~~~~\n')
end
if k_s > 0.81825
        fprintf('~~~~~> É um sistema instável! <~~~~~\n')
end
if k_s < 0.81825
        fprintf('~~~~~> É um sistema estável! <~~~~~\n')
end
%-----------------------------------------------------------------------------------
% Constantes de erro estático e o erro em regime permanente para a entradas do tipo degrau
% (amplitude dada para cada grupo) e rampa unitária (ver tema: erro em regime permanente);
%-----------------------------------------------------------------------------------
%-----------------------------------------------------------------------------------
disp(' '); disp('DIGITE QUALQUER TECLA PARA CONTINUAR'); disp(' ');
pause
syms s
% Aplicado o degrau R(s)=0.7/s
kp = vpa(round(1000*limit(5.6118/(s^2+6.48*s+19.54),s,0))/1000);  %Constante de posição
if(1+kp == 0)
    disp('O erro em regime permanente quando aplicado o degrau = infinito');
else
    ErD = vpa(round(10000*1*0.7/(1+kp))/10000);
    disp('o erro em regime permanente quando aplicado o degrau é:');
    disp(ErD);
end
disp('A constante de posição é :');
disp(kp);
% Aplicando a Rampa unitaria R(s)=1/s^2
kv = vpa(round(1000*limit(s*5.6118/(s^2+6.48*s+19.54),s,0))/1000);  %Constande de velocidade
if(kv == 0)
    disp('o erro em regime permanente quando aplicado a rampa = infinito');
else
ErR = 1./(kv); % erro para a rampa
disp('o erro em regime permanente quando amplicado a rampa é:');
disp(ErR);
end
disp('A constante de velocidade é :');
disp(kv);
ka = vpa(round(1000*limit(s^2*5.6118/(s^2+6.48*s+19.54),s,0))/1000);  %Constante de Aceleração
disp('A constante de aceleração é :');
disp(ka);