clc
clear 
close all

%------parametros----
R=1e6;
L=1e6;
C=1e-6;

k=L;
e= 0.5*sqrt(L/C)/R;
wn= sqrt(1/(L*C));
h=tf([R*L 0],[R*L*C L R]);
hc=tf([k*wn^2 0], [1 2*e*wn wn^2]);
step(h,'.b')
hold on
step(hc,'--r')
legend('ejercicio', 'canónica')
figure
pzmap(h)