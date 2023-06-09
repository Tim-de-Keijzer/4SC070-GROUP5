function bio=Modelbio
bio = [];
bio(1).blkName='Gain';
bio(1).sigName='Error';
bio(1).portIdx=0;
bio(1).dim=[1,1];
bio(1).sigWidth=1;
bio(1).sigAddress='&Model_B.Error';
bio(1).ndims=2;
bio(1).size=[];
bio(1).isStruct=false;
bio(getlenBIO) = bio(1);

bio(2).blkName='Gain1';
bio(2).sigName='Velocity';
bio(2).portIdx=0;
bio(2).dim=[1,1];
bio(2).sigWidth=1;
bio(2).sigAddress='&Model_B.Velocity';
bio(2).ndims=2;
bio(2).size=[];
bio(2).isStruct=false;

bio(3).blkName='Gain2';
bio(3).sigName='Position';
bio(3).portIdx=0;
bio(3).dim=[1,1];
bio(3).sigWidth=1;
bio(3).sigAddress='&Model_B.Position';
bio(3).ndims=2;
bio(3).size=[];
bio(3).isStruct=false;

bio(4).blkName='Gain3';
bio(4).sigName='CommAngle';
bio(4).portIdx=0;
bio(4).dim=[1,1];
bio(4).sigWidth=1;
bio(4).sigAddress='&Model_B.CommAngle';
bio(4).ndims=2;
bio(4).size=[];
bio(4).isStruct=false;

bio(5).blkName='Gain4';
bio(5).sigName='ClampAnl';
bio(5).portIdx=0;
bio(5).dim=[2,1];
bio(5).sigWidth=2;
bio(5).sigAddress='&Model_B.ClampAnl[0]';
bio(5).ndims=2;
bio(5).size=[];
bio(5).isStruct=false;

bio(6).blkName='Gain5';
bio(6).sigName='ShearAnl';
bio(6).portIdx=0;
bio(6).dim=[2,1];
bio(6).sigWidth=2;
bio(6).sigAddress='&Model_B.ShearAnl[0]';
bio(6).ndims=2;
bio(6).size=[];
bio(6).isStruct=false;

bio(7).blkName='Control/Gain1';
bio(7).sigName='reference';
bio(7).portIdx=0;
bio(7).dim=[1,1];
bio(7).sigWidth=1;
bio(7).sigAddress='&Model_B.reference';
bio(7).ndims=2;
bio(7).size=[];
bio(7).isStruct=false;

bio(8).blkName='Control/Add1';
bio(8).sigName='error';
bio(8).portIdx=0;
bio(8).dim=[1,1];
bio(8).sigWidth=1;
bio(8).sigAddress='&Model_B.error';
bio(8).ndims=2;
bio(8).size=[];
bio(8).isStruct=false;

bio(9).blkName='Control/Sum';
bio(9).sigName='';
bio(9).portIdx=0;
bio(9).dim=[1,1];
bio(9).sigWidth=1;
bio(9).sigAddress='&Model_B.Sum_g';
bio(9).ndims=2;
bio(9).size=[];
bio(9).isStruct=false;

bio(10).blkName='Signals/IO397 Analog Input/p1';
bio(10).sigName='';
bio(10).portIdx=0;
bio(10).dim=[1,1];
bio(10).sigWidth=1;
bio(10).sigAddress='&Model_B.IO397AnalogInput_o1';
bio(10).ndims=2;
bio(10).size=[];
bio(10).isStruct=false;

bio(11).blkName='Signals/IO397 Analog Input/p2';
bio(11).sigName='';
bio(11).portIdx=1;
bio(11).dim=[1,1];
bio(11).sigWidth=1;
bio(11).sigAddress='&Model_B.IO397AnalogInput_o2';
bio(11).ndims=2;
bio(11).size=[];
bio(11).isStruct=false;

bio(12).blkName='Signals/IO397 Analog Input/p3';
bio(12).sigName='';
bio(12).portIdx=2;
bio(12).dim=[1,1];
bio(12).sigWidth=1;
bio(12).sigAddress='&Model_B.IO397AnalogInput_o3';
bio(12).ndims=2;
bio(12).size=[];
bio(12).isStruct=false;

