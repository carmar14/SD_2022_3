close all
clear
clc
%valores de resistencias y capacitores para polos complejos conjugados
R1=100;
R2=100;
R3=100;
c1=1000*(10e-6);
c2=100*(10e-6);

%Funcion de transferencia
n=-R3;
a=R1*R2*R3*c1*c2;
b=c2*((R1*R2)+(R1*R3)+(R2*R3));
c=R1;
h=tf(n,[a, b, c]);

%representacion por espacio de estados
A=[(-(R1*R2+R1*R3+R2*R3)/(R1*R2*R3*c1)), (1/(R3*c1));
    (-1/(R2*c2)), 0];
B=[1/(R1*c1); 0];
C=[0, 1];
D=0;
sis=ss(A,B,C,D);
eig(A)

%graficos
figure
step(h)
title('Funcion de transferencia')
xlabel('Tiempo [s]')
ylabel('Vo   [ V ]')
figure
step(sis)
title('Espacio de estados')
xlabel('Tiempo [s]')
ylabel('Vo   [ V ]')
figure
pzmap(h)
title('Mapa de polos y ceros')

