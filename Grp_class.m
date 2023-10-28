function G=Grp_class (M)
%load SampleUNS_NB15
%M1=SamleUNSW1;
% M=unique(M1,'rows'); 
T1=M(:,1:end-1);
T=M{:,end};
 [r,~]=size(T);
 N=cell(r,1);

  for i=1:r;
  if strcmp(T(i,1),'Normal');  %1
      N{i,1}='Normal'; 
  end
if strcmp(T(i,1),'Analysis');%2
       N {i,1}='Analys';
end
 if strcmp(T(i,1),'Backdoor');%3
      N{i,1}='Backdoor';
  end
if strcmp(T(i,1),'DoS');  %4   
      N{i,1}='DoS';
end   
if strcmp(T(i,1),'Exploits');%5
       N{i,1}='Exploits';
 end  
 if strcmp(T(i,1),'Fuzzers');%6
       N {i,1}='Fuzzers';
end
if strcmp(T(i,1),'Generic'); %7
      N{i,1}='Generic';
end 
 if strcmp(T(i,1),'Reconnaissance');%8
       N{i,1}='Reconn.';
 end  
 if strcmp(T(i,1),'Shellcode');%9
       N{i,1}='Shellcode';
 end
 if strcmp(T(i,1),'Worms');%10
       N{i,1}='Worms';
 end

  end
G1=cell2table(N);
 M2=cell(r,1); %%for 2 classes
for j=1:r;
  if strcmp(T(j,1),'Normal');  
      M2{j,1}='Normal'; 
   else
      M2{j,1}='Attack';
  end
end
G2=cell2table(M2); % group of 2 classes 
G=[T1 G1 G2];  

Catg=categorical(N);
Cats=categories(Catg);
Occ=countcats(Catg);
T=zeros(1,length(Occ));
Q=cell(1,length(Occ));
fprintf('The number of instances by category is shown in table below\n');
fprintf('%2s%12s%14s\n','Sno','Category','Frequency');
fprintf ('--------------------------------\n');
for j=1:length(Occ)
ClassesStat=Occ(j,1);
T(j)=ClassesStat;
nberOfNonZeros=find(T(j)~=0);
L1=length(nberOfNonZeros);
L2=length(Occ);

GdClass=Cats(j,1);
Q(j,1)=GdClass;
fprintf ('%2d%12s%14d\n',j,Q{j},T(j));
end
if L2-L1>0
 fprintf('Congratulation!!your sample size is stratified, Go on next step\n ');
else
   fprintf('Sorry!! your sample size is not stratified, you may load a new data.\n');
end
% end