bio(13).blkName='Signals/IO397 Analog Input/p4';
bio(13).sigName='';
bio(13).portIdx=3;
bio(13).dim=[1,1];
bio(13).sigWidth=1;
bio(13).sigAddress='&Model_B.IO397AnalogInput_o4';
bio(13).ndims=2;
bio(13).size=[];
bio(13).isStruct=false;

bio(14).blkName='Signals/IO397 Analog Input1/p1';
bio(14).sigName='';
bio(14).portIdx=0;
bio(14).dim=[1,1];
bio(14).sigWidth=1;
bio(14).sigAddress='&Model_B.IO397AnalogInput1_o1';
bio(14).ndims=2;
bio(14).size=[];
bio(14).isStruct=false;

bio(15).blkName='Signals/IO397 Analog Input1/p2';
bio(15).sigName='';
bio(15).portIdx=1;
bio(15).dim=[1,1];
bio(15).sigWidth=1;
bio(15).sigAddress='&Model_B.IO397AnalogInput1_o2';
bio(15).ndims=2;
bio(15).size=[];
bio(15).isStruct=false;

bio(16).blkName='Control/Repeating Sequence/Clock';
bio(16).sigName='';
bio(16).portIdx=0;
bio(16).dim=[1,1];
bio(16).sigWidth=1;
bio(16).sigAddress='&Model_B.Clock';
bio(16).ndims=2;
bio(16).size=[];
bio(16).isStruct=false;

bio(17).blkName='Control/Repeating Sequence/Output';
bio(17).sigName='';
bio(17).portIdx=0;
bio(17).dim=[1,1];
bio(17).sigWidth=1;
bio(17).sigAddress='&Model_B.Output';
bio(17).ndims=2;
bio(17).size=[];
bio(17).isStruct=false;

bio(18).blkName='Control/Repeating Sequence/Look-Up Table1';
bio(18).sigName='';
bio(18).portIdx=0;
bio(18).dim=[1,1];
bio(18).sigWidth=1;
bio(18).sigAddress='&Model_B.LookUpTable1';
bio(18).ndims=2;
bio(18).size=[];
bio(18).isStruct=false;

bio(19).blkName='Control/Repeating Sequence/Math Function';
bio(19).sigName='';
bio(19).portIdx=0;
bio(19).dim=[1,1];
bio(19).sigWidth=1;
bio(19).sigAddress='&Model_B.MathFunction';
bio(19).ndims=2;
bio(19).size=[];
bio(19).isStruct=false;

bio(20).blkName='Control/Repeating Sequence/Sum';
bio(20).sigName='';
bio(20).portIdx=0;
bio(20).dim=[1,1];
bio(20).sigWidth=1;
bio(20).sigAddress='&Model_B.Sum';
bio(20).ndims=2;
bio(20).size=[];
bio(20).isStruct=false;

bio(21).blkName='Control/SinCos Decoder/MATLAB Function/p1';
bio(21).sigName='';
bio(21).portIdx=0;
bio(21).dim=[1,1];
bio(21).sigWidth=1;
bio(21).sigAddress='&Model_B.sinC';
bio(21).ndims=2;
bio(21).size=[];
bio(21).isStruct=false;

bio(22).blkName='Control/SinCos Decoder/MATLAB Function/p2';
bio(22).sigName='';
bio(22).portIdx=1;
bio(22).dim=[1,1];
bio(22).sigWidth=1;
bio(22).sigAddress='&Model_B.cosC';
bio(22).ndims=2;
bio(22).size=[];
bio(22).isStruct=false;

bio(23).blkName='Control/SinCos Decoder/Gain1';
bio(23).sigName='encRef';
bio(23).portIdx=0;
bio(23).dim=[2,1];
bio(23).sigWidth=2;
bio(23).sigAddress='&Model_B.encRef[0]';
bio(23).ndims=2;
bio(23).size=[];
bio(23).isStruct=false;

