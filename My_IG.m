function [ Nbr_Feat] = My_IG(L,Inpp, Targets,Sel)
   Nbr_Feat=round(L*0.5);%%We need number of 50 or 60 features 
%    My_RIG_Output1=My_RIG_Output{1};
    Selected_Features=Sel;
   InputTIG=Inpp(:,1:Nbr_Feat);%%InputTIG=Inp_Perf_VectOpt{1}
   AccT_I_G =NNW_Alg3Metr(InputTIG',Targets);
    fprintf('-------------------------------\n')
    fprintf('Performance for TIG\n')
    fprintf('-------------------------------\n')
    fprintf('|Accuracy | Precision| FPRrate|\n')
   fprintf(' |%3.2f    |  %3.2f    |%3.3f  |\n', AccT_I_G(1), AccT_I_G(2), AccT_I_G(3))
      fprintf('-------------------------------\n')
  fprintf('The Ranked  selected  features, and its IG  by using TIG is \n')
      fprintf('Sn0   |  Top Features\n')
      fprintf('-------------------------------\n')
   for j=1:Nbr_Feat
      fprintf('|%d   | %d|\n',j,Selected_Features(j))
    end
  fprintf('---------------------------------------\n')
    