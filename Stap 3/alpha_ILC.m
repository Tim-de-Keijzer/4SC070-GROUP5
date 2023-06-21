function [norm_e, FF_start] = alpha_ILC(i, gamma_gain, FF_start)

clearvars;
close all;
home;


% Other waveform parameters
forwardGain = 1.0064e-6;
backwardGain = 1.32e-6;
Clamp1Width = 0.001;
Clamp1Amp = 0;
Clamp2Width = 0.001;
Clamp2Amp = 0;
ShearWidth = 0.001;
ShearAmp = 0;
ClampsSineWidth = 0.001;
ClampsSineAmp = 0;

if i == 0
    u_ff(:,1) = zeros(tMeas/tSample,1); % Zero feedforward by default.
    save('u_ff_old', 'uffsave');
else
data = load('expData.mat');
uff = load('u_ff_old');

u_ff(:,1) = uff.uffsave;

input = uff.uffsave(FF_start:end) + gamma_gain*data.expData.error(FF_start:end);

Q = Q_filter;

b = Q.numerator{1};
a = Q.Denomintor{1};
f_jplus1 = filtfilt(b,a,input);

u_ff(FF_start:end,1) = f_jplus1;
uffsave = u_ff;

save('u_ff_old', 'uffsave');

N_forward = 0;
N_backward = 0;

for i_comm = 1:length(data.expData.commAngle)
delta = data.expData.commAngle(i_comm) - data.expData.commAngle(i_comm+1);

if delta > 1.0
    N_forward = [N_forward, i_comm];
end

if delta < -1.0
    N_backward = [N_backward, i_comm];
end 
end

N_forward = N_forward(2:end);
N_backward = N_forward(2:end);

N_forward_length = N_forward(3)-N_forward(2);
N_backward_length = N_backward(3)-N_backward(2);

FF_start = N_forward(2)+1;

figure()
plot(data.expData.t, u_ff(:,1))
hold on
plot(data.expData.t, data.expData.reference)
plot(data.expData.t, u_ff(:,1)+data.expData.reference)
title('Feedforward signal and reference')
legend('FF', 'Ref', 'FF+Ref')

figure()
plot(data.expData.t(N_forward(2):N_forward(3)), u_ff(N_forward(2):N_forward(3),1))
hold on
plot(data.expData.t(N_forward(2):N_forward(3)), data.expData.reference(N_forward(2):N_forward(3)))
plot(data.expData.t(N_forward(2):N_forward(3)), u_ff(N_forward(2):N_forward(3),1)+data.expData.reference(N_forward(2):N_forward(3)))
title('Feedforward signal and reference 1 alpha forward')
legend('FF', 'Ref', 'FF+Ref')

figure()
plot(data.expData.t(N_backward(2):N_backward(3)), u_ff(N_backward(2):N_backward(5),1))
hold on
plot(data.expData.t(N_backward(2):N_backward(3)), data.expData.reference(N_backward(2):N_backward(3)))
plot(data.expData.t(N_backward(2):N_backward(3)), u_ff(N_backward(2):N_backward(3),1)+data.expData.reference(N_backward(2):N_backward(3)))
title('Feedforward signal and reference 1 alpha 1 alpha backaward')
legend('FF', 'Ref', 'FF+Ref')

end


% % get message to continue
% displayU=sprintf('Amplitude %f, width %f',Clamp1Amp,Clamp1Width);

answer = questdlg(sprintf('%s\n Conitnue with next learning iteration?'), 'Check','Yes','No','No');
if strcmp(answer,'No')
    return
end

% --------------------------------------------------------------------------
% Parameters that can be changed
% --------------------------------------------------------------------------

% Program options
optBuild                = false;    % Build program before experiment. 
optCalibrateEncoder     = false;    % Calibrate encoder
optShowExperimentPlots  = false;     % Show results of experiment in plot

% Experiment properties
tMeas               = 5; 	% Measurement time in [s]. Set inf for continuous
tSample             = 1e-4; % Sample time in [s]
t = 0:tSample:tMeas-tSample;

% % Feedforward
% u_ff(:,1) = zeros(tMeas/tSample,1); % Zero feedforward by default.
% % You can change the feedforward signal without the need to re-build the
% % model. The value is uploaded to the target further down in the script,
% % using setparam(tg, getparamid(tg, '', 'u_ff'), u_ff)
% % For example: u_ff(:,1) = 3e-6 * sin(2*pi*2*t);


% Plot options
optPlotStart    = 1;   % Start plot at first sample
% optPlotStart    = round(1/(abs(pWaveformFrequency)*tSample));   % Start plot at particular waveform time
optPlotEnd      = round(tMeas/tSample);                         % Plot till end


% ==========================================================================
% Init workspace parameters
% ===========================================================================
% disp('===============================================================')
% disp('Starting script')

% Sampling
nSample = floor(tMeas/tSample);

pWaveformFrequency  = 1;    % Step frequency in [Hz]. Positive for forward, negative for backwards

% Clamp and shear amplitudes and offset determining
pShearMax = 150;    % [V]
pShearMin = -150;   % [V]
pShearAmpl = (pShearMax - pShearMin) / 2;
pShearOffs = (pShearMax + pShearMin) / 2;
pShearSatMax = 250;    % [V]
pShearSatMin = -250;   % [V]

