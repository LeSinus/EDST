function [Combined_Masse]=SJPCR6(MasseIn)
    [power_set_size, sources_number]=size(MasseIn);
    
    % Initialize arrays for conjunctive masses
    conjunctive_weighted_masses=repmat(0,1,power_set_size);
    conjunctive_distance_missing_masses=repmat(0,1,power_set_size);
    
     % Calculate conjunctive masses using Jaccard distance
     for i=2:power_set_size
        Focal_Matrix = get_Focal_Matrix(MasseIn);
        % get  the consensus matrix based on focal element index
        conjunctive_Element_Matrix = get_Focal_Conjunctive_Matrix(Focal_Matrix, [], i);
        
        %Calcul la valeur du consensus
        [rows, cols]=size( conjunctive_Element_Matrix);
        total = 0;
        for j=1:rows
            Jaccard_Distance = get_Jaccard_Distance(conjunctive_Element_Matrix(j,:));
            product =1;
            for k=1:cols
                product = product * MasseIn( conjunctive_Element_Matrix(j,k), k);
            end
            product = product * Jaccard_Distance;
            total = total + product;
        end
        conjunctive_weighted_masses(i) = total;
         
        % Calculate conjunctive distance missing masses
         conjunctive_distance_missing_masses = conjunctive_distance_missing_masses +   get_Missing_Mass(MasseIn, conjunctive_Element_Matrix,1);
    end

 % Initialize combined masses array
Combined_Masse = zeros(1, power_set_size);

% Calculate the conflict matrix
Focal_Matrix = get_Focal_Matrix(MasseIn);
conflict_Matrix = get_Conflict_Matrix(Focal_Matrix, []);

% Get the number of partial conflicts
[partial_conflict_number, ~] = size(conflict_Matrix);

% Calculate the weights for each partial conflict
for k=1: partial_conflict_number
    % Initialize variables
    weight = zeros(1, power_set_size);
    
     % Compute weights
    for i = 1:sources_number
        weight(conflict_Matrix(k, i)) = weight(conflict_Matrix(k, i)) + MasseIn(conflict_Matrix(k, i), i);
    end
    
    % Normalize the weights
    lambda = sum(weight);
    normalized_weight = weight / lambda;
    
          % Distribute the partial conflicting masses based on the calculated weights
    for i = 1:length(weight)
        Combined_Masse(i) = Combined_Masse(i) + normalized_weight(i) * get_Conjunctive_Mass(MasseIn, conflict_Matrix(k, :));
    end
end

% Add conjunctive masses and return combined masses
Combined_Masse = Combined_Masse + conjunctive_weighted_masses + conjunctive_distance_missing_masses;