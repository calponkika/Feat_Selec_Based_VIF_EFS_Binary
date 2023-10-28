function [New_Inp]=Decison_VIF(M,K,Mn3) 
List1_Feature=indexing_Feature(M,K); %%Kuyihuza na weak or zero variance 
VIF_1=VIF(Mn3); 
K_idx=find(VIF_1>10);%%Collinear vif coeff zitandukanye na index yazo kuri features 
SVIF=VIF_1(K_idx);%%Tacking its values
[~,ck]=size(K_idx);
if ck > 0
%New_Inp_Vif=Mn3(:,K_idx);
List2_Feature=List1_Feature(K_idx);%%we project to list one  
Nk_idx=find(VIF_1<10); %%Not severe colinearIdx
Tu=Nk_idx;
New_Inp=Mn3(:,Tu);

%%[~,ck]=size(New_Inp_Vif);

%fprintf('The size of sample size without any severe collinear attribute is[%d x %d]\n',r,c);

fprintf('\n')
fprintf('The number of detected severe collinear features is [%2d] and they are listes as follows:\n',length(K_idx));
fprintf('\n')

fprintf('The Detected Features as Severe Collinear (DFSC) predictors from your inputs\n')
fprintf('-------------------------------------\n')
    fprintf('Sno    |DFSC   |VIF  |\n')
fprintf('------------------------------------\n')
for k=1:length(List2_Feature);
    fprintf('%d     | %d   |%3.2f |\n',k,List2_Feature(k),SVIF(k))
end
% fprintf('The VIF for the above feature is %3.2f\n',SVIF);

fprintf('------------------------------------\n')

else
New_Inp=Mn3;   
fprintf('------------------------------------------------------------\n')
fprintf('This sample size has not collinear attribute \n');
fprintf('-------------------------------------------------------------\n')
end

%%%%%NOW COME ON IG 40%,50%,60%..
%%[~,C]=size(OptInp_vifRIG);


end
