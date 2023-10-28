function maxerf=Perf_mseCrossVal(y,OpInp,MyTarget)
% Inp==We need Opt mal Inp that is selected ,,[Zija munsi ya My_IG kuko
% % niyo itanga Optimal ,Targets , Mu rig irayifite))
% %load Optimal_Feature_Inputs_IN_CROSSVal   %%this includes feattarget, Featjoined, otimal inputs ...
% 
% % load Sample_Size45K1  %%The best sample size ,,it will be used in optimal accuracy
% %    M=samplesize4;
% % % %    Inp=M(:,1:end-1);
%  %import java.util.concurrent.TimeUnit
%  load SampleKDDCUP18M
%   M=Selectedsample18M;  
%  Num_Dataset=Data_Conversion(M);
% % Inputs_NoZroVariance=Zero_SdtRemovalP(Num_Dataset); %%%Here you detect non zeros variance in inputs only 
% % MSE=0.083
% % OptFS= MyFS(2).Optmal_Features; %% Use below to prfintf the selected features    Here are 34//Twagera hirya tukabona 33???Try to mathc the two
%  %OptFS=[5,3,32,21,28,27,33,31,4,30,6,35,34,22,38,12,23,36,25,37,39,24,26,29,1,2,10,20,8,13,16,17,14];
%  Num_Inp=Num_Dataset(:,1:end-1); %%ACC 99.27043925	PREC=97.69501533	FPR= 0.00541664, perf=0.0117
% 
%  Num_Out=Num_Dataset(:,end);
%   OptFS =[15,9,7,18,14,11,17,19,22,13,16,8,10,1,2,31,24,12,35,36,37,23,30,32,33,6,34,3,5];%%Optmal VIF-RIG
%   OptFS1=sort(OptFS);
%   Optmal_Input=Num_Inp(:,OptFS1);
%   Opt_Dataset=[Optmal_Input Num_Out]; 
%  [Input,MyTarget]=DataMorph_NNW(Opt_Dataset);
%  B=OutlierRemovalFxn.IsOutlier_3p1_Median(Input);
%  
%  %Inp=zscore(B);
%  OpInp=MinMaxScaling(B);
 
 Targetv=MyTarget';%%bcing it back to vertical mode
%  y=Num_Dataset(:,end);
%  y=MyTarget;
numFolds = 10;
%c = cvpartition(y,'k',numFolds);
c = cvpartition(y,'k',numFolds);
% table to store the results 
netAry = {numFolds,1};  %%preallocation 
perfAry = zeros(numFolds,1);  %%Preallocation 
% Perf_Prec= zeros(numFolds,1);  %%Preallocation 
% Perf_Acc= zeros(numFolds,1);  %%Preallocation 
% Perf_Fpr= zeros(numFolds,1);  %%Preallocation 
for i = 1:numFolds
     %get Train and Test data for this fold
     trIdx = c.training(i);
     %trIdx(i)=trIdx;
     
    teIdx = c.test(i);
    % teIdx(i)=teIdx;
     xTrain = OpInp(trIdx,:); %%Before it was   xTrain = Inp(trIdx)
     yTrain = Targetv(trIdx,:);%%Before it was  yTrain = Targetv(trIdx)
     xTest = OpInp(teIdx,:); %bofre it was   xTest = Inp(teIdx)
     yTest = Targetv(teIdx,:);%%Before it was  yTest = Targetv(teIdx,:)
     
     %transform data to columns as expected by neural nets ##in horinzontal
     
     xTrain = xTrain';
     xTest = xTest';
     %yTrain = dummyvar(grp2idx(yTrain))'; %instraed of grouping,let change
     %
    % yTest = dummyvar(grp2idx(yTest))';
     
%      %Determine hidden layer
%      [rIn,~]=size(xTrain);
%      [rOut,~]=size(yTrain');
%       n =(round((rIn *2)/3))+rOut; %The number of output is 
    
%     % create net and set Test and Validation to zero in the input data
%      net.divideParam.trainRatio = 0.80;
%      net.divideParam.testRatio = 0.10;
%      net.divideParam.valRatio = 0.10;
%           %train network
%      net = train(net,xTrain,yTrain');
%      yPred = net(xTest);%%Output or predict iraba iya Testata
    OUT=My_network(xTest,yTest');
     yPred=OUT{2};
     n=OUT{1};
     net = patternnet(n);
     perf = perform(net,yTest',yPred);
%    disp(perf);
     %Try Acc, fpr,..compute Accuracy 
    % T={NNW_Alg3Metr_CrossVal(xTrain,yTrain')};
          
     %store results     
     netAry{i} = net;
     perfAry(i) = perf;
     
%      T=Perf_Precision(xTrain,yTrain');
% %      disp(T);
%     T1=Perf_Accuracy(xTrain,yTrain');
% %     disp(T1);
%     T2=Perf_FalsePos_Rate(xTrain,yTrain');
% %     disp(T2);
%           
%     % Acc_Pre_fpr{i}=T;
%     Perf_Prec(i)=T;
%     Perf_Acc(i)=T1;
%     Perf_Fpr(i)=T2;
%     PERF=[Perf_Prec,]
   
     
end
%take the network with min Loss value
[maxerf,maxPerfId] = min(perfAry);
bestNet = netAry{maxPerfId};
end 
%%mse 
% 0.014286642
% 0.010016305
% 0.018163294
% 0.009731053
% 0.012213765
% 0.008097596
% 0.018102192
% 0.006467993
% 0.008675759
% 0.013533129

