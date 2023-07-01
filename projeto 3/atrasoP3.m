numF=[5.56*197.75];
denF=[1 11.56 5.56*(1+197.75)];
T1=tf(numF,denF);
rlocus(T1);
