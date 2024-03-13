function [Masse]=discounting(MasseIn,alpha)

%MasseIn: nb of masses = nb column
%         1column=1 masse


if size(alpha,2)==1
    Masse=alpha*MasseIn;
    Masse(end,:)=1-sum(Masse(1:end-1,:));
else if size(alpha,2)==size(MasseIn,2)
        Masse=[];
        for i=1:size(alpha,2)
            Masse=[Masse alpha(i)*MasseIn(:,i)];
        end
        Masse(end,:)=1-sum(Masse(1:end-1,:));
        
      else
        
        'Accident: in discounting the size of alpha is uncorrect'
    end
end