function [Masse]=DST(MasseIn,criteria)

%MasseIn: nb of masses = nb column
%         1column=1 masse
%         criteria = is the combination criteria
%                   criteria=1 Smets criteria
%                   criteria=2 Dempster-Shafer criteria (normalized)
%                   criteria=3 Yager criteria
%                   criteria=4 disjunctive combination criteria
%                   criteria=5 Dubois criteria (normalized and disjunctive
%                   combination)
%                   criteria=6 Dubois and Prade criteria (mixt combination)
%                   criteria=7 Florea criteria
%                   criteria=8 PCR6
%                   criteria=9 Cautious Denoeux Min for fonctions non-dogmatics
%                   criteria=10 Cautious Denoeux Max for separable
%                   fonctions
%                   criteria=11 Hard Denoeux for fonctions sous-normales
%                   criteria=12 Mean of the bbas
%
%

[n,m]=size(MasseIn);
 b=repmat(1,1,n);
 q=repmat(1,1,n);
 for i=1:m
    bj=mtob(MasseIn(:,i));
    qj=mtoq(MasseIn(:,i));
   
    b=b.*bj;
    q=q.*qj;
 end

switch criteria

    case 1
        %Smets criteria
        Masse=qtom(q);
        Masse(1)=1-sum(Masse(2:end)); %In case with very high conflict Masse(1) could be >1 !
    case 2
        %Dempster-Shafer criteria (normalized)
        Masse=qtom(q);
        Masse=Masse./(1-Masse(1));                 
        Masse(1)=0;
    case 3
        %Yager criteria
        Masse=qtom(q);
        Masse(n)=Masse(n)+Masse(1);
        Masse(1)=0; 
    case 4
        % disjunctive combination criteria
        Masse=btom(b);
    case 5
        %Dubois criteria (normalized and disjunctive combination)
        Masse=btom(b);
        Masse=Masse./(1-Masse(1));
        Masse(1)=0;
    case 6
        %Dubois and Prade criteria (mixt combination). Only if the focal
        %element are the singletons
        Masse=qtom(q);
        Masse(n)=0;
   
        Masse_disjonc=btom(b);
        Masse_disjonc(n)=0;
        for i=1:floor(log2(n))
            Masse_disjonc(1+2^(i-1))=0;
        end
        Masse=Masse+Masse_disjonc;
        Masse(1)=0;
        Masse(n)=1-sum(Masse);
    case 7
        %Florea criteria
        Masse_conjonc=qtom(q);
        Masse_disjonc=btom(b);
        %alpha=Masse_conjonc(1)/(1-Masse_conjonc(1)+Masse_conjonc(1)*Masse_conjonc(1));
        %beta=(1-Masse_conjonc(1))/(1-Masse_conjonc(1)+Masse_conjonc(1)*Masse_conjonc(1));
        
        k=Masse_conjonc(1);
        x=0.9;
        alpha=log((1+x)/(k+x))/log((1+x)/x);
        beta=log((1+x)^k*(k+x)^(1-k)/x)/log((1+x)/x);
        
        Masse=alpha*Masse_disjonc+beta*Masse_conjonc;
    
        Masse(1)=0;
     case 8
        %PCR6 combination Martin & Osswald Criteria
        [Masse,conf]=PCR6(MasseIn);
        Masse=Masse';
        
     case 9
        %Cautious Denoeux min for fonctions non-dogmatic
        wtot=[];
         w=[];
         for i=1:m
            wj=mtow(MasseIn(:,i));
            wtot=[wtot wj'];
         end
        w=min(wtot,[],2);
        w=w';
        Masse=wtom(w);
     case 10
        %Cautious Denoeux max only for separable fonctions
         wtot=[];
         w=[];
         for i=1:m
            wj=mtow(MasseIn(:,i));
            wtot=[wtot wj'];
         end
        w=max(wtot,[],2);
        w=w';
        Masse=wtom(w);
     case 11 
        % Hard Denoeux for fonctions sous-normales
         vtot=[];
         v=[];
         for i=1:m
            vj=mtov(MasseIn(:,i));
            vtot=[vtot vj'];
         end
        v=min(vtot,[],2);
        v=v';
        Masse=vtom(v);
     case 12
        % mean of the masses
         Masse=mean(MasseIn');
     
    otherwise
        'Accident: in DST choose of criteria: uncorrect'
end



