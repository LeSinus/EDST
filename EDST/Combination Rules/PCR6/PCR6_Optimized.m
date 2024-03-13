function [Combined_Masse]=PCR6_Optimized(MasseIn)

% Size of the power set and the number of sources
POWER_SET_SIZE = size(MasseIn, 1);
SOURCES_NUMBER = size(MasseIn, 2);

% Calculate conjunctive masses
Conj_masses = get_Conjunctive_Masses(MasseIn);

Conflict_Masse = zeros(1, POWER_SET_SIZE);

% Calculate the conflict matrix
Focal_Mat = get_Focal_Matrix(MasseIn);
Conflict_Matrix = get_Conflict_Matrix(Focal_Mat, []);

% Get the number of partial conflicts
[partial_conflict_nb, ~] = size(Conflict_Matrix);

% Compute the weights for each partial conflict
for k=1: partial_conflict_nb
    weight = zeros(1, POWER_SET_SIZE);
    
    for i = 1:SOURCES_NUMBER
        weight(Conflict_Matrix(k, i)) = weight(Conflict_Matrix(k, i)) + MasseIn(Conflict_Matrix(k, i), i);
    end
    
    % Normalize the weights
    lambda = sum(weight);
    normalized_weight = weight / lambda;
          
    % Distribute partial conflicting masses using the computed weights
    for i = 1:length(weight)
        Conflict_Masse(i) = Conflict_Masse(i) + normalized_weight(i) * get_Conjunctive_Mass(MasseIn, Conflict_Matrix(k, :));
    end
end

% Add conjunctive masses and return combined masses
Combined_Masse =  Conj_masses + Conflict_Masse;