bio(24).blkName='Control/SinCos Decoder/Gain10';
bio(24).sigName='encCosUnc';
bio(24).portIdx=0;
bio(24).dim=[1,1];
bio(24).sigWidth=1;
bio(24).sigAddress='&Model_B.encCosUnc';
bio(24).ndims=2;
bio(24).size=[];
bio(24).isStruct=false;

bio(25).blkName='Control/SinCos Decoder/Gain11';
bio(25).sigName='idealPos';
bio(25).portIdx=0;
bio(25).dim=[1,1];
bio(25).sigWidth=1;
bio(25).sigAddress='&Model_B.idealPos';
bio(25).ndims=2;
bio(25).size=[];
bio(25).isStruct=false;

bio(26).blkName='Control/SinCos Decoder/Gain2';
bio(26).sigName='';
bio(26).portIdx=0;
bio(26).dim=[1,1];
bio(26).sigWidth=1;
bio(26).sigAddress='&Model_B.Gain2';
bio(26).ndims=2;
bio(26).size=[];
bio(26).isStruct=false;

bio(27).blkName='Control/SinCos Decoder/Gain3';
bio(27).sigName='encCount';
bio(27).portIdx=0;
bio(27).dim=[1,1];
bio(27).sigWidth=1;
bio(27).sigAddress='&Model_B.encCount';
bio(27).ndims=2;
bio(27).size=[];
bio(27).isStruct=false;

bio(28).blkName='Control/SinCos Decoder/Gain4';
bio(28).sigName='';
bio(28).portIdx=0;
bio(28).dim=[1,1];
bio(28).sigWidth=1;
bio(28).sigAddress='&Model_B.Gain4';
bio(28).ndims=2;
bio(28).size=[];
bio(28).isStruct=false;

bio(29).blkName='Control/SinCos Decoder/Gain5';
bio(29).sigName='encSinCor';
bio(29).portIdx=0;
bio(29).dim=[1,1];
bio(29).sigWidth=1;
bio(29).sigAddress='&Model_B.encSinCor';
bio(29).ndims=2;
bio(29).size=[];
bio(29).isStruct=false;

bio(30).blkName='Control/SinCos Decoder/Gain6';
bio(30).sigName='encInt';
bio(30).portIdx=0;
bio(30).dim=[1,1];
bio(30).sigWidth=1;
bio(30).sigAddress='&Model_B.encInt';
bio(30).ndims=2;
bio(30).size=[];
bio(30).isStruct=false;

bio(31).blkName='Control/SinCos Decoder/Gain7';
bio(31).sigName='';
bio(31).portIdx=0;
bio(31).dim=[1,1];
bio(31).sigWidth=1;
bio(31).sigAddress='&Model_B.Gain7';
bio(31).ndims=2;
bio(31).size=[];
bio(31).isStruct=false;

bio(32).blkName='Control/SinCos Decoder/Gain8';
bio(32).sigName='encCosCor';
bio(32).portIdx=0;
bio(32).dim=[1,1];
bio(32).sigWidth=1;
bio(32).sigAddress='&Model_B.encCosCor';
bio(32).ndims=2;
bio(32).size=[];
bio(32).isStruct=false;

bio(33).blkName='Control/SinCos Decoder/Gain9';
bio(33).sigName='encSinUnc';
bio(33).portIdx=0;
bio(33).dim=[1,1];
bio(33).sigWidth=1;
bio(33).sigAddress='&Model_B.encSinUnc';
bio(33).ndims=2;
bio(33).size=[];
bio(33).isStruct=false;

bio(34).blkName='Control/SinCos Decoder/Divide';
bio(34).sigName='';
bio(34).portIdx=0;
bio(34).dim=[1,1];
bio(34).sigWidth=1;
bio(34).sigAddress='&Model_B.Divide';
bio(34).ndims=2;
bio(34).size=[];
bio(34).isStruct=false;

bio(35).blkName='Control/SinCos Decoder/Add';
bio(35).sigName='';
bio(35).portIdx=0;
bio(35).dim=[1,1];
bio(35).sigWidth=1;
bio(35).sigAddress='&Model_B.Add';
bio(35).ndims=2;
bio(35).size=[];
bio(35).isStruct=false;

