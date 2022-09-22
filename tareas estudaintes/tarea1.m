clc
clear
close all

R1=332.4737;
R2=11.2e3;
R3=1e3;
C1=470e-6;
C2=1e-6;
h=tf(-R3,[R1*R2*R3*C2*C1 C2*(R1*R2+R1*R3+R2*R3) R1]);
pzmap (h)

figure
step (h,'k')

%---Variable de estado---
R1=332.4737;
R2=11.2e3;
R3=1e3;
C1=470e-6;
C2=1e-6;

A=[((-1/(R1*C1))+(-1/(R3*C1))+(-1/(R2*C1))) -1/(R3*C1);
    1/(R2*C2) 0];
B=[1/(R1*C1); 0];
C=[0 -1];
D=0;
sis = ss(A,B,C,D);
hold on
step (sis,'.r');
legend('tf','ss')
p=eig(A);