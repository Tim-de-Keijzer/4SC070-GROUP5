function [cosC, sinC, encCor] = Func_encoderCalibration(cosD,sinD,R,export)
% Lissajous correction via the Heydemann correction method
%   INPUT:
%       cosD    = Cosine or x input (collumn vector)
%       sinD    = Sine or y input (collumn vector)
%       R       = Max level of encoder output (single)
%       export  = Export encCorrection.mat file with correction values (Boolean)
%   OUTPUT:
%       cosC    = Corrected cosine or x input (collumn vector)
%       sinC    = Corrected sine or y input (collumn vector)
%       encCor  = Correction coefficients according to Heydemann method (struct)

u1 = cosD;
u2 = sinD;

% Scale amplitude of base signal to correct amplitude
ampC = R/((max(cosD)-min(cosD))/2);
u1 = u1 * ampC * 1.05;

% Least square optimization parameters
C   = [u1.^2 u2.^2 u1.*u2 u1 u2];
d   = ones(size(C,1),1);
A   = [];
b   = [];
Aeq = [];
beq = [];
lb  = [];
ub  = [];

% Do least square fit on data and get signal coefficients
optRes = lsqlin(C,d,A,b,Aeq,beq,lb,ub);
Aa = optRes(1);
Bb = optRes(2);
Cc = optRes(3);
Dd = optRes(4);
Ee = optRes(5);

% Heydemann correction on signals
aph = asin(Cc/sqrt(4*Aa*Bb));           % Reference signal quadrature error
r = sqrt(Bb/Aa);                        % Channel gain ratio
p = (2*Bb*Dd-Ee*Cc)/((Cc^2)-4*Aa*Bb);   % Offset in cosine
q = (2*Aa*Ee-Dd*Cc)/((Cc^2)-4*Aa*Bb);   % Offset in sine

% Output data
cosC = (u1 - p);
sinC = (1/cos(aph)) * ((u1 - p)*sin(aph) + r*(u2 - q));

encCor.AngleCorrection = aph;   % Reference signal quadrature error
encCor.CosineGain = ampC;       % Channel gain ratio
encCor.SineGain = r;            % Channel gain ratio
encCor.CosineOffset = p;        % Offset in cosine
encCor.SineOffset = q;          % Offset in sine

% Export .mat file with correction values
if export == 1
    save('encCorrection.mat','encCor')
end

% Plot result of correction
figure(1000)
hold on
plot(cosD,sinD)
plot(cosC,sinC)
rectangle('Position',[-R -R R*2 R*2],'Curvature',[1 1],'LineStyle',':')
xlim([-R*1.2 R*1.2]); ylim([-R*1.2 R*1.2])
xlabel('V_{cos}'); ylabel('V_{sin}'); title('Encoder correction'); legend('org','cor')
axis equal
grid on

end

