clc; clear all; close all;
N=100;

% x1 = [zeros(1,N); zeros(1,N)-0.2*cos((0+1/N:1/N:1)*pi); ones(1,N)-0.2*cos((0+1/N:1/N:1)*pi); ones(1,N); zeros(1,N)];
x1 = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
y1 = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)];

x2 = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
y2 = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)].*-1+2.3;



figure
for i=1:N
pause(0.01)
clear("figure");
plot(x1(:,i),y1(:,i),'r', 'LineWidth',2)
hold on
plot(x2(:,i),y2(:,i),'b', 'LineWidth',2)
hold off
xlim([-0.2 1.2])
ylim([-0.1 2.5])
title('')
drawnow;
end