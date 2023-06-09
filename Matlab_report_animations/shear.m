clc; clear all; close all;
N=100;

% x1 = [zeros(1,N); zeros(1,N)-0.2*cos((0+1/N:1/N:1)*pi); ones(1,N)-0.2*cos((0+1/N:1/N:1)*pi); ones(1,N); zeros(1,N)];
x1 = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
y1 = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)];

x2 = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
y2 = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)].*-1+2.3;

x1clamp = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y1clamp = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)]+2.33;

%expectation
x1_exp = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
y1_exp = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)];

x2_exp = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
y2_exp = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)].*-1+2.3;

%solution
x1_sol = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
y1_sol = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)];

x2_sol = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
y2_sol = [zeros(1,N)-0.2*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi)-0.2*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi)-0.2*sin((0+1/N:1/N:1)*pi); zeros(1,N)-0.2*sin((0+1/N:1/N:1)*pi); zeros(1,N)-0.2*sin((0+1/N:1/N:1)*pi)].*-1+2.3;

x1clamp_sol = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y1clamp_sol = [zeros(1,N); ones(1,N)-0.2*sin((0+1/N:1/N:1)*pi); ones(1,N)-0.2*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)]*-1+3.33;

%% ideal
figure
for i=1:N
pause(0.01)
clear("figure");
plot(x1_exp(:,i),y1_exp(:,i),'b', 'LineWidth',2)
hold on
yline(1.3, '--')
yline(1, '--')
plot(x2_exp(:,i),y2_exp(:,i),'b', 'LineWidth',2)
plot(x1clamp(:,i),y1clamp(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.2 1.2])
ylim([-0.1 3.5])
title('Expectation with clamping \alpha = \pi/2')
drawnow;
end

%% problem
figure
for i=1:N
pause(0.01)
clear("figure");
plot(x1(:,i),y1(:,i),'b', 'LineWidth',2)
hold on
yline(1.3, '--')
yline(1, '--')
plot(x2(:,i),y2(:,i),'b', 'LineWidth',2)
plot(x1clamp(:,i),y1clamp(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.2 1.2])
ylim([-0.1 3.5])
title('Current problem with clamping \alpha = \pi/2')
drawnow;
end

%% together
figure
for i=1:N
pause(0.1)
clear("figure");
plot(x1_exp(:,i),y1_exp(:,i),'b', 'LineWidth',2)
hold on
plot(x1(:,i),y1(:,i),'r--', 'LineWidth',2)
yline(1.3, '--')
yline(1, '--')
plot(x2_exp(:,i),y2_exp(:,i),'b', 'LineWidth',2)
plot(x2(:,i),y2(:,i),'r--', 'LineWidth',2)
plot(x1clamp(:,i),y1clamp(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.2 1.2])
ylim([-0.1 3.5])
legend('Ideal','Expectation')
title('Expectation with clamping \alpha = \pi/2')
drawnow;
end


%% solution
figure
for i=1:N
pause(0.01)
clear("figure");
plot(x1_sol(:,i),y1_sol(:,i),'b', 'LineWidth',2)
hold on
yline(1.3, '--')
yline(1, '--')
yline(y1_sol(3,i), ':')
yline(y2_sol(3,i), ':')
plot(x2_sol(:,i),y2_sol(:,i),'b', 'LineWidth',2)
plot(x1clamp_sol(:,i),y1clamp_sol(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.2 1.2])
ylim([-0.1 3.5])
title('Current problem with clamping \alpha = \pi/2')
drawnow;
end

