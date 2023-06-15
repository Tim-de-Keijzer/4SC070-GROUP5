clc; clear all; close all;

N=300;

% x1 = [zeros(1,N); zeros(1,N)-0.2*cos((0+1/N:1/N:1)*pi); ones(1,N)-0.2*cos((0+1/N:1/N:1)*pi); ones(1,N); zeros(1,N)];
 
shear_movement = [(0.2-0.4/N*6:-0.4/N*6:-0.2) (-0.2+0.4/N/5*6:0.4/N/5*6:0.2)];
sine_added = 0.5*[zeros(1,N/6) 0.05*sin((0+1/N*3:1/N*3:1)*2*pi) zeros(1,N/6) 0.05*sin((0+1/N*3:1/N*3:1)*2*pi)];
movement_clamp = [-1*ones(1,N/6) -1+1/N*3:2/N*3:1-1/N*3 ones(1,N/6) 1-1/N*3:-2/N*3:-1+1/N*3]*.1;
sine_clamp = -.5*[zeros(1,N/6) 0.05*sin((0+1/N*3:1/N*3:1)*2*pi) zeros(1,N/6) -0.05*sin((0+1/N*3:1/N*3:1)*2*pi)];


% figure
% plot(shear_movement)

% figure
% plot(sine_added)

%% normal
x1 = [zeros(1,N); zeros(1,N)+shear_movement; ones(1,N)+shear_movement; ones(1,N); zeros(1,N)]; 
y1 = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)]+movement_clamp;

x1_set2 = [x1(:,N/2+1:N),x1(:,1:N/2)];
y1_set2 = [y1(:,N/2+1:N),y1(:,1:N/2)]-[movement_clamp(N/2+1:N) movement_clamp(1:N/2)];

x2 = x1;
y2 = y1.*-1+movement_clamp + 2.3;

x2_set2 = [x2(:,N/2+1:N),x2(:,1:N/2)];
y2_set2 = [y2(:,N/2+1:N),y2(:,1:N/2)]+movement_clamp;

%% solution shear slow
x1_sol = [zeros(1,N); zeros(1,N)+shear_movement+sine_added; ones(1,N)+shear_movement+sine_added; ones(1,N); zeros(1,N)]; 
y1_sol = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)]+movement_clamp;

x1_set2_sol = [x1_sol(:,N/2+1:N),x1_sol(:,1:N/2)];
y1_set2_sol = [y1_sol(:,N/2+1:N),y1_sol(:,1:N/2)]-[movement_clamp(N/2+1:N) movement_clamp(1:N/2)];

x2_sol = x1_sol;
y2_sol = y1_sol.*-1+movement_clamp + 2.3;

x2_set2_sol = [x2_sol(:,N/2+1:N),x2_sol(:,1:N/2)];
y2_set2_sol = [y2_sol(:,N/2+1:N),y2_sol(:,1:N/2)]+movement_clamp;

%% solution shear fast
x1_sol2 = [zeros(1,N); zeros(1,N)+shear_movement-sine_added; ones(1,N)+shear_movement-sine_added; ones(1,N); zeros(1,N)]; 
y1_sol2 = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)]+movement_clamp;

x1_set2_sol2 = [x1_sol2(:,N/2+1:N),x1_sol2(:,1:N/2)];
y1_set2_sol2 = [y1_sol2(:,N/2+1:N),y1_sol2(:,1:N/2)]-[movement_clamp(N/2+1:N) movement_clamp(1:N/2)];

x2_sol2 = x1_sol2;
y2_sol2 = y1_sol2.*-1+movement_clamp + 2.3;

x2_set2_sol2 = [x2_sol2(:,N/2+1:N),x2_sol2(:,1:N/2)];
y2_set2_sol2 = [y2_sol2(:,N/2+1:N),y2_sol2(:,1:N/2)]+movement_clamp;

%% clamp fast

x1_sol3 = [zeros(1,N); zeros(1,N)+shear_movement; ones(1,N)+shear_movement; ones(1,N); zeros(1,N)]; 
y1_sol3 = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)]+movement_clamp+sine_clamp;

x1_set2_sol3 = [x1_sol3(:,N/2+1:N),x1_sol3(:,1:N/2)];
y1_set2_sol3 = [y1_sol3(:,N/2+1:N),y1_sol3(:,1:N/2)]-[movement_clamp(N/2+1:N) movement_clamp(1:N/2)]-[sine_clamp(N/2+1:N) sine_clamp(1:N/2)];

x2_sol3 = x1_sol3;
y2_sol3 = y1_sol3.*-1+movement_clamp+sine_clamp + 2.3;

x2_set2_sol3 = [x2_sol3(:,N/2+1:N),x2_sol3(:,1:N/2)];
y2_set2_sol3 = [y2_sol3(:,N/2+1:N),y2_sol3(:,1:N/2)]+movement_clamp+sine_clamp;


%% clamp slow

x1_sol4 = [zeros(1,N); zeros(1,N)+shear_movement; ones(1,N)+shear_movement; ones(1,N); zeros(1,N)]; 
y1_sol4 = [zeros(1,N); ones(1,N); ones(1,N); zeros(1,N); zeros(1,N)]+movement_clamp-sine_clamp;

x1_set2_sol4 = [x1_sol4(:,N/2+1:N),x1_sol4(:,1:N/2)];
y1_set2_sol4 = [y1_sol4(:,N/2+1:N),y1_sol4(:,1:N/2)]-[movement_clamp(N/2+1:N) movement_clamp(1:N/2)]+[sine_clamp(N/2+1:N) sine_clamp(1:N/2)];

x2_sol4 = x1_sol4;
y2_sol4 = y1_sol4.*-1+movement_clamp-sine_clamp + 2.3;

