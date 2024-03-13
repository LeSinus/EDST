function [md]=BayesianMass(lambda,r,n)

% n = size of discernement space.
% 


if n <=1 
    'error in Bayesian Mass'
else
    Card=[0 1];
    for i=1:n-1
        Card=[Card (Card+1)];
    end
end

Card(1)=1; % for division

mt=lambda.*(1./Card).^r;
mt(1)=0;
md=mt/sum(mt);



