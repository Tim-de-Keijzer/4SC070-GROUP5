function xcp = Modelxcp

xcp.events     =  repmat(struct('id',{}, 'sampletime', {}, 'offset', {}), getNumEvents, 1 );
xcp.parameters =  repmat(struct('symbol',{}, 'size', {}, 'dtname', {}, 'baseaddr', {}), getNumParameters, 1 );
xcp.signals    =  repmat(struct('symbol',{}), getNumSignals, 1 );
xcp.models     =  cell(1,getNumModels);
    
xcp.models{1} = 'Model';
   
   
         
xcp.events(1).id         = 0;
xcp.events(1).sampletime = 0.0001;
xcp.events(1).offset     = 0.0;
    
xcp.signals(1).symbol =  'Model_B.Error';
    
xcp.signals(2).symbol =  'Model_B.Velocity';
    
xcp.signals(3).symbol =  'Model_B.Position';
    
xcp.signals(4).symbol =  'Model_B.CommAngle';
    
xcp.signals(5).symbol =  'Model_B.ClampAnl';
    
xcp.signals(6).symbol =  'Model_B.ShearAnl';
    
xcp.signals(7).symbol =  'Model_B.reference';
    
xcp.signals(8).symbol =  'Model_B.error';
    
xcp.signals(9).symbol =  'Model_B.Sum_g';
    
xcp.signals(10).symbol =  'Model_B.IO397AnalogInput_o1';
    
xcp.signals(11).symbol =  'Model_B.IO397AnalogInput_o2';
    
xcp.signals(12).symbol =  'Model_B.IO397AnalogInput_o3';
    
xcp.signals(13).symbol =  'Model_B.IO397AnalogInput_o4';
    
xcp.signals(14).symbol =  'Model_B.IO397AnalogInput1_o1';
    
xcp.signals(15).symbol =  'Model_B.IO397AnalogInput1_o2';
    
xcp.signals(16).symbol =  'Model_B.Clock';
    
xcp.signals(17).symbol =  'Model_B.Output';
    
xcp.signals(18).symbol =  'Model_B.LookUpTable1';
    
xcp.signals(19).symbol =  'Model_B.MathFunction';
    
xcp.signals(20).symbol =  'Model_B.Sum';
    
xcp.signals(21).symbol =  'Model_B.sinC';
    
xcp.signals(22).symbol =  'Model_B.cosC';
    
xcp.signals(23).symbol =  'Model_B.encRef';
    
xcp.signals(24).symbol =  'Model_B.encCosUnc';
    
xcp.signals(25).symbol =  'Model_B.idealPos';
    
xcp.signals(26).symbol =  'Model_B.Gain2';
    
xcp.signals(27).symbol =  'Model_B.encCount';
    
xcp.signals(28).symbol =  'Model_B.Gain4';
    
xcp.signals(29).symbol =  'Model_B.encSinCor';
    
xcp.signals(30).symbol =  'Model_B.encInt';
    
xcp.signals(31).symbol =  'Model_B.Gain7';
    
xcp.signals(32).symbol =  'Model_B.encCosCor';
    
xcp.signals(33).symbol =  'Model_B.encSinUnc';
    
xcp.signals(34).symbol =  'Model_B.Divide';
    
xcp.signals(35).symbol =  'Model_B.Add';
    
xcp.signals(36).symbol =  'Model_B.Add1';
    
xcp.signals(37).symbol =  'Model_B.SumofElements';
    
xcp.signals(38).symbol =  'Model_B.SumofElements1';
    
xcp.signals(39).symbol =  'Model_B.Sum1';
    
xcp.signals(40).symbol =  'Model_B.atan2_l';
    
xcp.signals(41).symbol =  'Model_B.Delay';
    
xcp.signals(42).symbol =  'Model_B.Memory';
    
xcp.signals(43).symbol =  'Model_B.index_counter';
    
xcp.signals(44).symbol =  'Model_B.DirectLookupTablenD';
    
xcp.signals(45).symbol =  'Model_B.Gain1';
    
xcp.signals(46).symbol =  'Model_B.Gain2_j';
    
xcp.signals(47).symbol =  'Model_B.ClampTru';
    