bio(36).blkName='Control/SinCos Decoder/Add1';
bio(36).sigName='';
bio(36).portIdx=0;
bio(36).dim=[1,1];
bio(36).sigWidth=1;
bio(36).sigAddress='&Model_B.Add1';
bio(36).ndims=2;
bio(36).size=[];
bio(36).isStruct=false;

bio(37).blkName='Control/SinCos Decoder/Sum of Elements';
bio(37).sigName='';
bio(37).portIdx=0;
bio(37).dim=[1,1];
bio(37).sigWidth=1;
bio(37).sigAddress='&Model_B.SumofElements';
bio(37).ndims=2;
bio(37).size=[];
bio(37).isStruct=false;

bio(38).blkName='Control/SinCos Decoder/Sum of Elements1';
bio(38).sigName='';
bio(38).portIdx=0;
bio(38).dim=[1,1];
bio(38).sigWidth=1;
bio(38).sigAddress='&Model_B.SumofElements1';
bio(38).ndims=2;
bio(38).size=[];
bio(38).isStruct=false;

bio(39).blkName='Control/SinCos Decoder/Sum1';
bio(39).sigName='';
bio(39).portIdx=0;
bio(39).dim=[1,1];
bio(39).sigWidth=1;
bio(39).sigAddress='&Model_B.Sum1';
bio(39).ndims=2;
bio(39).size=[];
bio(39).isStruct=false;

bio(40).blkName='Control/SinCos Decoder/atan2';
bio(40).sigName='';
bio(40).portIdx=0;
bio(40).dim=[1,1];
bio(40).sigWidth=1;
bio(40).sigAddress='&Model_B.atan2_l';
bio(40).ndims=2;
bio(40).size=[];
bio(40).isStruct=false;

bio(41).blkName='Control/SinCos Decoder/Delay';
bio(41).sigName='';
bio(41).portIdx=0;
bio(41).dim=[1,1];
bio(41).sigWidth=1;
bio(41).sigAddress='&Model_B.Delay';
bio(41).ndims=2;
bio(41).size=[];
bio(41).isStruct=false;

bio(42).blkName='Control/Subsystem/Memory';
bio(42).sigName='';
bio(42).portIdx=0;
bio(42).dim=[1,1];
bio(42).sigWidth=1;
bio(42).sigAddress='&Model_B.Memory';
bio(42).ndims=2;
bio(42).size=[];
bio(42).isStruct=false;

bio(43).blkName='Control/Subsystem/Sum';
bio(43).sigName='index_counter';
bio(43).portIdx=0;
bio(43).dim=[1,1];
bio(43).sigWidth=1;
bio(43).sigAddress='&Model_B.index_counter';
bio(43).ndims=2;
bio(43).size=[];
bio(43).isStruct=false;

bio(44).blkName='Control/Subsystem/Direct Lookup Table (n-D)';
bio(44).sigName='';
bio(44).portIdx=0;
bio(44).dim=[1,1];
bio(44).sigWidth=1;
bio(44).sigAddress='&Model_B.DirectLookupTablenD';
bio(44).ndims=2;
bio(44).size=[];
bio(44).isStruct=false;

bio(45).blkName='Control/Waveform Generator/Gain1';
bio(45).sigName='';
bio(45).portIdx=0;
bio(45).dim=[2,1];
bio(45).sigWidth=2;
bio(45).sigAddress='&Model_B.Gain1[0]';
bio(45).ndims=2;
bio(45).size=[];
bio(45).isStruct=false;

bio(46).blkName='Control/Waveform Generator/Gain2';
bio(46).sigName='';
bio(46).portIdx=0;
bio(46).dim=[2,1];
bio(46).sigWidth=2;
bio(46).sigAddress='&Model_B.Gain2_j[0]';
bio(46).ndims=2;
bio(46).size=[];
bio(46).isStruct=false;

bio(47).blkName='Control/Waveform Generator/Gain3';
bio(47).sigName='ClampTru';
bio(47).portIdx=0;
bio(47).dim=[2,1];
bio(47).sigWidth=2;
bio(47).sigAddress='&Model_B.ClampTru[0]';
bio(47).ndims=2;
bio(47).size=[];
bio(47).isStruct=false;

