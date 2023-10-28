function [Inputs,Targets]=DataMorph_NNW(T) 

[~,n]=size(T);
G3=T(:,n); %%Ushaka multiclassification wafata  G3=T(:,n-1);
Inputs=T(:,1:n-1);
Target=G3';
Targets=zeros(2,length(Inputs));
for i=1:length(Inputs)
       if Target(:,i)==1          %%Attack comes first 1and 2 were created by unique
          Targets(:,i)=[1;0]; 
       end
       if Target(:,i)==2   %%Normal 
          Targets(:,i)=[0;1];
       end
%        if Target(:,i)==3
%        Targets(:,i)=[0;0;1;0;0]; 
%        end
%        if Target(:,i)==4
%           Targets(:,i)=[0;0;0;1;0]; 
%        end
%        if Target(:,i)==5
%            Targets(:,i)=[0;0;0;0;1]; 
%        end
end
end