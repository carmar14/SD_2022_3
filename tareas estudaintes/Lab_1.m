clc; clear all; close all;

R1 =[1000 1000 1000];
R2 =[1000 1000 1000];
R3 =[1000 1000 1000];
C1 =[100e-6 4.7e-6 2.25e-6];
C2 =[4.7e-6 470e-6 1e-6]; 

for i=1:length(R1)
h(i) = tf([-R3(i)], [C1(i)*C2(i)*R1(i)*R2(i)*R3(i) C2(i)*(R1(i)*R2(i)+R1(i)*R3(i)+R2(i)*R3(i)) R1(i)]);
figure(1)
step(5*h(i));
hold on;

figure(2)
pzmap(h(i));
hold on;
end

figure(1)
legend ('subamoriguado', 'sobreamortiguado', 'criticamente amortiguado');
ylabel('Amplitud (V)');
xlabel('Tiempo (s)');
title('Step Response TF');
axis([0 8 -7 0.1]);

figure(2)
title('Mapa Polos y Ceros TF');
legend ('subamoriguado', 'sobreamortiguado', 'criticamente amortiguado');

for i=1:length(R1)
    A = [-(R3(i)*R2(i)+R1(i)*R2(i)+R1(i)*R3(i))/(C1(i)*R1(i)*R2(i)*R3(i)) -1/(C1(i)*R3(i))
    1/(C2(i)*R2(i)) 0];
    B = [1/(C1(i)*R1(i)) 0]';
    C = [0 -1];
    D = [0];
     
    sis(i) = ss(A, B, C, D);
    figure(3)
    step(5*sis(i));
    hold on;
end

figure (3)
legend ('subamoriguado', 'sobreamortiguado', 'criticamente amortiguado');
ylabel('Amplitud (V)');
xlabel('Tiempo (s)');
title('Step Response SS');
axis([0 8 -7 0.1]);
