function [expData] = Func_getDataFromHost(data)
% Retrieve data set from epxeriment and save it as expData.mat
%   INPUT:
%       Data = Scope object with data
%   OUTPUT:
%       expData = Use to import experiment data into workspace

% ======================================================================
% Data parameters for export

expData.t = data.Time(:,end);

expData.reference  = data.Data(:,1);
expData.commAngle       = data.Data(:,2);

expData.waveform.true.S1 = data.Data(:,3);
expData.waveform.true.S2 = data.Data(:,4);
expData.waveform.true.C1 = data.Data(:,5);
expData.waveform.true.C2 = data.Data(:,6);

expData.waveform.analog.S1 = data.Data(:,7);
expData.waveform.analog.S2 = data.Data(:,8);
expData.waveform.analog.C1 = data.Data(:,9);
expData.waveform.analog.C2 = data.Data(:,10);

expData.enc.sinUnc = data.Data(:,11);
expData.enc.cosUnc = data.Data(:,12);
expData.enc.sin = data.Data(:,13);
expData.enc.cos = data.Data(:,14);
expData.enc.count = data.Data(:,15);
expData.enc.interpolate = data.Data(:,16);

expData.position = data.Data(:,17);
expData.velocity = data.Data(:,18);
expData.idealPos = data.Data(:,19);
expData.error = data.Data(:,20);


% ======================================================================

save('expData.mat','expData');

end

