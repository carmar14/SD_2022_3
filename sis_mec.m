clc
clear
close all

%-------parámetros------
k=100;
b=10;
m=5;

h=tf(1,[m b k]);

A=[0 1;
   -k/m -b/m];
B=[0 1/m]';
C=[1 0];
D=0;
hs= ss(A,B,C,D);

step(15*h, '.k');
hold on
step(15*hs,'--r');
legend('tf','ss')
ylabel('x(m)')
xlabel('tiempo')

figure
pzmap(h)