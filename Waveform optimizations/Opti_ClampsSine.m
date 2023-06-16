function V_result = Opti_ClampsSine(x)%% Global variablesglobal ClampsSineWidth ClampsSineAmp  x_resultpWaveformFrequency  = 1;    % Step frequency in [Hz]. Positive for forward, negative for backwards% Clamp and shear amplitudes and offset determiningpShearMax = 150;    % [V]pShearMin = -150;   % [V]pShearAmpl = (pShearMax - pShearMin) / 2;pShearOffs = (pShearMax + pShearMin) / 2;pShearSatMax = 250;    % [V]pShearSatMin = -250;   % [V]pClampMax = 60;     % [V]pClampMin = -30;    % [V]pClampAmpl = (pClampMax - pClampMin) / 2;pClampOffs = (pClampMax + pClampMin) / 2;pClampSatMax = 60;    % [V]pClampSatMin = -30;   % [V]pShearStep = (3.5e-6)*((pShearMax-pShearMin)/500);    % [m/wave]% Amplitude gain for analog output of SpeedgoatpAmpGain = 1./[25, 25, 7.5, 7.5];%% Other waveform parametersClamp2Width = 0.001;Clamp2Amp = 0;Clamp1Width = 0.001;Clamp1Amp = 0;ShearWidth = 0.001;ShearAmp = 0;%% Model namesys_name = 'Waveformmodel';load_system(sys_name);%% Set actual optimization valuesClampsSineWidth   = x(1);  % shear sinusoid widthClampsSineAmp     = x(2);  % shear sinusoid height%% Build matrix of optimization parameter valuesx_result = [x_result; x'];%% Simulationoptions = simset('SrcWorkspace','current');results = sim(sys_name,[],options);% Consider last value of the computed output vector V_result = results.y;%% Checks% % Check whether cycle could be finished exactly in N_sim computational steps;% % if cycle duration is less than N_sim, set output to infinite% if (max(size(results.t)) < N_sim)%      V_result = Inf;% end