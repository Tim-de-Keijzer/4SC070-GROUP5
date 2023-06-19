clc; clear all; close all;

first = load("Data exp2\firstexp.mat");
final = load("Data exp2\fittweakedexcepthysteresis.mat");
% first = load("Data exp2\firt.mat");
% loadnoff = load("Data exp2\.mat");
% loadnoff = load("Data exp2\.mat");
% loadnoff = load("Data exp2\.mat");

%% create variables
error_slope = first.expData.error(3:end);
angle_slope = first.expData.commAngle;

error_slope_tuned = final.expData.error;
angle_slope_tuned = final.expData.commAngle;

%finding length N
zeros_found = find(angle_slope==0);
N = zeros_found(4)-zeros_found(3);

zeros_found_new = find(angle_slope_tuned<0.02);
N_new = zeros_found_new(4)-zeros_found_new(3);



%% figures
figure
hold on
for i = 1:9
plot(angle_slope(1+i*N:N+i*N),error_slope(1+i*N:N+i*N)-error_slope(1+i*N))
plot(angle_slope_tuned(1+i*N_new:N_new+i*N_new),error_slope_tuned(1+i*N_new:N_new+i*N_new)-error_slope_tuned(1+i*N_new))
end
xline(pi/2,Color='k')
xline(pi,Color='k')
xline(pi*3/2,Color='k')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
ylabel('Error [m]')
title('Error vs \alpha for forward movement, no FF')
