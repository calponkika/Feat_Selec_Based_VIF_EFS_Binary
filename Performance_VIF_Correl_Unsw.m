function   [OptSeqMeth]=Performance_VIF_Correl_Unsw(~,~)%% 
load SampleUNSW_NB15_2M
M=SamleUNSW2M;
%%======================== 
%      load Sample1UNSW_NB15
%      M=SamleUNSW3M;
%%======================== 
  %load SampleUNS_NB15
 %  M=SamleUNSW1;
 %%======================== 
 % Dataset trasformation %%CHECK vfi in decison, optFeat_IG_RIG
 %%%bY USING VIF FEATURES ARE SHIFTED FROM 42 RO 32 
 %%By ysing RIG  ..SHIFT FROM 32 TO 21. 
 Num_Dataset=Data_Conversion(M);
[K,PreFS]=Zero_SdtRemvl_Modified(Num_Dataset);
% transform the class label into big classes 
%%Q={K,PreFS};
[Inputs,Targets]=DataMorph_NNW(PreFS);
 Y=PreFS(:,end);
%Y=PreFS(:,end); %%It will be used for information gain 
%PREPROCESSING  //it is mandatory betcause NNW is sensitive to unscale data
B=OutlierRemovalFxn.IsOutlier_3p5_Mean(Inputs);
Bscaled=zscore(B);
% Bscaled=MinMaxScaling(B);
   fprintf('===================================================\n')
    InpAcc=Bscaled'; %%We need olny one sample
    %%%Multicollinearity detection by using VIF
    %%%This must be crutial,because 
    %%% No1:collinear ,redudant and dependent features, ziza muri gain values or in %%correlated value iyo zitavanwemo//it means will be among selected by filter/wraper
    %%No2: The accuracy izaha hejuru overfitting,,Imagine using 4 all% dependent features [zaguha accuracy iri hejuru , nyamara zose zihagarirwa n'imwe///
    %%No3: rushuffling order of features in NWW AFFECT THE PERFROMANCE!! NIYO MPAMVU TUTEMEREWE GUKORA BACKPROPAGEATION KURI FULL FEATURES, HATABAYEHO FEATURE SCALING
   % % No 4 UKO SCALING PERFROM ON SPECIFIC DATA, THE SAME  NO FEATURE SCALING MEHTOD IS GOOD.//
   % % nO 5: WHATEVER YOU DO [1.FEATURE SCALING, REMOVE DEPENDENT, COLLINEAR , FEATURE SELECTION TO AVOID RANKING COLLINEAR OR DEPENDENT FEATURE)[ 
   % %  No 6 : then respect [ZODFS-VIF-IG]] OR [ZODFS-VIF-RIG]
    
    %Inpt_N_VIF=Severe_VIF_Removal(M,K,InpAcc');  
    Inpt_N_VIF=Severe_VIF_Removal(InpAcc'); 
   
    fprintf('=====================================\n')
    fprintf('Apply VIF  on your Sample\n')
    fprintf('=====================================\n')
     Decison_VIF(M,K,InpAcc');  %%Here we get the number of detected collinear, 
 fprintf('=====================================\n')
 fprintf('\n')
fprintf('Performance features after VIF  Removal \n')
 fprintf('=====================================\n')
     Accuracy_VIF_Removal=NNW_Alg3Metr(Inpt_N_VIF',Targets); 
   fprintf('The Accuracy is %3.2f, the precision is %3.2f and FPR is %3.3f\n',   Accuracy_VIF_Removal(1),  Accuracy_VIF_Removal(2),   Accuracy_VIF_Removal(3))
  
   Acc_IGVIF=OptFeat_Corr_VIF(M,K,InpAcc',Y,Targets);   %%InpAcc' Irakoreshwa muri recalcul of vif 
%     % =================================
  
 fprintf('The output of this project is listed below\n')
 fprintf('Ans=[Reults,Optimal performance, optimal input, optimal selected feature]\n')
%OptSeqMeth={Acc_Transf,Acc_TIG,Acc_RIG,Accuracy_VIF_Removal,Acc_IGVIF};
OptSeqMeth={Accuracy_VIF_Removal, Acc_IGVIF};
 save   Acc_kddcBinUnsw
end