xcp.signals(48).symbol =  'Model_B.ShearTru';
    
xcp.signals(49).symbol =  'Model_B.Gain7_j';
    
xcp.signals(50).symbol =  'Model_B.alpha_mod';
    
xcp.signals(51).symbol =  'Model_B.Saturation';
    
xcp.signals(52).symbol =  'Model_B.Sum_i';
    
xcp.signals(53).symbol =  'Model_B.Sum1_o';
    
xcp.signals(54).symbol =  'Model_B.HitCrossingNeg';
    
xcp.signals(55).symbol =  'Model_B.HitCrossingPos';
    
xcp.signals(56).symbol =  'Model_B.LogicalOperatorNeg';
    
xcp.signals(57).symbol =  'Model_B.LogicalOperatorPos';
    
xcp.signals(58).symbol =  'Model_B.Add2';
    
xcp.signals(59).symbol =  'Model_B.alpha';
    
xcp.signals(60).symbol =  'Model_B.Divide_g';
    
xcp.signals(61).symbol =  'Model_B.C1';
    
xcp.signals(62).symbol =  'Model_B.C2';
    
xcp.signals(63).symbol =  'Model_B.S1';
    
xcp.signals(64).symbol =  'Model_B.S2';
    
xcp.signals(65).symbol =  'Model_B.Compare';
    
xcp.signals(66).symbol =  'Model_B.Sum_d';
    
xcp.signals(67).symbol =  'Model_B.UnitDelay_p';
    
xcp.signals(68).symbol =  'Model_B.Sum_a';
    
xcp.signals(69).symbol =  'Model_B.UnitDelay';
         
xcp.parameters(1).symbol = 'Model_P.Gain_Gain_l';
xcp.parameters(1).size   =  1;       
xcp.parameters(1).dtname = 'real_T'; 
xcp.parameters(2).baseaddr = '&Model_P.Gain_Gain_l';     
         
xcp.parameters(2).symbol = 'Model_P.Gain1_Gain_d';
xcp.parameters(2).size   =  1;       
xcp.parameters(2).dtname = 'real_T'; 
xcp.parameters(3).baseaddr = '&Model_P.Gain1_Gain_d';     
         
xcp.parameters(3).symbol = 'Model_P.Gain2_Gain';
xcp.parameters(3).size   =  1;       
xcp.parameters(3).dtname = 'real_T'; 
xcp.parameters(4).baseaddr = '&Model_P.Gain2_Gain';     
         
xcp.parameters(4).symbol = 'Model_P.Gain3_Gain_a';
xcp.parameters(4).size   =  1;       
xcp.parameters(4).dtname = 'real_T'; 
xcp.parameters(5).baseaddr = '&Model_P.Gain3_Gain_a';     
         
xcp.parameters(5).symbol = 'Model_P.Gain4_Gain_p';
xcp.parameters(5).size   =  1;       
xcp.parameters(5).dtname = 'real_T'; 
xcp.parameters(6).baseaddr = '&Model_P.Gain4_Gain_p';     
         
xcp.parameters(6).symbol = 'Model_P.Gain5_Gain_k';
xcp.parameters(6).size   =  1;       
xcp.parameters(6).dtname = 'real_T'; 
xcp.parameters(7).baseaddr = '&Model_P.Gain5_Gain_k';     
         
xcp.parameters(7).symbol = 'Model_P.RepeatingSequence_rep_seq_y';
xcp.parameters(7).size   =  3;       
xcp.parameters(7).dtname = 'real_T'; 
xcp.parameters(8).baseaddr = '&Model_P.RepeatingSequence_rep_seq_y[0]';     
         
xcp.parameters(8).symbol = 'Model_P.Gain1_Gain';
xcp.parameters(8).size   =  1;       
xcp.parameters(8).dtname = 'real_T'; 
xcp.parameters(9).baseaddr = '&Model_P.Gain1_Gain';     
         
xcp.parameters(9).symbol = 'Model_P.IO397AnalogInput_P1';
xcp.parameters(9).size   =  1;       
xcp.parameters(9).dtname = 'real_T'; 
xcp.parameters(10).baseaddr = '&Model_P.IO397AnalogInput_P1';     
         
