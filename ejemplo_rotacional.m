%Codigo sistema rotacional dos ejes(resortes rotacionales) y dos discos de
%inercia I1 e I2

clear
clc
close all

%Parametros del sistema
I1=10;I2=10;K1=10;K2=10;

%Función de transferencia

h1=tf([I2 0 K2],[I1*I2 0 I2*K1+I1*K2+I2*K2 0 K1*K2]); %theta1/T
[p z]=pzmap(h1)

h2=tf([K2],[I1*I2 0 I2*K1+I1*K2+I2*K2 0 K1*K2]); %theta2/T
[p z]=pzmap(h2)

subplot(2,1,1)
step(h1,'b')
xlim([0 100])
ylabel('\theta_1')
subplot(2,1,2)
step(h2,'b')
xlim([0 100])
ylabel('\theta_2')

%Variables de estado: u=T,x1=theta1, x2=theta1punto,x3=theta2, x4=theta2punto
A=[0 1 0 0;
   -(K2+K1)/I1 0 K2/I1 0;
   0 0 0 1;
   K2/I2 0 -K2/I2 0];
B=[0 1/I1 0 0]';
C=[1 zeros(1,3);
   zeros(1,2) 1 0];
D=zeros(2,1);


sis=ss(A,B,C,D);

figure
step(sis)
xlim([0 100])
