function [Masse,conf] = PCR6(MasseIn,TabConflict)

% in : MasseIn 2^n lines nb experts column (n is the number of classes)
% [TabConflict] = ConflictTable(n,nbexperts);
% Out : Masse 2^n lines one column
%       conf : total conflict
% Copyright 2006 (c) by Arnaud MARTIN

if nargin==1     % check the number of input arguments
    [n,nbexperts]=size(MasseIn);
    [TabConflict] = ConflictTable(n,nbexperts);
end

[Conflict] = ConflictPCR6(MasseIn,TabConflict);

conf=sum(Conflict);

[n,m]=size(MasseIn);
 q=repmat(1,1,n);
 for i=1:m
    qj=mtoq(MasseIn(:,i));
   
    q=q.*qj;
 end

Masse=qtom(q)'+Conflict;

if round(10000*conf)~=round(10000*Masse(1))
    'ACCIDENT in PCR6: the calcul of conflict if false'
end
Masse = Masse';
Masse(1)=0;
  
    