clc
clear
close all

%--------parametros---------
R=1e3;
L=10e-3;
C=1e-6;

h=tf(1,[L*C R*C 1]);

pzmap(h)

figure
step(5*h,'k')

%------espacio de estado-----
A=[0 1/C;
   -1/L -R/L];
B=[0 1/L]';
C=[1 0];
D=0;
sis=ss(A,B,C,D);
hold on
step(5*sis,'.r');
legend('tf','ss')
p=eig(A);

