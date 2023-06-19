clc; clear all; close all;

first = load("Data exp2\firstexp.mat");
final = load("Data exp2\fittweakedexcepthysteresis.mat");
try_wave= load("Data exp2\expfinal_02_01_005_min015.mat");
% loadnoff = load("Data exp2\.mat");
% loadnoff = load("Data exp2\.mat");
% loadnoff = load("Data exp2\.mat");

%% create variables
error_slope = first.expData.error;
angle_slope = first.expData.commAngle;

error_slope_tuned = final.expData.error(3:end);
angle_slope_tuned = final.expData.commAngle(3:end);
position_tuned = final.expData.position(3:end);
ref_tuned = final.expData.idealPos(3:end);

error_try = try_wave.expData.error(3:end);
angle_try = try_wave.expData.commAngle(3:end);
position_try = try_wave.expData.position(3:end);
ref_try = try_wave.expData.idealPos(3:end);

%finding length N
zeros_found = find(angle_slope==0);
N = zeros_found(4)-zeros_found(3);

zeros_found_new = find(angle_slope_tuned<0.02);
N_new = zeros_found_new(4)-zeros_found_new(3);



%% figures
% error
figure
hold on
for i = 1:9
plot(angle_slope(1+i*N:N+i*N),error_slope(1+i*N:N+i*N)-error_slope(1+i*N), Color=[0, 0.4470, 0.7410])
plot(angle_slope_tuned(1+i*N_new:N_new+i*N_new),error_slope_tuned(1+i*N_new:N_new+i*N_new)-error_slope_tuned(1+i*N_new),Color=[0.8500, 0.3250, 0.0980])
end
xline(0.05*2*pi,Color='k')
xline(0.45*2*pi,Color='k')
xline(0.55*2*pi,Color='k')
xline(0.95*2*pi,Color='k')
% xline(pi/2,Color='k')
% xline(pi,Color='k')
% xline(pi*3/2,Color='k')
yline(0,'k--')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
ylabel('Error [m]')
title('Error vs \alpha for forward movement, no FF')
legend('Non-optimized gain','Optimized gain')

% position forward
figure
hold on
plot(angle_slope_tuned(1:N_new),ref_tuned(1:N_new)-ref_tuned(1), Color=[0, 0.4470, 0.7410])
for i = 1:9
plot(angle_slope_tuned(1+i*N_new:N_new+i*N_new),position_tuned(1+i*N_new:N_new+i*N_new)-position_tuned(1+i*N_new),Color=[0.8500, 0.3250, 0.0980])
end
% plot(noff.expData.commAngle(1:840),noff.expData.idealPos(1:840)-noff.expData.idealPos(1))
% xline(pi/2,Color='k')
% xline(pi,Color='k')
% xline(pi*3/2,Color='k')
xline(0.05*2*pi,Color='k')
xline(0.45*2*pi,Color='k')
xline(0.55*2*pi,Color='k')
xline(0.95*2*pi,Color='k')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
ylabel('Position [m]')
title('Position vs \alpha for forward movement')
legend('Reference','Actual position')

%% figures try waveforms

figure
hold on
for i = 1:9
% plot(angle_slope(1+i*N:N+i*N),error_slope(1+i*N:N+i*N)-error_slope(1+i*N), Color=[0, 0.4470, 0.7410])
plot(angle_slope_tuned(1+i*N_new:N_new+i*N_new),error_slope_tuned(1+i*N_new:N_new+i*N_new)-error_slope_tuned(1+i*N_new), Color=[0, 0.4470, 0.7410])
plot(angle_try(1+i*N_new:N_new+i*N_new),error_try(1+i*N_new:N_new+i*N_new)-error_try(1+i*N_new), Color=[0.8500, 0.3250, 0.0980])
end
xline(0.05*2*pi,Color='k')
xline(0.45*2*pi,Color='k')
xline(0.55*2*pi,Color='k')
xline(0.95*2*pi,Color='k')
% xline(pi/2,Color='k')
% xline(pi,Color='k')
% xline(pi*3/2,Color='k')
yline(0,'k--')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
ylabel('Error [m]')
title('Error vs \alpha for forward movement, no FF')
legend('Non-optimized wave form','First try wave form')