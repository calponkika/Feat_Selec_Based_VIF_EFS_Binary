  function [My_RIG_Output] = OptFeat_Corr_VIF(M,K,Mn3,Y,Targets)
  
  %%This function removes K,VIF,and check later RIG
   List1_Feature=indexing_Feature(M,K);  %%This is also an index of remained  features removed [20,21]
   Lst1= List1_Feature;
   VIF_1=VIF(Mn3); %%This will be our inputs without zeros variances
   K_idx=find(VIF_1>10);%%this is index that meet criteria,ariko zagombye kujya kuri idx za  List1_Feature)
   K_idx1=K_idx;
   List2_Feature=setdiff(List1_Feature,Lst1(K_idx1));%%Both are index see an added codes
%      K_idx1=  K_idx;
%    List2_Feature=List1_Feature(K_idx1);%%we project to list one   
   Lst2=List2_Feature;
   
   
%%========Application==vif+Correl========

   [New_Inp]=Severe_VIF_Removal(Mn3);
    X1=New_Inp;
    My_RIG_Output=My_Robs_Correl(Lst2,X1,Y,Targets);  %%HERE IS VIF_RIG
    
   % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
 %%USE PARTION OF IG 40,50,AND 60
   Selected_Features =My_RIG_Output{4};    
   L=length(Selected_Features);%Selecte_Features =Inp_Perf_VectOpt{4}
   InptIG=My_RIG_Output{1};
   My_IG(L,InptIG,Targets,Selected_Features);
   fprintf('===================================\n')
   fprintf('Perfromance without using VIF\n')
   fprintf('===================================\n')
   
 % My_Robs_Correl(Lst1,Mn3,Y,Targets);   %%It  initial  Mn3 : It has multicollinear
  % My_Robs_Correl(Lst1,X1,Y,Targets);
    %%We shal use the same fxn with diff arguments
save Optimal_Feat_kdcp
    
 %fprintf('The elapsed Time for opt VIF_RIG is  [%d]\n',toc );
  end    
   
  % % codes verification
  % % A=[3,8,9,12,15,17,20]
  % %  Removal1Idx=[2,4], then update willhave diffidx=[1,3,5,6,7]==[A1=[3,9,15,17,20]
  % % Removal12dx=[1,4], then update willhave
  % idx=K_ids==[3,5,7]==[A2]=[9,15,20]=A1[Removal12dx] okkk
  %%Assume IGOpt on A2dx==[1,2] >>Ans will be A3=[9,15]%%wrt to initial it
  %%will be idx[3,5] optimal features 
  
  %%Understand 
  %%List0=[1,2,3,4,5,6,7,8,9,1,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41]
  % % K=[20,21]
  % % L1=diff(List0,K)=[1,2,3,4,5,6,7,8,9,1,10,11,12,13,14,15,16,17,18,19,--,--,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41]
  % % VIF=[4,8,20, 38,39] zizaba zijyanye na M3 resulted from L1
  % % kumenya index wrt to L2==L1(VIF>10)
  % % NO_VIF= NAZO ZABA L2<(VIF<=10) %% KUKO ISHOBORA KUZAMO 20,21, 39..]

  