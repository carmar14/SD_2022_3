clc
clear
close all

Km=5;
Ki=Km;
L=100e-3;
% L=1e-3; %Comportamiento similar debido a que L<<R
J=0.01;
R=10; %10
Bm=0.15;

h= tf(Km,[L*J (R*J+L*Bm) R*Bm+Ki*Km]);
h_simp=tf(Km,[R*J R*Bm+Ki*Km])
step(h,'k')
hold on
step(h_simp,'r')
ylabel('$\dot{\theta}(rad/seg)$','Interpreter','latex')
legend('Real','Simplificado')
title('Velocidad angular de un motor DC')
figure
pzmap(h,'k')
hold on
pzmap(h_simp,'r')
legend('Real','Simplificado')

h2= tf(Km,[L*J (R*J+L*Bm) R*Bm+Ki*Km 0]);
figure
step(h2);
xlim([0 0.1])
ylabel('$\theta(rad)$','Interpreter','latex')
title('Posición angular de un motor DC')
figure
pzmap(h2)