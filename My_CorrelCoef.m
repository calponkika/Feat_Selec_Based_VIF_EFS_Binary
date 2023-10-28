function CorrP =My_CorrelCoef(A,Y)
[~,ca]=size(A);
CorrP=zeros(1,ca);

for i=1:ca
corr1=corr((A(:,i)),Y)^2;
CorrP(i)=corr1;  %%Remebertosquare correl Coe
end