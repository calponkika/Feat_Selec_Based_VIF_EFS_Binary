function [ACC] =Perf_Accuracy(InputsP,Targets) 
outputs = My_network(InputsP,Targets);
 Y=outputs{2}; %The 1st index has n 
 T= Targets;
 [~,cm]=confusion(T,Y);
 [~,c]=size(cm);
CsVec=zeros(1,c);
STR=zeros(1,c);
for i=1:c
Cs=sum(cm(:,i));
CsVec(i)=Cs;%%Create horizontal vector of sums, 
CsVec1=sum(CsVec); %%Compute the sum of horizontal,,,,
ST=sum(cm(i,i));
STR(i)=ST;
Tot=sum(STR);
Acc=(Tot/CsVec1)*100;
ACC=Acc;
end