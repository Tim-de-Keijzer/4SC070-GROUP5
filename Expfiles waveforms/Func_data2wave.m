function [wave] = Func_data2wave(expData)
%Split experiment data into waveform periods.
%   INPUT:
%       expData    = Data set of experiment data (struct)
%   OUTPUT:
%       wave    = Split wave signals (struct with cells)

% Sampling time
wave.tSample = expData.t(2);
wave.fSample = 1/wave.tSample;

% Periods and samples
wave.nPeriod    = floor(1/(abs(expData.driveFrequency(1))*wave.tSample));
wave.amount     = floor(numel(expData.commAngle)/wave.nPeriod);

% Determine wave start and end points
for n = 1:wave.amount
    wave.org.startSample(n) = wave.nPeriod*(n-1) + 1;
    wave.org.endSample(n)   = wave.nPeriod*n;
end

% Take out every wave signal
for w = 1:wave.amount
    wave.t{w}       = expData.t(1:wave.nPeriod);
    wave.angle{w}   = linspace(0,2*pi,numel(wave.t{w}));
    
    wave.S1{w} = expData.waveform.true.S1(wave.org.startSample(w):wave.org.endSample(w));
    wave.S2{w} = expData.waveform.true.S2(wave.org.startSample(w):wave.org.endSample(w));

    wave.C1{w} = expData.waveform.true.C1(wave.org.startSample(w):wave.org.endSample(w));
    wave.C2{w} = expData.waveform.true.C2(wave.org.startSample(w):wave.org.endSample(w));

    wave.position{w}        = expData.position(wave.org.startSample(w):wave.org.endSample(w));    
    wave.positionZero{w}    = wave.position{w}-wave.position{w}(1);    
    wave.posPeak{w}         = (max(wave.position{w})-min(wave.position{w}))/2;
    wave.positionCenter{w}  = wave.position{w}-(wave.posPeak{w}+wave.position{w}(1));
    
    wave.error{w}       = expData.error(wave.org.startSample(w):wave.org.endSample(w));    
    wave.errorZero{w}   = wave.error{w}-wave.error{w}(1);    
end

end

