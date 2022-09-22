clc
clear
close all

%--------parametros---------
R1 = -220;
R2 = 2e3;
R3 = 200;

C1=1000e-6;
C2=1000e-6;
%Funcion de transferencia

n1 = -R3;
d1 = [R1*R2*R3*C1*C2 C2*(R2*R3 + R3*R1 + R1*R2) R1];

G1 = tf(n1,d1)

%------espacio de estado-----


A=[-(1/(C1*R1))-(1/(C1*R3))-(1/(C1*R2)) -(1/(C1*R3));
    
   (1/(C2*R2)) 0];

B=[(1/(C1*R1)) 0]';
C=[0 -1];
D=0;
sis=ss(A,B,C,D);
step(sis,'.k')
hold on
step(G1,'r')
legend('tf','ss')

p=eig(A)
p2=pole(G1)

zero(G1)

figure
pzmap(G1)