xcp.parameters(10).symbol = 'Model_P.IO397AnalogInput_P2';
xcp.parameters(10).size   =  1;       
xcp.parameters(10).dtname = 'real_T'; 
xcp.parameters(11).baseaddr = '&Model_P.IO397AnalogInput_P2';     
         
xcp.parameters(11).symbol = 'Model_P.IO397AnalogInput_P3';
xcp.parameters(11).size   =  4;       
xcp.parameters(11).dtname = 'real_T'; 
xcp.parameters(12).baseaddr = '&Model_P.IO397AnalogInput_P3[0]';     
         
xcp.parameters(12).symbol = 'Model_P.IO397AnalogInput_P4';
xcp.parameters(12).size   =  1;       
xcp.parameters(12).dtname = 'real_T'; 
xcp.parameters(13).baseaddr = '&Model_P.IO397AnalogInput_P4';     
         
xcp.parameters(13).symbol = 'Model_P.IO397AnalogInput_P5';
xcp.parameters(13).size   =  1;       
xcp.parameters(13).dtname = 'real_T'; 
xcp.parameters(14).baseaddr = '&Model_P.IO397AnalogInput_P5';     
         
xcp.parameters(14).symbol = 'Model_P.IO397AnalogInput_P6';
xcp.parameters(14).size   =  1;       
xcp.parameters(14).dtname = 'real_T'; 
xcp.parameters(15).baseaddr = '&Model_P.IO397AnalogInput_P6';     
         
xcp.parameters(15).symbol = 'Model_P.IO397AnalogInput_P7';
xcp.parameters(15).size   =  2;       
xcp.parameters(15).dtname = 'real_T'; 
xcp.parameters(16).baseaddr = '&Model_P.IO397AnalogInput_P7[0]';     
         
xcp.parameters(16).symbol = 'Model_P.IO397AnalogInput1_P1';
xcp.parameters(16).size   =  1;       
xcp.parameters(16).dtname = 'real_T'; 
xcp.parameters(17).baseaddr = '&Model_P.IO397AnalogInput1_P1';     
         
xcp.parameters(17).symbol = 'Model_P.IO397AnalogInput1_P2';
xcp.parameters(17).size   =  1;       
xcp.parameters(17).dtname = 'real_T'; 
xcp.parameters(18).baseaddr = '&Model_P.IO397AnalogInput1_P2';     
         
xcp.parameters(18).symbol = 'Model_P.IO397AnalogInput1_P3';
xcp.parameters(18).size   =  2;       
xcp.parameters(18).dtname = 'real_T'; 
xcp.parameters(19).baseaddr = '&Model_P.IO397AnalogInput1_P3[0]';     
         
xcp.parameters(19).symbol = 'Model_P.IO397AnalogInput1_P4';
xcp.parameters(19).size   =  1;       
xcp.parameters(19).dtname = 'real_T'; 
xcp.parameters(20).baseaddr = '&Model_P.IO397AnalogInput1_P4';     
         
xcp.parameters(20).symbol = 'Model_P.IO397AnalogInput1_P5';
xcp.parameters(20).size   =  1;       
xcp.parameters(20).dtname = 'real_T'; 
xcp.parameters(21).baseaddr = '&Model_P.IO397AnalogInput1_P5';     
         
xcp.parameters(21).symbol = 'Model_P.IO397AnalogInput1_P6';
xcp.parameters(21).size   =  1;       
xcp.parameters(21).dtname = 'real_T'; 
xcp.parameters(22).baseaddr = '&Model_P.IO397AnalogInput1_P6';     
         
xcp.parameters(22).symbol = 'Model_P.IO397AnalogInput1_P7';
xcp.parameters(22).size   =  2;       
xcp.parameters(22).dtname = 'real_T'; 
xcp.parameters(23).baseaddr = '&Model_P.IO397AnalogInput1_P7[0]';     
         
xcp.parameters(23).symbol = 'Model_P.IO397AnalogOutput1_P1';
xcp.parameters(23).size   =  1;       
xcp.parameters(23).dtname = 'real_T'; 
xcp.parameters(24).baseaddr = '&Model_P.IO397AnalogOutput1_P1';     
         
