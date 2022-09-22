clc
clear
close all

R=1e3;
C1=20e-6;
C2=10e-6;
L=10e-3; 

h=tf(1,[R*L*C1*C2 L*(C1+C2) R*C2 1]);

figure
pzmap(h)

A=[-1/(R*C1) 1/(R*C1) 1/C1;
   1/(R*C2) -1/(R*C2) 0;
   -1/L 0 0];
B=[0;0;1/L];
C=[0 1 0];
D= 0;
sis=ss(A,B,C,D);
figure
step(sis,'r')
hold on
step(h,'.k')