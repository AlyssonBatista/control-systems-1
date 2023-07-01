

%%
figure('Position',[100,100,800,600])
t = tout;

%FT Malha fechada original
figure('Position',[100,100,800,600])
plot(t, figuras(:,1),'LineWidth',1.5)
title('Sistema sem compesador')
xlabel('Tempo(s)')
ylabel('Amplitude')
grid on

%FT Malha fechada com ganho k
figure('Position',[100,100,800,600])
plot(t, figuras(:,2),'LineWidth',1.5)
title('Sistema com ganho k')
xlabel('Tempo(s)')
ylabel('Amplitude')
grid on

%FT Avanço
figure('Position',[100,100,800,600])
plot(t, figuras(:,3),'LineWidth',1.5)  
title('Sistema com Compensador por Avanço')
xlabel('Tempo(s)')
ylabel('Amplitude')
grid on

%FT Atraso
figure('Position',[100,100,800,600])
plot(t, figuras(:,4),'LineWidth',1.5)
title('Sistema com Compensador por Atraso')
xlabel('Tempo(s)')
ylabel('Amplitude')
grid on

%FT Avanço + Atraso
figure('Position',[100,100,800,600])
plot(tout, figuras(:,5),'LineWidth',1.5)
title('Sistema com Compensador por Avanço e Atraso')
xlabel('Tempo(s)')
ylabel('Amplitude')
grid on

%Comparação dos Compensadores
figure('Position',[100,100,800,600])
plot(t, figuras(:,1),'-','LineWidth',1.5)

hold on
plot(t, figuras(:,2),':','LineWidth',1.5)
plot(t, figuras(:,3),'-.','LineWidth',1.5)
plot(t, figuras(:,4),'--','LineWidth',1.5)
plot(t, figuras(:,5),':','LineWidth',1.5)
hold off

title('Comparação dos Compensadores')
xlabel('Tempo(s)')
ylabel('Amplitude')
grid on
legend('Sem Compensador','Com ganho k','Compensador por Avanço','Compensador por Atraso','Compensador por Avanço e Atraso')