xcp.parameters(24).symbol = 'Model_P.IO397AnalogOutput1_P2';
xcp.parameters(24).size   =  1;       
xcp.parameters(24).dtname = 'real_T'; 
xcp.parameters(25).baseaddr = '&Model_P.IO397AnalogOutput1_P2';     
         
xcp.parameters(25).symbol = 'Model_P.IO397AnalogOutput1_P3';
xcp.parameters(25).size   =  4;       
xcp.parameters(25).dtname = 'real_T'; 
xcp.parameters(26).baseaddr = '&Model_P.IO397AnalogOutput1_P3[0]';     
         
xcp.parameters(26).symbol = 'Model_P.IO397AnalogOutput1_P4';
xcp.parameters(26).size   =  4;       
xcp.parameters(26).dtname = 'real_T'; 
xcp.parameters(27).baseaddr = '&Model_P.IO397AnalogOutput1_P4[0]';     
         
xcp.parameters(27).symbol = 'Model_P.IO397AnalogOutput1_P5';
xcp.parameters(27).size   =  4;       
xcp.parameters(27).dtname = 'real_T'; 
xcp.parameters(28).baseaddr = '&Model_P.IO397AnalogOutput1_P5[0]';     
         
xcp.parameters(28).symbol = 'Model_P.IO397AnalogOutput1_P6';
xcp.parameters(28).size   =  1;       
xcp.parameters(28).dtname = 'real_T'; 
xcp.parameters(29).baseaddr = '&Model_P.IO397AnalogOutput1_P6';     
         
xcp.parameters(29).symbol = 'Model_P.IO397AnalogOutput1_P7';
xcp.parameters(29).size   =  2;       
xcp.parameters(29).dtname = 'real_T'; 
xcp.parameters(30).baseaddr = '&Model_P.IO397AnalogOutput1_P7[0]';     
         
xcp.parameters(30).symbol = 'Model_P.IO397AnalogOutput1_P8';
xcp.parameters(30).size   =  1;       
xcp.parameters(30).dtname = 'real_T'; 
xcp.parameters(31).baseaddr = '&Model_P.IO397AnalogOutput1_P8';     
         
xcp.parameters(31).symbol = 'Model_P.Constant_Value';
xcp.parameters(31).size   =  1;       
xcp.parameters(31).dtname = 'real_T'; 
xcp.parameters(32).baseaddr = '&Model_P.Constant_Value';     
         
xcp.parameters(32).symbol = 'Model_P.LookUpTable1_bp01Data';
xcp.parameters(32).size   =  3;       
xcp.parameters(32).dtname = 'real_T'; 
xcp.parameters(33).baseaddr = '&Model_P.LookUpTable1_bp01Data[0]';     
         
xcp.parameters(33).symbol = 'Model_P.Gain1_Gain_n';
xcp.parameters(33).size   =  1;       
xcp.parameters(33).dtname = 'real_T'; 
xcp.parameters(34).baseaddr = '&Model_P.Gain1_Gain_n';     
         
xcp.parameters(34).symbol = 'Model_P.Gain10_Gain';
xcp.parameters(34).size   =  1;       
xcp.parameters(34).dtname = 'real_T'; 
xcp.parameters(35).baseaddr = '&Model_P.Gain10_Gain';     
         
xcp.parameters(35).symbol = 'Model_P.Gain11_Gain';
xcp.parameters(35).size   =  1;       
xcp.parameters(35).dtname = 'real_T'; 
xcp.parameters(36).baseaddr = '&Model_P.Gain11_Gain';     
         
xcp.parameters(36).symbol = 'Model_P.Gain3_Gain';
xcp.parameters(36).size   =  1;       
xcp.parameters(36).dtname = 'real_T'; 
xcp.parameters(37).baseaddr = '&Model_P.Gain3_Gain';     
         
xcp.parameters(37).symbol = 'Model_P.Gain4_Gain';
xcp.parameters(37).size   =  1;       
xcp.parameters(37).dtname = 'real_T'; 
xcp.parameters(38).baseaddr = '&Model_P.Gain4_Gain';     
         
