clc; close all; clear all;

noff = load("Data exp1\data0good.mat");
ff_02 = load("Data exp1\data0.2good.mat");
ff_05 = load("Data exp1\data0.5good.mat");

ff_it1 = load("Data exp1\ff_it1.mat");
ff_it2 = load("Data exp1\ff_it2.mat");

it1 = load("Data exp1\it1");
it2 = load("Data exp1\it2");

%% plots
length_noff = 840;
startN = 10761;

%error forward
figure
hold on
for i = 0:10
plot(noff.expData.commAngle(1+i*840:840+i*840),noff.expData.error(1+i*840:840+i*840)-noff.expData.error(1+i*840))
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

%error backward
figure
hold on
for i = 0:10
plot(noff.expData.commAngle(startN+1+i*840:startN+(1+i)*840-1),noff.expData.error(startN+1+i*840:startN+(1+i)*840-1)-noff.expData.error(startN+1+i*840-1))
end
xline(pi/2,Color='k')
xline(pi,Color='k')
xline(pi*3/2,Color='k')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
ylabel('Error [m]')
title('Error vs \alpha for backward movement, no FF')

% position forward
figure
hold on
plot(noff.expData.commAngle(1:840),noff.expData.idealPos(1:840)-noff.expData.idealPos(1))
for i = 1:10
plot(noff.expData.commAngle(1+i*840:840+i*840),noff.expData.position(1+i*840:840+i*840)-noff.expData.position(1+i*840),Color=[0.8500, 0.3250, 0.0980])
end
% plot(noff.expData.commAngle(1:840),noff.expData.idealPos(1:840)-noff.expData.idealPos(1))
% xline(pi/2,Color='k')
% xline(pi,Color='k')
% xline(pi*3/2,Color='k')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
ylabel('Position [m]')
title('Position vs \alpha for forward movement')
legend('Reference','Actual position')

% position backward
figure
hold on
for i = 0:10
plot(noff.expData.commAngle(startN+1+i*840:startN+(1+i)*840-1),noff.expData.position(startN+1+i*840:startN+(1+i)*840-1)-noff.expData.position(startN+1+i*840-1))
end
plot(noff.expData.commAngle(startN+1:startN+840),noff.expData.idealPos(startN+1:startN+840)-noff.expData.idealPos(startN))
xline(pi/2,Color='k')
xline(pi,Color='k')
xline(pi*3/2,Color='k')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
ylabel('Position [m]')
title('Position vs \alpha for backward movement, no FF')



%% error and first iteration

i = 2;
length_ff_05 = 605;

% error vs FF signal noff
figure
hold on
plot(noff.expData.commAngle(1+i*840:840+i*840),noff.expData.error(1+i*840:840+i*840)-noff.expData.error(1+i*840))
plot(noff.expData.commAngle(1+i*840:840+i*840),ff_it1.uff.uffsave(1+i*840:840+i*840)-ff_it1.uff.uffsave(1+i*840))
xline(pi/2,Color='k')
xline(pi,Color='k')
xline(pi*3/2,Color='k')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
legend('Error without FF','FF signal first iteration',Location='best')
ylabel('Error / FF signal [m]')
title('Error (no FF) and FF vs \alpha for forward movement, no FF')

% error vs FF signal it1
figure
hold on
plot(noff.expData.commAngle(1+i*840:840+i*840),noff.expData.error(1+i*840:840+i*840)-noff.expData.error(1+i*840))
plot(noff.expData.commAngle(1+i*840:840+i*840),it1.expData.error(1+i*840:840+i*840)-it1.expData.error(1+i*840))
plot(it1.expData.commAngle(1+i*840:840+i*840),ff_it1.uff.uffsave(1+i*840:840+i*840)-ff_it1.uff.uffsave(1+i*840))
% plot(noff.expData.commAngle(1+i*840:840+i*840),ff_it1.uff.uffsave(1+i*840:840+i*840)-ff_it1.uff.uffsave(1+i*840))
xline(pi/2,Color='k')
xline(pi,Color='k')
xline(pi*3/2,Color='k')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
legend('Error without FF','Error first iteration','FF signal first applied to get new error',Location='best')
ylabel('Error / FF signal [m]')
title('Error (no FF) and FF vs \alpha for forward movement')

% this gives problems because FF signal is applied at the wrong
% posistion!!!!!!!!!!! try to get beter estimate of the gain


%% approximate gain forward

for i = 1:10
positionall(:,i) = noff.expData.position(1+i*840:840+i*840)-noff.expData.position(1+i*840);
end
positionmean = mean(positionall,2);
angle = noff.expData.commAngle(1+5*840:840+5*840);

P = polyfit(angle,positionmean,1);
y = polyval(P,angle);

figure
hold on
plot(angle,positionmean)
plot(angle,y,'r--')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
legend('Real position','First order polynomial fit',Location='best')
ylabel('Position [m]')
title('First order polynomial fit of position')

pShearFit = P(1)*2*pi
pShearSim = 2.1e-6;
pShearApprox = y(end)-y(1)
diff_factor = pShearSim/pShearFit;


%% approximate gain backward

for i = 2:10
positionallback(:,i) = noff.expData.position(startN+1+i*840:startN+(1+i)*840-1)-noff.expData.position(startN+1+i*840);
end
positionmeanback = mean(positionallback,2);
angleback = noff.expData.commAngle(startN+1+5*840:startN+840+5*840-1);

P = polyfit(angleback,positionmeanback,1);
y = polyval(P,angleback);

figure
hold on
plot(angleback,positionmeanback)
plot(angleback,y,'r--')
xlabel('Commutation angle \pi [rad]')
xticks([0 pi/2 pi 3/2*pi 2*pi])
xticklabels({'0','0.5 \pi','\pi','1.5 \pi', '2 \pi'})
xlim([0 2*pi])
legend('Real position','First order polynomial fit',Location='best')
ylabel('Position [m]')
title('First order polynomial fit of position backward')

pShearFitback = P(1)*2*pi
pShearSim = 2.1e-6;
pShearApproxback = y(1)-y(end)
diff_factorback = pShearSim/pShearFitback

% figure
% plot(noff.expData.commAngle)

%% plot encoders

figure
plot(ff_05.expData.enc.cos(1000:2000))
hold on
plot(ff_05.expData.enc.sin(1000:2000))

figure
plot(ff_05.expData.enc.cosUnc(1000:2000))
hold on
plot(ff_05.expData.enc.sinUnc(1000:2000))


