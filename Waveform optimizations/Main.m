%% +-+-+-+-+--+-+-+-+-+-+-+-+-+-+-+--+-+-+-+-+-+-+-+-+-+-+--+-+-+-+-+-+-+-+-
% ----------------------> Piezo stepper Main script <-----------------------
% For use as basic OPEN-loop setup
% Change parameters in this section to change experiment mode, time and
% step frequency.
%
% Author: Yves Elmensdorp. Edited by Lennart Blanken, Max van Meer for LC
% Date: March 2021. Edited May 2023
% +-+-+-+-+--+-+-+-+-+-+-+-+-+-+-+--+-+-+-+-+-+-+-+-+-+-+--+-+-+-+-+-+-+-+-+
clear all;
clc;
clearvars;
close all;
home;

% --------------------------------------------------------------------------
% Parameters that can be changed
% --------------------------------------------------------------------------

% Program options
optBuild                = false;    % Build program before experiment. 
optCalibrateEncoder     = false;    % Calibrate encoder
optShowExperimentPlots  = true;     % Show results of experiment in plot

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

% --------------------------------------------------------------------------
% --------------------------------------------------------------------------


%% ==========================================================================
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


% out = sim('Waveformmodel');

% % List of signals to trace data (Label name in export order)
% dataEater.signals = [ ...
%     "reference" ...
%     "CommAngle" ...
%     "ShearTru" ...
%     "ClampTru" ...
%     "ShearAnl" ...
%     "ClampAnl" ...
%     "encSinUnc" ...
%     "encCosUnc" ...    
%     "encSinCor" ...
%     "encCosCor" ...
%     "encCount" ...
%     "encInt" ...
%     "Position" ...
%     "Velocity" ...
%     "idealPos" ...
%     "Error" ...
%     ];


% %% ==========================================================================
% % Build Model
% % ===========================================================================
% 
% % Ping Target PC
% % slrtpingtarget;
% 
% % Set sample time on target
% tg.SampleTime = tSample;
% 
% % Build or load model onto device
% if optBuild == true
%     disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
%     disp('Building of model in progress.')
%     
%     % Build simulink file called "Model"
%     rtwbuild('Waveformmodel');
%     
%     % Monitor reply
%     disp('Building done. Re-run the script with the optBuild=false to start the experiment.');
%     return;
% else
%     % Set tg as target and load simulink model called "Model" to target
%     tg = SimulinkRealTime.target;
%     tg.load('Waveformmodel');
%     
%     % Update changeable experiment parameters
% %     setparam(tg, getparamid(tg, '', 'Mode'), Mode)
%     setparam(tg, getparamid(tg, '', 'tSample'), tSample)
%     
%     setparam(tg, getparamid(tg, '', 'pAngleCorrection'), pAngleCorrection)
%     setparam(tg, getparamid(tg, '', 'pCosineOffset'), pCosineOffset)
%     setparam(tg, getparamid(tg, '', 'pCosineGain'), pCosineGain)
%     setparam(tg, getparamid(tg, '', 'pSineOffset'), pCosineOffset)
%     setparam(tg, getparamid(tg, '', 'pSineGain'), pCosineGain)
%     
%     setparam(tg, getparamid(tg, '', 'u_ff'), u_ff)
% 
% end
% 
% % Construct data output object
% if ~isfield(dataEater,'scope')
%     dataEater.signalIndex = [];
%     for i = 1:numel(dataEater.signals)
%         dataEater.signalIndex = [dataEater.signalIndex getsignalidsfromlabel(tg,dataEater.signals(i))]; 
%     end
% 
%     dataEater.scope = addscope(tg, 'host', 100);
%     addsignal(dataEater.scope, dataEater.signalIndex);
% end
% 
% if tMeas == inf
%     dataEater.scope.NumSamples = round((10*60)/tSample);
% else
%     dataEater.scope.NumSamples = round(tMeas/tSample);
% end
% 
% 
% %% ==========================================================================
% % Encoder calibration
% % ===========================================================================
% 
% if optCalibrateEncoder == true
%     disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
%     disp('Calibration in progress.')
%     
%     % Start experiment to get data
%     tg.StopTime = 60; % [s]
%     start(dataEater.scope);
%     tg.start;
%     while tg.Status == "running"; end
%     stop(dataEater.scope);
%     expData = Func_getDataFromHost(dataEater.scope);
%     remscope(tg, dataEater.scope.ScopeId);
%     
%     % Determine correction coefficients
%     [~,~,~] = Func_encoderCalibration(expData.enc.cos(0.5/tSample:end),expData.enc.sin(0.5/tSample:end),0.5,true); 
%     
%     disp('Calibration done!')
%     disp('===============================================================')
%     return
% end
% 
% 
% %% ==========================================================================
% % Start experiment and retrieve data
% % ===========================================================================
% disp('+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')
% disp('Experiment in progress.')
% 
% % Set measurement time
% tg.StopTime = tMeas; % Set experiment time to finit length
% 
% % Start experiment and data obtaining
% start(dataEater.scope);
% tg.start;
% 
% % Wait to retrieve data until experiment is ready
% while tg.Status == "running"; end
% 
% % Stop data obtaining and export data
% disp('Processing data.')
% stop(dataEater.scope);
% expData = Func_getDataFromHost(dataEater.scope);
% remscope(tg, dataEater.scope.ScopeId);
% 
% disp('Experiment finished.')
% disp('===============================================================')