xcp.parameters(38).symbol = 'Model_P.Gain5_Gain';
xcp.parameters(38).size   =  1;       
xcp.parameters(38).dtname = 'real_T'; 
xcp.parameters(39).baseaddr = '&Model_P.Gain5_Gain';     
         
xcp.parameters(39).symbol = 'Model_P.Gain6_Gain';
xcp.parameters(39).size   =  1;       
xcp.parameters(39).dtname = 'real_T'; 
xcp.parameters(40).baseaddr = '&Model_P.Gain6_Gain';     
         
xcp.parameters(40).symbol = 'Model_P.Gain7_Gain';
xcp.parameters(40).size   =  1;       
xcp.parameters(40).dtname = 'real_T'; 
xcp.parameters(41).baseaddr = '&Model_P.Gain7_Gain';     
         
xcp.parameters(41).symbol = 'Model_P.Gain8_Gain';
xcp.parameters(41).size   =  1;       
xcp.parameters(41).dtname = 'real_T'; 
xcp.parameters(42).baseaddr = '&Model_P.Gain8_Gain';     
         
xcp.parameters(42).symbol = 'Model_P.Gain9_Gain';
xcp.parameters(42).size   =  1;       
xcp.parameters(42).dtname = 'real_T'; 
xcp.parameters(43).baseaddr = '&Model_P.Gain9_Gain';     
         
xcp.parameters(43).symbol = 'Model_P.Delay_InitialCondition';
xcp.parameters(43).size   =  1;       
xcp.parameters(43).dtname = 'real_T'; 
xcp.parameters(44).baseaddr = '&Model_P.Delay_InitialCondition';     
         
xcp.parameters(44).symbol = 'Model_P.Constant_Value_i';
xcp.parameters(44).size   =  1;       
xcp.parameters(44).dtname = 'real_T'; 
xcp.parameters(45).baseaddr = '&Model_P.Constant_Value_i';     
         
xcp.parameters(45).symbol = 'Model_P.Memory_InitialCondition';
xcp.parameters(45).size   =  1;       
xcp.parameters(45).dtname = 'real_T'; 
xcp.parameters(46).baseaddr = '&Model_P.Memory_InitialCondition';     
         
xcp.parameters(46).symbol = 'Model_P.Constant2_Value';
xcp.parameters(46).size   =  1;       
xcp.parameters(46).dtname = 'real_T'; 
xcp.parameters(47).baseaddr = '&Model_P.Constant2_Value';     
         
xcp.parameters(47).symbol = 'Model_P.Gain3_Gain_o';
xcp.parameters(47).size   =  1;       
xcp.parameters(47).dtname = 'real_T'; 
xcp.parameters(48).baseaddr = '&Model_P.Gain3_Gain_o';     
         
xcp.parameters(48).symbol = 'Model_P.Gain4_Gain_c';
xcp.parameters(48).size   =  1;       
xcp.parameters(48).dtname = 'real_T'; 
xcp.parameters(49).baseaddr = '&Model_P.Gain4_Gain_c';     
         
xcp.parameters(49).symbol = 'Model_P.Saturation_UpperSat';
xcp.parameters(49).size   =  4;       
xcp.parameters(49).dtname = 'real_T'; 
xcp.parameters(50).baseaddr = '&Model_P.Saturation_UpperSat[0]';     
         
xcp.parameters(50).symbol = 'Model_P.Saturation_LowerSat';
xcp.parameters(50).size   =  4;       
xcp.parameters(50).dtname = 'real_T'; 
xcp.parameters(51).baseaddr = '&Model_P.Saturation_LowerSat[0]';     
         
xcp.parameters(51).symbol = 'Model_P.CompareToConstant_const';
xcp.parameters(51).size   =  1;       
xcp.parameters(51).dtname = 'real_T'; 
xcp.parameters(52).baseaddr = '&Model_P.CompareToConstant_const';     
         
xcp.parameters(52).symbol = 'Model_P.HitCrossingNeg_Offset';
xcp.parameters(52).size   =  1;       
xcp.parameters(52).dtname = 'real_T'; 
xcp.parameters(53).baseaddr = '&Model_P.HitCrossingNeg_Offset';     
         
