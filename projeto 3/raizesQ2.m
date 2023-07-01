%{
inicio = 0;
fim = 15;
figure
for k = inicio:1:fim
    % Defina a função de transferência do sistema
    num = [5.55*k];
    den = [1 11.55 5.55*(1+k)];
    G = tf(num, den);

    num2 = [5.55*k];
    den2 = [1 1.6 2.04423];
    G2 = tf(num2, den2);
        
    % Plote o lugar das raízes
    rlocus(G2);
    rlocus(G);
    hold on;  % Mantém o gráfico atual

    % Obtenha os polos da função de transferência
    p = pole(G2);
    p2 = pole(G);
   
    % Plote os polos no mesmo gráfico
    scatter(real(p2), imag(p2), 'rx');
    hold on;
    scatter(real(p), imag(p), 'rx');
    hold off;  % Libera o gráfico para novos plots

    % Personalize o gráfico
    title(['Gráfico para k = ', num2str(k)]);
    xlabel('Eixo Real');
    ylabel('Eixo Imaginário');
    legend('Lugar das Raízes', 'Polos');
    grid on;
    pause(0.001);
    
       
% Segundo subplot
    
    tempo = 0:0.001:2;
        nume=[5.55*k];
        poly = [1 1.6 2.0423];
        sistema=tf(nume,poly);
        f3 = step(sistema,tempo);
      
        plot(tempo,f3);
        
       
        title(['Gráfico para k = ', num2str(k)]);
        xlabel('x');
        ylabel('y');
        grid on;
        pause(1); % Pausa de 1 segundo para ver o gráfico
end


%}

%{
k=10;
% Defina a função de transferência do sistema
num = [5.55];
den = [1 11.55 5.55];
G = tf(num, den);

% Defina um vetor de ganhos
K = 0:k:10;

% Plote o lugar das raízes para diferentes valores de ganho
rlocus(G, K);

%}

%{

inicio = 0;
fim = 50;

for k = inicio:5:fim
    % Verifique a condição
   
      
        tempo = 0:0.001:2;
        nume=[5.55*k];
        poly = [1 11.55 5.55*(1+k)];
        sistema=tf(nume,poly)
        f3 = step(sistema,tempo)
      
        
        rlocus(f3,K);
        title(['Gráfico para k = ', num2str(k)]);
        xlabel('x');
        ylabel('y');
        grid off;
        pause(1); % Pausa de 1 segundo para ver o gráfico
end

%}


%33333333333333333333333333333333333333333333333333333333333333333333333


% Defina os parâmetros do loop

%{
% Loop para verificar a condição
figure
for k = inicio:1:fim
    % Verifique a condição
   
      
        tempo = 0:0.001:2;
        nume=[5.55*k];
        poly = [1 11.55 5.55*(1+k)];
        sistema=tf(nume,poly);
        f3 = step(sistema,tempo);
      
        plot(tempo,f3);
        
       
        title(['Gráfico para k = ', num2str(k)]);
        xlabel('x');
        ylabel('y');
        grid on;
        pause(1); % Pausa de 1 segundo para ver o gráfico
end


%}

%{
pol=[1 1.6 2.04423];
raizes = roots(pol)

%}
 
time = 0:0.001:10;

figure()
nu = [10.7 21.1539];
de = [1 11.56 5.640 0.05525];
sist = tf(nu,de)
rlocus(sist);
pole(sist)

figure()
step(time,sist/(1+sist));
 


 