x2_set2_sol4 = [x2_sol4(:,N/2+1:N),x2_sol3(:,1:N/2)];
y2_set2_sol4 = [y2_sol4(:,N/2+1:N),y2_sol4(:,1:N/2)]+movement_clamp-sine_clamp;


%% clamps
x1clamp = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y1clamp = [zeros(1,N)+movement_clamp; ones(1,N); ones(1,N); zeros(1,N)+movement_clamp; zeros(1,N)+movement_clamp]+2.33;

x2clamp = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y2clamp = [zeros(1,N); ones(1,N)+movement_clamp; ones(1,N)+movement_clamp; zeros(1,N); zeros(1,N)]-1.03;

x1clamp1 = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y1clamp1 = [zeros(1,N)+movement_clamp+sine_clamp; ones(1,N); ones(1,N); zeros(1,N)+movement_clamp+sine_clamp; zeros(1,N)+movement_clamp+sine_clamp]+2.33;

x2clamp1 = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y2clamp1 = [zeros(1,N); ones(1,N)+movement_clamp+sine_clamp; ones(1,N)+movement_clamp+sine_clamp; zeros(1,N); zeros(1,N)]-1.03;

x1clamp2 = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y1clamp2 = [zeros(1,N)+movement_clamp-sine_clamp; ones(1,N); ones(1,N); zeros(1,N)+movement_clamp-sine_clamp; zeros(1,N)+movement_clamp-sine_clamp]+2.33;

x2clamp2 = [zeros(1,N); zeros(1,N); ones(1,N); ones(1,N); zeros(1,N)]; 
y2clamp2 = [zeros(1,N); ones(1,N)+movement_clamp-sine_clamp; ones(1,N)+movement_clamp-sine_clamp; zeros(1,N); zeros(1,N)]-1.03;
%%
figure
plot(x1_set2_sol2(2,:))
hold on
plot(x1_sol2(2,:))

figure
plot(-y1clamp2(1,:)+2.3)
hold on
plot(y2clamp2(2,:))

% return
%% problem
figure
% for x=1:2
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
% end


%% solution 1 slow shear
figure
% for x=1:2
for i=1:N
pause(0.05)
clear("figure");
plot(x1_sol(:,i),y1_sol(:,i),'b', 'LineWidth',2)
hold on
% yline(1.3, '--')
% yline(1, '--')
plot(x1_set2_sol(:,i),y1_set2_sol(:,i),'r--', 'LineWidth',2)
plot(x2_sol(:,i),y2_sol(:,i),'b', 'LineWidth',2)
plot(x2_set2_sol(:,i),y2_set2_sol(:,i),'r--', 'LineWidth',2)
plot(x1clamp(:,i),y1clamp(:,i),'m', 'LineWidth',2)
plot(x2clamp(:,i),y2clamp(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.3 1.3])
ylim([-1.1 3.4])
title('Clamping in theory with clamping \alpha = \pi')
drawnow;
end
% end

%% solution 2 fast shear
figure
% for x=1:2
for i=1:N
pause(0.05)
clear("figure");
plot(x1_sol2(:,i),y1_sol2(:,i),'b', 'LineWidth',2)
hold on
% yline(1.3, '--')
% yline(1, '--')
plot(x1_set2_sol2(:,i),y1_set2_sol2(:,i),'r--', 'LineWidth',2)
plot(x2_sol2(:,i),y2_sol2(:,i),'b', 'LineWidth',2)
plot(x2_set2_sol2(:,i),y2_set2_sol2(:,i),'r--', 'LineWidth',2)
plot(x1clamp(:,i),y1clamp(:,i),'m', 'LineWidth',2)
plot(x2clamp(:,i),y2clamp(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.3 1.3])
ylim([-1.1 3.4])
title('Clamping in theory with clamping \alpha = \pi')
drawnow;
end
% end

%% solution 3 fast clamp
figure
% for x=1:2
for i=1:N
pause(0.05)
clear("figure");
plot(x1_sol3(:,i),y1_sol3(:,i),'b', 'LineWidth',2)
hold on
% yline(1.3, '--')
% yline(1, '--')
plot(x1_set2_sol3(:,i),y1_set2_sol3(:,i),'r--', 'LineWidth',2)
plot(x2_sol3(:,i),y2_sol3(:,i),'b', 'LineWidth',2)
plot(x2_set2_sol3(:,i),y2_set2_sol3(:,i),'r--', 'LineWidth',2)
plot(x1clamp1(:,i),y1clamp1(:,i),'m', 'LineWidth',2)
plot(x2clamp1(:,i),y2clamp1(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.3 1.3])
ylim([-1.1 3.4])
title('Clamping in theory with clamping \alpha = \pi')
drawnow;
end
% end

%% solution 4 slow clamp
figure
% for x=1:2
for i=1:N
pause(0.05)
clear("figure");
plot(x1_sol4(:,i),y1_sol4(:,i),'b', 'LineWidth',2)
hold on
% yline(1.3, '--')
% yline(1, '--')
plot(x1_set2_sol4(:,i),y1_set2_sol4(:,i),'r--', 'LineWidth',2)
plot(x2_sol4(:,i),y2_sol4(:,i),'b', 'LineWidth',2)
plot(x2_set2_sol4(:,i),y2_set2_sol4(:,i),'r--', 'LineWidth',2)
plot(x1clamp2(:,i),y1clamp2(:,i),'m', 'LineWidth',2)
plot(x2clamp2(:,i),y2clamp2(:,i),'c', 'LineWidth',2)
hold off
xlim([-0.3 1.3])
ylim([-1.1 3.4])
title('Clamping in theory with clamping \alpha = \pi')
drawnow;
end
% end

