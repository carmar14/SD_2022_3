clc
clear
close all

A = 6;
w = 240;
T = 2*pi/w; 
phi = pi;
t= 0:0.001:4*T;

x = A*sin(w*t+phi);
plot(t,x)