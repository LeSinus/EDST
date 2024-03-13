function [bm]=BayesianMass(expert,lambda,r)


% Generate a Bayesian Mass for the focal element of expert
%
% [md]=BayesianMass(expert,lambda,r)
%
% Inputs:
% expert = containt the structures of the list of focal element 
% expert.focal = list of focal elements
% lambda = parameter allowing to intergrate the lack of knowledge
% r = parameter to weigth the decision between a singleton (r=1) until the
% total indecision (r=0)
% 
% Output:
% bm = = containt the structures of the list of focal element and
%          corresponding Bayesian bba 
% bm.focal = list of focal elements
% bm.bba = matrix of bba
%
% March 2008 Arnaud MARTIN


bm.focal = expert.focal;
bm.bba=[];

nbFoc=size(expert.focal,2);

for foc=1:nbFoc
    sFoc=size(bm.focal{foc},2);
    if sFoc
        bm.bba=[bm.bba lambda/sFoc^r];
    else
        bm.bba=[bm.bba 0];
    end
        
        
end

% normalization
bm.bba=bm.bba/sum(bm.bba);