xcp.parameters(53).symbol = 'Model_P.HitCrossingPos_Offset';
xcp.parameters(53).size   =  1;       
xcp.parameters(53).dtname = 'real_T'; 
xcp.parameters(54).baseaddr = '&Model_P.HitCrossingPos_Offset';     
         
xcp.parameters(54).symbol = 'Model_P.Gain_Gain';
xcp.parameters(54).size   =  1;       
xcp.parameters(54).dtname = 'real_T'; 
xcp.parameters(55).baseaddr = '&Model_P.Gain_Gain';     
         
xcp.parameters(55).symbol = 'Model_P.C1_tableData';
xcp.parameters(55).size   =  6;       
xcp.parameters(55).dtname = 'real_T'; 
xcp.parameters(56).baseaddr = '&Model_P.C1_tableData[0]';     
         
xcp.parameters(56).symbol = 'Model_P.C1_bp01Data';
xcp.parameters(56).size   =  6;       
xcp.parameters(56).dtname = 'real_T'; 
xcp.parameters(57).baseaddr = '&Model_P.C1_bp01Data[0]';     
         
xcp.parameters(57).symbol = 'Model_P.C2_tableData';
xcp.parameters(57).size   =  6;       
xcp.parameters(57).dtname = 'real_T'; 
xcp.parameters(58).baseaddr = '&Model_P.C2_tableData[0]';     
         
xcp.parameters(58).symbol = 'Model_P.C2_bp01Data';
xcp.parameters(58).size   =  6;       
xcp.parameters(58).dtname = 'real_T'; 
xcp.parameters(59).baseaddr = '&Model_P.C2_bp01Data[0]';     
         
xcp.parameters(59).symbol = 'Model_P.S1_tableData';
xcp.parameters(59).size   =  4;       
xcp.parameters(59).dtname = 'real_T'; 
xcp.parameters(60).baseaddr = '&Model_P.S1_tableData[0]';     
         
xcp.parameters(60).symbol = 'Model_P.S1_bp01Data';
xcp.parameters(60).size   =  4;       
xcp.parameters(60).dtname = 'real_T'; 
xcp.parameters(61).baseaddr = '&Model_P.S1_bp01Data[0]';     
         
xcp.parameters(61).symbol = 'Model_P.S2_tableData';
xcp.parameters(61).size   =  4;       
xcp.parameters(61).dtname = 'real_T'; 
xcp.parameters(62).baseaddr = '&Model_P.S2_tableData[0]';     
         
xcp.parameters(62).symbol = 'Model_P.S2_bp01Data';
xcp.parameters(62).size   =  4;       
xcp.parameters(62).dtname = 'real_T'; 
xcp.parameters(63).baseaddr = '&Model_P.S2_bp01Data[0]';     
         
xcp.parameters(63).symbol = 'Model_P.Counts_Y0';
xcp.parameters(63).size   =  1;       
xcp.parameters(63).dtname = 'real_T'; 
xcp.parameters(64).baseaddr = '&Model_P.Counts_Y0';     
         
xcp.parameters(64).symbol = 'Model_P.Constant_neg_Value';
xcp.parameters(64).size   =  1;       
xcp.parameters(64).dtname = 'real_T'; 
xcp.parameters(65).baseaddr = '&Model_P.Constant_neg_Value';     
         
xcp.parameters(65).symbol = 'Model_P.UnitDelay_InitialCondition';
xcp.parameters(65).size   =  1;       
xcp.parameters(65).dtname = 'real_T'; 
xcp.parameters(66).baseaddr = '&Model_P.UnitDelay_InitialCondition';     
         
xcp.parameters(66).symbol = 'Model_P.Counts_Y0_h';
xcp.parameters(66).size   =  1;       
xcp.parameters(66).dtname = 'real_T'; 
xcp.parameters(67).baseaddr = '&Model_P.Counts_Y0_h';     
         
xcp.parameters(67).symbol = 'Model_P.Constant_pos_Value';
xcp.parameters(67).size   =  1;       
xcp.parameters(67).dtname = 'real_T'; 
xcp.parameters(68).baseaddr = '&Model_P.Constant_pos_Value';     
         