bio(48).blkName='Control/Waveform Generator/Gain4';
bio(48).sigName='ShearTru';
bio(48).portIdx=0;
bio(48).dim=[2,1];
bio(48).sigWidth=2;
bio(48).sigAddress='&Model_B.ShearTru[0]';
bio(48).ndims=2;
bio(48).size=[];
bio(48).isStruct=false;

bio(49).blkName='Control/Waveform Generator/Gain7';
bio(49).sigName='';
bio(49).portIdx=0;
bio(49).dim=[4,1];
bio(49).sigWidth=4;
bio(49).sigAddress='&Model_B.Gain7_j[0]';
bio(49).ndims=2;
bio(49).size=[];
bio(49).isStruct=false;

bio(50).blkName='Control/Waveform Generator/Math Function';
bio(50).sigName='alpha_mod';
bio(50).portIdx=0;
bio(50).dim=[1,1];
bio(50).sigWidth=1;
bio(50).sigAddress='&Model_B.alpha_mod';
bio(50).ndims=2;
bio(50).size=[];
bio(50).isStruct=false;

bio(51).blkName='Control/Waveform Generator/Saturation';
bio(51).sigName='';
bio(51).portIdx=0;
bio(51).dim=[4,1];
bio(51).sigWidth=4;
bio(51).sigAddress='&Model_B.Saturation[0]';
bio(51).ndims=2;
bio(51).size=[];
bio(51).isStruct=false;

bio(52).blkName='Control/Waveform Generator/Sum';
bio(52).sigName='';
bio(52).portIdx=0;
bio(52).dim=[2,1];
bio(52).sigWidth=2;
bio(52).sigAddress='&Model_B.Sum_i[0]';
bio(52).ndims=2;
bio(52).size=[];
bio(52).isStruct=false;

bio(53).blkName='Control/Waveform Generator/Sum1';
bio(53).sigName='';
bio(53).portIdx=0;
bio(53).dim=[2,1];
bio(53).sigWidth=2;
bio(53).sigAddress='&Model_B.Sum1_o[0]';
bio(53).ndims=2;
bio(53).size=[];
bio(53).isStruct=false;

bio(54).blkName='Control/SinCos Decoder/Zero Detect Counter1/Hit  Crossing Neg';
bio(54).sigName='';
bio(54).portIdx=0;
bio(54).dim=[1,1];
bio(54).sigWidth=1;
bio(54).sigAddress='&Model_B.HitCrossingNeg';
bio(54).ndims=2;
bio(54).size=[];
bio(54).isStruct=false;

bio(55).blkName='Control/SinCos Decoder/Zero Detect Counter1/Hit  Crossing Pos';
bio(55).sigName='';
bio(55).portIdx=0;
bio(55).dim=[1,1];
bio(55).sigWidth=1;
bio(55).sigAddress='&Model_B.HitCrossingPos';
bio(55).ndims=2;
bio(55).size=[];
bio(55).isStruct=false;

bio(56).blkName='Control/SinCos Decoder/Zero Detect Counter1/Logical Operator Neg';
bio(56).sigName='';
bio(56).portIdx=0;
bio(56).dim=[1,1];
bio(56).sigWidth=1;
bio(56).sigAddress='&Model_B.LogicalOperatorNeg';
bio(56).ndims=2;
bio(56).size=[];
bio(56).isStruct=false;

bio(57).blkName='Control/SinCos Decoder/Zero Detect Counter1/Logical Operator Pos';
bio(57).sigName='';
bio(57).portIdx=0;
bio(57).dim=[1,1];
bio(57).sigWidth=1;
bio(57).sigAddress='&Model_B.LogicalOperatorPos';
bio(57).ndims=2;
bio(57).size=[];
bio(57).isStruct=false;

bio(58).blkName='Control/SinCos Decoder/Zero Detect Counter1/Add2';
bio(58).sigName='';
bio(58).portIdx=0;
bio(58).dim=[1,1];
bio(58).sigWidth=1;
bio(58).sigAddress='&Model_B.Add2';
bio(58).ndims=2;
bio(58).size=[];
bio(58).isStruct=false;

