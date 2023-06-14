clc; clear all; close all;

N=300;

% x1 = [zeros(1,N); zeros(1,N)-0.2*cos((0+1/N:1/N:1)*pi); ones(1,N)-0.2*cos((0+1/N:1/N:1)*pi); ones(1,N); zeros(1,N)];
 
shear_movement = [(0.2-0.4/N*6:-0.4/N*6:-0.2) (-0.2+0.4/N/5*6:0.4/N/5*6:0.2)];
sine_added = [zeros(1,N/3) 0.05*sin((0+1/N*2:1/N*2:1)*2*pi) zeros(1,N/6)];
movement_clamp = [-1*ones(1,N/6) -1+1/N*3:2/N*3:1-1/N*3 ones(1,N/6) 1-1/N*3:-2/N*3:-1+1/N*3]*.1;

% figure
% plot(shear_movement)


%set lower red and blue
x1 = [zeros(1,N); zeros(1,N)+shear_movement; ones(1,N)+shear_movement; ones(1,N); zeros(1,N)]; 
y1 = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)]+movement_clamp;

% x1_set2 = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
% y1_set2 = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)];
x1_set2 = [x1(:,N/2+1:N),x1(:,1:N/2)];
y1_set2 = [y1(:,N/2+1:N),y1(:,1:N/2)]-[movement_clamp(N/2+1:N) movement_clamp(1:N/2)];

x1_sol = [zeros(1,N); zeros(1,N)+shear_movement+sine_added; ones(1,N)+shear_movement+sine_added; ones(1,N); zeros(1,N)]; 
y1_sol = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)];

% x1_set2_sol = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2)-0.05*sin((0+1/N:1/N:1)*2*pi); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2)-0.05*sin((0+1/N:1/N:1)*2*pi); ones(1,N); zeros(1,N)]; 
% y1_set2_sol = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)];

x1_set2_sol = [x1_sol(:,N/2+1:N),x1_sol(:,1:N/2)];
y1_set2_sol = [y1_sol(:,N/2+1:N),y1_sol(:,1:N/2)];

x2 = x1;
y2 = y1.*-1+movement_clamp + 2.3;

x2_set2 = [x2(:,N/2+1:N),x2(:,1:N/2)];
y2_set2 = [y2(:,N/2+1:N),y2(:,1:N/2)]+movement_clamp;

x2_set2_sol = x1_set2_sol;
y2_set2_sol = y1_set2_sol.*-1 + 2.3;


% x2 = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
% y2 = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)].*-1+2.3;

x1clamp = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y1clamp = [zeros(1,N)+movement_clamp; ones(1,N); ones(1,N); zeros(1,N)+movement_clamp; zeros(1,N)+movement_clamp]+2.33;

x2clamp = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y2clamp = [zeros(1,N); ones(1,N)+movement_clamp; ones(1,N)+movement_clamp; zeros(1,N); zeros(1,N)]-1.03;


% %expectation
% x1_exp = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
% y1_exp = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)];
% 
% x2_exp = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
% y2_exp = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)].*-1+2.3;
% 
% %solution
% x1_sol = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
% y1_sol = [zeros(1,N); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)];
% 
% x2_sol = [zeros(1,N); zeros(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N)+(-0.2+0.4/N:0.4/N:0.2); ones(1,N); zeros(1,N)]; 
% y2_sol = [zeros(1,N)-0.2*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi)-0.2*sin((0+1/N:1/N:1)*pi); ones(1,N)+0.1*sin((0+1/N:1/N:1)*pi)-0.2*sin((0+1/N:1/N:1)*pi); zeros(1,N)-0.2*sin((0+1/N:1/N:1)*pi); zeros(1,N)-0.2*sin((0+1/N:1/N:1)*pi)].*-1+2.3;
% 
% x1clamp_sol = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
% y1clamp_sol = [zeros(1,N); ones(1,N)-0.2*sin((0+1/N:1/N:1)*pi); ones(1,N)-0.2*sin((0+1/N:1/N:1)*pi); zeros(1,N); zeros(1,N)]*-1+3.33;

%% test 1
figure
for x=1:2
for i=1:N
pause(0.02)
clear("figure");
plot(x1(:,i),y1(:,i),'b', 'LineWidth',2)
hold on
% yline(1.3, '--')
% yline(1, '--')
plot(x1_set2(:,i),y1_set2(:,i),'r--', 'LineWidth',2)
plot(x2(:,i),y2(:,i),'b', 'LineWidth',2)
plot(x2_set2(:,i),y2_set2(:,i),'r--', 'LineWidth',2)
plot(x1clamp(:,i),y1clamp(:,i),'m', 'LineWidth',2)
plot(x2clamp(:,i),y2clamp(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.3 1.3])
ylim([-1.1 3.4])
title('Clamping in theory with clamping \alpha = \pi')
drawnow;
end
end

