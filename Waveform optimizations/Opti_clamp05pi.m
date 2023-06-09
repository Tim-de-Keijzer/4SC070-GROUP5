function norm_error = Opti_clamp05pi(x)

% clc; clear all; close all;

global width amplitude x_result

width         = x(1);  % clamp dimple width
amplitude     = x(2);  % clamp dimple height

displayU=sprintf('Amplitude %f, width %f',amplitude,width);

answer = questdlg(sprintf('%s\n Do you want to continue with the next fmincon search?', displayU), 'Check','Yes','No','No');
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

% Feedforward
u_ff(:,1) = zeros(tMeas/tSample,1); % Zero feedforward by default.
% You can change the feedforward signal without the need to re-build the
% model. The value is uploaded to the target further down in the script,
% using setparam(tg, getparamid(tg, '', 'u_ff'), u_ff)
% For example: u_ff(:,1) = 3e-6 * sin(2*pi*2*t);


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
    setparam(tg, getparamid(tg, '', 'width'), width)
    setparam(tg, getparamid(tg, '', 'amplitude'), amplitude)
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


%% get data from simulation

x_result = [x_result; x'];

% to test
noff = load("Data exp1\data0good.mat");
angle = noff.expData.commAngle;
error = noff.expData.error;

% % for real life experiment
% angle = expData.commAngle;
% error = expData.error;

%finding length N
zeros_found = find(angle==0);
N = zeros_found(3)-zeros_found(2);

%get correct range of error
range_pi = 0.15*pi;
range = range_pi/2/pi;
range_N = ceil(range*N);

error_all = zeros(N,10);
%compute mean
for i = 1:10
    error_all(:,i) = error(1+i*N:N+i*N)-error(1+i*N);
end
meanerror = mean(error_all,2);

%% get fit for error
% angle_mean = angle(N+1:2*N);
% P = polyfit(angle_mean,meanerror,1);
% y = polyval(P,angle_mean);
y = 0:meanerror(end)/N:meanerror(end)-meanerror(end)/N;

%compute new error with respect to fit
meanerror = meanerror-y';

%get correct range data
% middle_range = ceil(N/4);

mean_range = [meanerror(N-range_N:N); meanerror(1:range_N)] ;

norm2_range = norm(mean_range,2);

norm_error = norm2_range;

% figure
% hold on
% plot(error_all)
% plot(meanerror,LineWidth=2)

% figure
% plot(mean_range)

% figure
% plot(meanerror)
% hold on
% plot(y)

end


