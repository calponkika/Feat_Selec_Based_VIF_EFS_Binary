function Metrics= NNW_Alg3Metr(InputsP,Targets)
Acc=Perf_Accuracy(InputsP,Targets);
Precison=Perf_Precision(InputsP,Targets);
FPR=Perf_FalsePos_Rate(InputsP,Targets);
%  Y=My_network(InputsP,Targets);
%  T= Targets;
%  [~,cm]=confusion(T,Y);
%  [r,c]=size(cm);
% Wpre =zeros(1,c);
% CsVec=zeros(1,c);
% FP_i=zeros(1,c);
% STR=zeros(1,c);
% for i=1:c
% Cs=sum(cm(:,i));
% prec_i=cm(i,i)/Cs;
% Wpre(i)=prec_i;
% CsVec(i)=Cs;
% CsVec1=sum(CsVec);
% PrecisonOk=mean(Wpre)*100;%%well classified wrt to target value
% % % calculate FPR   
% Cs=sum(cm(i+1:r,i));
% FP_i(i)=sum(Cs);
% FP=sum(FP_i);
% ST=sum(cm(i,i));
% STR(i)=ST;
% Tot=sum(STR);
% TN=Tot-cm(1,1); 
% FPR=FP/Tot;
% 
% Acc=(Tot/CsVec1)*100;
% end
Metrics=[Acc,Precison,FPR];
  end

 