xcp.parameters(68).symbol = 'Model_P.UnitDelay_InitialCondition_n';
xcp.parameters(68).size   =  1;       
xcp.parameters(68).dtname = 'real_T'; 
xcp.parameters(69).baseaddr = '&Model_P.UnitDelay_InitialCondition_n';     
         
xcp.parameters(69).symbol = 'Model_P.pAmpGain';
xcp.parameters(69).size   =  4;       
xcp.parameters(69).dtname = 'real_T'; 
xcp.parameters(70).baseaddr = '&Model_P.pAmpGain[0]';     
         
xcp.parameters(70).symbol = 'Model_P.pAngleCorrection';
xcp.parameters(70).size   =  1;       
xcp.parameters(70).dtname = 'real_T'; 
xcp.parameters(71).baseaddr = '&Model_P.pAngleCorrection';     
         
xcp.parameters(71).symbol = 'Model_P.pClampAmpl';
xcp.parameters(71).size   =  1;       
xcp.parameters(71).dtname = 'real_T'; 
xcp.parameters(72).baseaddr = '&Model_P.pClampAmpl';     
         
xcp.parameters(72).symbol = 'Model_P.pClampOffs';
xcp.parameters(72).size   =  1;       
xcp.parameters(72).dtname = 'real_T'; 
xcp.parameters(73).baseaddr = '&Model_P.pClampOffs';     
         
xcp.parameters(73).symbol = 'Model_P.pCosineGain';
xcp.parameters(73).size   =  1;       
xcp.parameters(73).dtname = 'real_T'; 
xcp.parameters(74).baseaddr = '&Model_P.pCosineGain';     
         
xcp.parameters(74).symbol = 'Model_P.pCosineOffset';
xcp.parameters(74).size   =  1;       
xcp.parameters(74).dtname = 'real_T'; 
xcp.parameters(75).baseaddr = '&Model_P.pCosineOffset';     
         
xcp.parameters(75).symbol = 'Model_P.pEncRes';
xcp.parameters(75).size   =  1;       
xcp.parameters(75).dtname = 'real_T'; 
xcp.parameters(76).baseaddr = '&Model_P.pEncRes';     
         
xcp.parameters(76).symbol = 'Model_P.pShearAmpl';
xcp.parameters(76).size   =  1;       
xcp.parameters(76).dtname = 'real_T'; 
xcp.parameters(77).baseaddr = '&Model_P.pShearAmpl';     
         
xcp.parameters(77).symbol = 'Model_P.pShearOffs';
xcp.parameters(77).size   =  1;       
xcp.parameters(77).dtname = 'real_T'; 
xcp.parameters(78).baseaddr = '&Model_P.pShearOffs';     
         
xcp.parameters(78).symbol = 'Model_P.pShearStep';
xcp.parameters(78).size   =  1;       
xcp.parameters(78).dtname = 'real_T'; 
xcp.parameters(79).baseaddr = '&Model_P.pShearStep';     
         
xcp.parameters(79).symbol = 'Model_P.pSineGain';
xcp.parameters(79).size   =  1;       
xcp.parameters(79).dtname = 'real_T'; 
xcp.parameters(80).baseaddr = '&Model_P.pSineGain';     
         
xcp.parameters(80).symbol = 'Model_P.pSineOffset';
xcp.parameters(80).size   =  1;       
xcp.parameters(80).dtname = 'real_T'; 
xcp.parameters(81).baseaddr = '&Model_P.pSineOffset';     
         
xcp.parameters(81).symbol = 'Model_P.tSample';
xcp.parameters(81).size   =  1;       
xcp.parameters(81).dtname = 'real_T'; 
xcp.parameters(82).baseaddr = '&Model_P.tSample';     
         
xcp.parameters(82).symbol = 'Model_P.u_ff';
xcp.parameters(82).size   =  50000;       
xcp.parameters(82).dtname = 'real_T'; 
xcp.parameters(83).baseaddr = '&Model_P.u_ff[0]';     

function n = getNumParameters
n = 82;

function n = getNumSignals
n = 69;

function n = getNumEvents
n = 1;

function n = getNumModels
n = 1;

