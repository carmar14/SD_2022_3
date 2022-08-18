clc
clear
close all

k=-3:3;
tao=0.2;

for i=1: length(k)
        h(i)=tf(k(i),[tao 1]);    
end

figure
for i=1:length(k)
   step(-0.5*h(i))
   hold on  
end
legend('h1','h2','h3','h4','h5','h6','h7')


k=5;
tao=0.2:0.5:4;

for i=1: length(tao)
        h(i)=tf(k,[tao(i) 1]);    
end

figure
for i=1:length(tao)
   step(-0.5*h(i))
   hold on  
end
legend('h1','h2','h3','h4','h5','h6','h7','h8')

figure
for i=1:length(tao)
   pzmap(h(i))
   hold on  
end
legend('h1','h2','h3','h4','h5','h6','h7','h8')