%% Plot result of experiment
% 
% if optShowExperimentPlots
%     figure(1)
%     subplot(3,3,1)
%     plot(expData.t, expData.commAngle)
%     xlim([expData.t(optPlotStart) expData.t(optPlotEnd)]); ylim([0 2*pi])
%     xlabel('Time [s]'); ylabel('\alpha [rad]'); title('Commutation Angle')
%     grid on
% 
%     subplot(3,3,2)
%     hold on
%     plot(expData.t, expData.waveform.true.S1)
%     plot(expData.t, expData.waveform.true.S2)
%     xlim([expData.t(optPlotStart) expData.t(optPlotEnd)]); ylim([-250*1.1 250*1.1])
%     xlabel('Time [s]'); ylabel('u_{shear} [V]'); title('Shears')
%     legend('S1','S2')
%     grid on
% 
%     subplot(3,3,3)
%     hold on
%     plot(expData.t, expData.waveform.true.C1)
%     plot(expData.t, expData.waveform.true.C2)
%     xlim([expData.t(optPlotStart) expData.t(optPlotEnd)]); ylim([-30*1.1 60*1.1])
%     xlabel('Time [s]'); ylabel('u_{clamp} [V]'); title('Clamps')
%     legend('C1','C2')
%     grid on
% 
%     subplot(3,3,4)
%     hold on
%     plot(expData.t, expData.enc.sin)
%     plot(expData.t, expData.enc.cos)
%     xlim([expData.t(optPlotStart) expData.t(optPlotEnd)]); ylim([-0.5*1.1 0.5*1.1])
%     xlabel('Time [s]'); ylabel('u_{enc} [V]'); title('Encoder')
%     legend('Sin','Cos')
%     grid on
% 
%     subplot(3,3,7)
%     hold on
%     plot(expData.t, expData.idealPos-expData.idealPos(optPlotStart), 'k:')
%     plot(expData.t, expData.position-expData.position(optPlotStart))
%     xlim([expData.t(optPlotStart) expData.t(optPlotEnd)])
%     xlabel('Time [s]'); ylabel('x_m [m]'); title('Position')
%     legend('Ideal','x_m')
%     grid on
%     
%     subplot(3,3,8)
%     plot(expData.t, expData.error-expData.error(optPlotStart))
%     xlim([expData.t(optPlotStart) expData.t(optPlotEnd)])
%     xlabel('Time [s]'); ylabel('e_m [m]'); title('Error')
%     grid on
% 
%     subplot(3,3,9)
%     plot(expData.t, expData.velocity)
%     xlim([expData.t(optPlotStart) expData.t(optPlotEnd)])
%     xlabel('Time [s]'); ylabel('v_m [m/s]'); title('Velocity')
%     grid on
%     % close(1)
% end