pClampMax = 60;     % [V]
pClampMin = -30;    % [V]
pClampAmpl = (pClampMax - pClampMin) / 2;
pClampOffs = (pClampMax + pClampMin) / 2;
pClampSatMax = 60;    % [V]
pClampSatMin = -30;   % [V]

pShearStep = (3.5e-6)*((pShearMax-pShearMin)/500);    % [m/wave]

% Amplitude gain for analog output of Speedgoat
pAmpGain = 1./[25, 25, 7.5, 7.5];

% Encoder parameters
encQuads    = 1;
encStepSize = 0.5e-6;   % [m]
pEncRes     = encStepSize/encQuads; 	% [m], 0.5um for single period. Count with 1 sinusoid period
pEncCrosSat = 0.02;     % [V]

if (optCalibrateEncoder == true) || ((optCalibrateEncoder == false) && ~isfile('encCorrection.mat'))
    pCosineOffset     = 0;
    pCosineGain       = 1;
    pSineOffset       = 0;
    pSineGain         = 1;
    pAngleCorrection  = 0;
    
    if ~isfile('encCorrection.mat')
        disp('Encoder calibration file missing. Uncalibrated encoder data as output! Set optCalibrateEncoder = true;')
    end
else
    load('encCorrection.mat')

    pCosineOffset     = encCor.CosineOffset;
    pCosineGain       = encCor.CosineGain;
    pSineOffset       = encCor.SineOffset;
    pSineGain         = encCor.SineGain;
    pAngleCorrection  = encCor.AngleCorrection;        
end

% List of signals to trace data (Label name in export order)
dataEater.signals = [ ...
    "reference" ...
    "CommAngle" ...
    "ShearTru" ...
    "ClampTru" ...
    "ShearAnl" ...
    "ClampAnl" ...
    "encSinUnc" ...
    "encCosUnc" ...    
    "encSinCor" ...
    "encCosCor" ...
    "encCount" ...
    "encInt" ...
    "Position" ...
    "Velocity" ...
    "idealPos" ...
    "Error" ...
    ];

% ==========================================================================
% Build Model
% ===========================================================================

% Ping Target PC
slrtpingtarget;

% Set sample time on target
tg.SampleTime = tSample;

% Build or load model onto device
if optBuild == true
    disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
    disp('Building of model in progress.')
    
    % Build simulink file called "Model"
    rtwbuild('Model');
    
    % Monitor reply
    disp('Building done. Re-run the script with the optBuild=false to start the experiment.');
    return;
else
    % Set tg as target and load simulink model called "Model" to target
    tg = SimulinkRealTime.target;
    tg.load('Model');
    
    % Update changeable experiment parameters
%     setparam(tg, getparamid(tg, '', 'Mode'), Mode)
    setparam(tg, getparamid(tg, '', 'tSample'), tSample)
    
    setparam(tg, getparamid(tg, '', 'pAngleCorrection'), pAngleCorrection)
    setparam(tg, getparamid(tg, '', 'pCosineOffset'), pCosineOffset)
    setparam(tg, getparamid(tg, '', 'pCosineGain'), pCosineGain)
    setparam(tg, getparamid(tg, '', 'pSineOffset'), pCosineOffset)
    setparam(tg, getparamid(tg, '', 'pSineGain'), pCosineGain)
    
    setparam(tg, getparamid(tg, '', 'u_ff'), u_ff)

    %added parameters for optimization
    setparam(tg, getparamid(tg, '', 'Clamp1Width'), Clamp1Width)
    setparam(tg, getparamid(tg, '', 'Clamp1Amp'), Clamp1Amp)
    setparam(tg, getparamid(tg, '', 'Clamp2Width'), Clamp2Width)
    setparam(tg, getparamid(tg, '', 'Clamp2Amp'), Clamp2Amp)
    setparam(tg, getparamid(tg, '', 'ShearWidth'), ShearWidth)
    setparam(tg, getparamid(tg, '', 'ShearAmp'), ShearAmp)
    setparam(tg, getparamid(tg, '', 'ClampsSineWidth'), ClampsSineWidth)
    setparam(tg, getparamid(tg, '', 'ClampsSineAmp'), ClampsSineAmp)
end

% Construct data output object
if ~isfield(dataEater,'scope')
    dataEater.signalIndex = [];
    for i = 1:numel(dataEater.signals)
        dataEater.signalIndex = [dataEater.signalIndex getsignalidsfromlabel(tg,dataEater.signals(i))]; 
    end

    dataEater.scope = addscope(tg, 'host', 100);
    addsignal(dataEater.scope, dataEater.signalIndex);
end

if tMeas == inf
    dataEater.scope.NumSamples = round((10*60)/tSample);
else
    dataEater.scope.NumSamples = round(tMeas/tSample);
end


% ==========================================================================
% Start experiment and retrieve data
% ===========================================================================
disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
disp('Experiment in progress.')

% Set measurement time
tg.StopTime = tMeas; % Set experiment time to finit length

% Start experiment and data obtaining
start(dataEater.scope);
tg.start;

% Wait to retrieve data until experiment is ready
while tg.Status == "running"; end

% Stop data obtaining and export data
disp('Processing data.')
stop(dataEater.scope);
expData = Func_getDataFromHost(dataEater.scope);
remscope(tg, dataEater.scope.ScopeId);

disp('Experiment finished.')
disp('===============================================================')


%% Norm calculations

error = expData.error;
norm_e = norm(error,2);


end
