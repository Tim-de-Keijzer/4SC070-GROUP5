clc
clear


%% Piezo model example

% This example  script is inspired by Figures 2, 3 and 8 of the following 
% paper: http://www.toomen.eu/pdf/StrijboschTacVerOom2019.pdf

% The Piezo actuator is simulated as if commutation functions are 
% implemented 'under the hood'. The commutation functions  are not 
% explicitly in the model. 

% Two example piezo models are included:
%   (a) the commutation functions lead to a monotone y-alpha relationship
%   (b) the commutation functions lead to an y-alpha relationship that is
%   not invertible. 

% Start with use_monotone_function = true and implement your ILC/RC 
% approach to accurately track the reference in the exercise. Then, set 
% use_monotone_function = false. does your implementation still work? 
% If not, how can you ensure good tracking performance on the experimental 
% setup if the piezo behaves like case (b)? 

use_monotone_function = false;


%% Set Piezo parameters

if ~use_monotone_function
    c = 0.8;
else
    c = 0.2;
end
piezo_gain = 1e-7;

% load("time_array.mat")
Ntrials = 11;
%% Simulate Piezo
% error = [out.error.Time zeros(4011,1)];
% % Edit the simulink file to include your ILC/RC implementation
% 
% for i = 1:amount_it
%     out = sim('piezo_sim');
%     error = out.error.Data;
%     error = [out.error.Time out.error.Data];
% end

%% Load trajectory.
% Trial length:
tsamp = 0.001;
time = 0:tsamp:4;
% time = out.error.Time';
N = length(time);


f_jplus1 = [time' zeros(N,1)];

for N = 1:Ntrials
    f_j = f_jplus1;
    out = sim('piezo_sim');
    error_dat = out.error.Data;
%     error_dat( abs(error_dat) < 10^(-10)) = 10^(-8);
%     f_jplus1_dat = f_j(:,2) - (1./error_dat)*piezo_gain;
    f_jplus1_dat = f_j(:,2) - 0.5*error_dat/piezo_gain;
%     f_jplus1_dat = f_j(:,2) - error_dat/piezo_gain;
    f_jplus1 = [time' f_jplus1_dat];

    f_j_save(:,N) = f_j(:,2);
    error_save(:,N) = error_dat;
    alpha_save(:,N) = out.alpha_mod.Data;
    ref_save(:,N) = out.refout.Data;
    y_save(:,N) = out.y.Data;
end


%% plotting

alpha = 0:2*pi/1000:2*pi;
close all;
figure
hold on
for N = 1:2:Ntrials
plot(alpha,f_j_save(1:1001,N))
end
title('Feedforward signal \alpha over iterations')
legend('Trial 0','Trial 2','Trial 4','Trial 6','Trial 8','Trial 10',Location='best')
xlabel('\alpha [rad]')
ylabel('Feedforward signal \alpha [rad]')
xlim([0 2*pi])
xticks([0 pi 2*pi ])
xticklabels({'0', '\pi', '2\pi'})


figure
hold on
for N = 1:2:Ntrials
plot(alpha,error_save(1:1001,N))
end
title('Error over iterations')
legend('Trial 0','Trial 2','Trial 4','Trial 6','Trial 8','Trial 10',Location='best')
xlabel('\alpha [rad]')
ylabel('Error [m]')
xlim([0 2*pi])
xticks([0 pi 2*pi ])
xticklabels({'0', '\pi', '2\pi'})


figure
hold on
for N = 1:2:Ntrials
plot(error_save(1:1001,N).*10^7,'r')
plot(f_j_save(1:1001,N),'k')
end

figure
hold on
for N = 1:2:Ntrials
plot(alpha,alpha_save(1:1001,N))
end
title('Input \alpha over iterations')
legend('Trial 0','Trial 2','Trial 4','Trial 6','Trial 8','Trial 10',Location='best')
xlabel('\alpha [rad]')
ylabel('\alpha [rad]')
xlim([0 2*pi])
xticks([0 pi 2*pi ])
xticklabels({'0', '\pi', '2\pi'})


%% 
figure
subplot(2,1,1)
plot(out.alpha_mod)
ylim([0 2*pi])
title('Commutation angle')
ylabel('Alpha [rad]')
xlabel('Time [s]')
grid on

subplot(2,1,2)
plot(out.y)
title('Piezo position')
ylabel('Position [m]')
xlabel('Time [s]')
grid on

figure
subplot(2,1,1)
plot(alpha_save(:,1))
hold on
plot(alpha_save(:,N))
ylim([0 2*pi])
title('Commutation angle')
ylabel('Alpha [rad]')
xlabel('Time [s]')
grid on

subplot(2,1,2)
plot(y_save(:,1))
hold on
plot(y_save(:,N))
title('Piezo position')
ylabel('Position [m]')
xlabel('Time [s]')
grid on
