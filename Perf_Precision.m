function [PREC] =Perf_Precision(InputsP,Targets) 
outputs = My_network(InputsP,Targets);
 Y=outputs{2}; %The 1st index has n  my network produce n and output
 T= Targets;
 [~,cm]=confusion(T,Y);
 [~,c]=size(cm);
Wpre =zeros(1,c);
CsVec=zeros(1,c);
for i=1:c
Cs=sum(cm(:,i));
prec_i=cm(i,i)/Cs;
Wpre(i)=prec_i;
CsVec(i)=Cs;
PrecisonOk=mean(Wpre)*100;
end 
PREC=PrecisonOk;
end