bio(59).blkName='Control/Waveform Generator/Scaling/Gain';
bio(59).sigName='alpha';
bio(59).portIdx=0;
bio(59).dim=[1,1];
bio(59).sigWidth=1;
bio(59).sigAddress='&Model_B.alpha';
bio(59).ndims=2;
bio(59).size=[];
bio(59).isStruct=false;

bio(60).blkName='Control/Waveform Generator/Scaling/Divide';
bio(60).sigName='';
bio(60).portIdx=0;
bio(60).dim=[1,1];
bio(60).sigWidth=1;
bio(60).sigAddress='&Model_B.Divide_g';
bio(60).ndims=2;
bio(60).size=[];
bio(60).isStruct=false;

bio(61).blkName='Control/Waveform Generator/Walking waveform/C1';
bio(61).sigName='C1';
bio(61).portIdx=0;
bio(61).dim=[1,1];
bio(61).sigWidth=1;
bio(61).sigAddress='&Model_B.C1';
bio(61).ndims=2;
bio(61).size=[];
bio(61).isStruct=false;

bio(62).blkName='Control/Waveform Generator/Walking waveform/C2';
bio(62).sigName='C2';
bio(62).portIdx=0;
bio(62).dim=[1,1];
bio(62).sigWidth=1;
bio(62).sigAddress='&Model_B.C2';
bio(62).ndims=2;
bio(62).size=[];
bio(62).isStruct=false;

bio(63).blkName='Control/Waveform Generator/Walking waveform/S1';
bio(63).sigName='S1';
bio(63).portIdx=0;
bio(63).dim=[1,1];
bio(63).sigWidth=1;
bio(63).sigAddress='&Model_B.S1';
bio(63).ndims=2;
bio(63).size=[];
bio(63).isStruct=false;

bio(64).blkName='Control/Waveform Generator/Walking waveform/S2';
bio(64).sigName='S2';
bio(64).portIdx=0;
bio(64).dim=[1,1];
bio(64).sigWidth=1;
bio(64).sigAddress='&Model_B.S2';
bio(64).ndims=2;
bio(64).size=[];
bio(64).isStruct=false;

bio(65).blkName='Control/SinCos Decoder/Zero Detect Counter1/Compare To Constant/Compare';
bio(65).sigName='';
bio(65).portIdx=0;
bio(65).dim=[1,1];
bio(65).sigWidth=1;
bio(65).sigAddress='&Model_B.Compare';
bio(65).ndims=2;
bio(65).size=[];
bio(65).isStruct=false;

bio(66).blkName='Control/SinCos Decoder/Zero Detect Counter1/NegCounter/Sum';
bio(66).sigName='';
bio(66).portIdx=0;
bio(66).dim=[1,1];
bio(66).sigWidth=1;
bio(66).sigAddress='&Model_B.Sum_d';
bio(66).ndims=2;
bio(66).size=[];
bio(66).isStruct=false;

bio(67).blkName='Control/SinCos Decoder/Zero Detect Counter1/NegCounter/Unit Delay';
bio(67).sigName='';
bio(67).portIdx=0;
bio(67).dim=[1,1];
bio(67).sigWidth=1;
bio(67).sigAddress='&Model_B.UnitDelay_p';
bio(67).ndims=2;
bio(67).size=[];
bio(67).isStruct=false;

bio(68).blkName='Control/SinCos Decoder/Zero Detect Counter1/PosCounter/Sum';
bio(68).sigName='';
bio(68).portIdx=0;
bio(68).dim=[1,1];
bio(68).sigWidth=1;
bio(68).sigAddress='&Model_B.Sum_a';
bio(68).ndims=2;
bio(68).size=[];
bio(68).isStruct=false;

bio(69).blkName='Control/SinCos Decoder/Zero Detect Counter1/PosCounter/Unit Delay';
bio(69).sigName='';
bio(69).portIdx=0;
bio(69).dim=[1,1];
bio(69).sigWidth=1;
bio(69).sigAddress='&Model_B.UnitDelay';
bio(69).ndims=2;
bio(69).size=[];
bio(69).isStruct=false;

function len = getlenBIO
len = 69;

