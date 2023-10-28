  function [ Inp_Perf_VectOpt] = My_Robs_Correl(DifL,X1,Y,Targets)
  % %is atype of list =, List1 or List2
  [IGvect]= My_CorrelCoef(X1,Y);  % Good, metrix igomba kwakira x zvanyemo VIF,NA ZERO VARIANCE
   [IG1,indexes] = sort(IGvect,'ascend'); 

 % IKIBAZO Range yagombye kuba hagati ya Fetaure zasigaye
    n=length(IG1);

   Nbr_bins=round(sqrt(n)); 
   range=max(IG1)-min(IG1);
   BinWidth=range/Nbr_bins;
   fprintf('The computed correlation coeff  values from this sample size falls in range[ %3.4f - %3.4f]\n',min(IG1),max(IG1));

   if range==0
       fprintf('The correlation coed   for your data is the same\n')
   else
       InputVIF_RIG=cell(1,Nbr_bins);
       Perfomance_All=cell(1,Nbr_bins);
       Feature_All=cell(1,Nbr_bins);
       AccIG=zeros(3,Nbr_bins);
       NumberOfFeatures=zeros(1,Nbr_bins);
       CUM=zeros(1,Nbr_bins);%%%RIG start applied to VIF
       for i=1:Nbr_bins
           CumEdge=min(IG1)+0.2*(i-1)*BinWidth ;%%WHAT WILL ME HAPPEN i=1, you will compute all variables cumEdge=min[IG]
           CUM(i)=CumEdge;
           RemainVect=find(IG1>=CumEdge);
           Rem=RemainVect;
           idxInp=indexes(Rem);
           idxInpSort=sort(idxInp);
           InputIG=X1(:,idxInpSort);
           Acc_Prec_Fpr=NNW_Alg3Metr(InputIG',Targets);
           InputVIF_RIG{i}=InputIG;
           Perfomance_All{i}= Acc_Prec_Fpr;
           AccIG(:,i)=Acc_Prec_Fpr;
          
          Acc1=AccIG(1,:);
          Precion=AccIG(2,:);
         [AccMax,Idxmax]=max(Acc1);
          PrecMax=Precion(Idxmax);
          FPRate=AccIG(3,:);
          FprMax=FPRate(Idxmax);
          %%=============================
          idxoptimal=indexes(IG1>=CUM(Idxmax));
          Selected_Features=DifL(idxoptimal);%%igomba gusoma 
          Feature_All{i}=Selected_Features;
           %===========================

         Acc_Prec_FprMax=[AccMax PrecMax FprMax];
          Optimal_Input= InputVIF_RIG{Idxmax};
           OptPerf=Perfomance_All{Idxmax};
           Optimal_Feature=Feature_All{Idxmax};
         Inp_Perf_VectOpt={Optimal_Input, OptPerf,Optimal_Feature,Selected_Features};
         
      % % =============print the results from cross validation 
          MSE= Perf_mseCrossVal(Y,InputIG,Targets);
          MSE1(i)=MSE;
          
          % % ================================
          NumbrFeat=length(Rem);
          NumberOfFeatures(i)=NumbrFeat;
       end
  % % ==============================================================END
  
  L=length(Selected_Features);
  fprintf('The number of selected Optimal features by the above method is[%d] \n',L);
 fprintf('The computed perfr. at consecutive new cutoff point is shown below \n')
 fprintf('==========================================\n')   
 fprintf('Sn0 |Accuracy |Precison |FPR rate|MSE|Nbr Features\n')
 fprintf('-------------------------------------------\n')
 for j=1:Nbr_bins
 fprintf('%2d |%3.2f     |%3.2f    |%3.3f  |%3.3f | %2d|    \n',j,Acc1(j),Precion(j), FPRate(j), MSE1(j),NumberOfFeatures(j));
 end
  fprintf('-----------------------------------\n')
% ====================================================================
 fprintf('The optimal index  for cumulative edges [%d]\n',Idxmax); 
   fprintf('-----------------------------------\n')
fprintf('The optimal accuracy for this input is [%3.2f%%]\n',AccMax); 
fprintf('The optimal Precison is [%3.2f%%] and FPR is [%3.3f]\n', Acc_Prec_FprMax(2), Acc_Prec_FprMax(3)); 
fprintf('The features for optimal features are \n');
 fprintf('-----------------------------------\n')   
 fprintf('Sno    | FeatN0\n')
 fprintf('====================================\n')   
   for k=1:L
       fprintf('%2d    |%2d     | \n',k,Selected_Features(k))%% because we reoved the first four attributes addressess and port number  
   end
    fprintf('-----------------------------------\n')
   end
 % ====================================================================  
      fprintf('-----------------------------------\n')
 fprintf('The IG coefficient of your dataset \n')
  fprintf('-----------------------------------\n')
   fprintf('Sn0 |IG Values |FeatureNo |\n')
 fprintf('-----------------------------------\n')
 for j1=1:n
 fprintf('%2d |%3.3f     |%2d   |  \n',j1,IG1(j1),indexes(j1))
 end
  fprintf('-----------------------------------\n')
 %################################################################# 
  end