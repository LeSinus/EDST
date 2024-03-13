function [Conflict] = ConflictPCR6(Masse,TabConflict)

%Masse: 2^n lines, nb experts columns (n is the number of classes)
%[TabConflict] = ConflictTable(n,nbexperts);
%Conflict: 2^n lines, 1 column

% Copyright 2006 (c) by Arnaud MARTIN


[n,m]=size(Masse); 

if nargin==1     % check the number of input arguments
    [TabConflict] = ConflictTable(n,m);
end


Conflict=zeros(n,1);

TabInd=ones(m,1);
condition=true;


while condition
    indCour=m;
    
    P=1;
    S=0;
    for i=1:m
        P=P*Masse(TabInd(i),i);
        S=S+Masse(TabInd(i),i);    
    end
    
        
    if (S~=0) & (P~=0)
        cmp=1;
                
        OK=false;
        while ~OK & cmp<size(TabConflict,2)+1 
            if sum(ismember(unique(TabInd),TabConflict(:,cmp)))==size(find(TabConflict(:,cmp)~=0),1)
               
                OK=true;
            end
            cmp=cmp+1;
        end
        if OK
            for j=1:m
                Conflict(TabInd(j))=Conflict(TabInd(j))+Masse(TabInd(j),j)*P/S;
            end
        end
    end
    
    TabInd(indCour)=TabInd(indCour)+1;
    
    
    while ((TabInd(indCour)==n+1) & condition)
        TabInd(indCour)=1;
        indCour=indCour-1;
        if indCour==0
            condition=false;
            indCour=1;
        else
            TabInd(indCour)=TabInd(indCour)+1;
        end
    end
end



