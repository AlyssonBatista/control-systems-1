A2 = [-2-2.73i;-2+2.73i];
num2 = [23.88];
den2 = [1 4 2.9391];
sys2 = tf (num2, den2);
 opt = stepDataOptions('StepAmplitude',1);
figure()
title('Gráfico do LGR');
rlocus(sys2,'r'), hold on, compass(real(A2),imag(A2), 'r') ;
hold on
legend('Sistema 4')
grid
hold off
