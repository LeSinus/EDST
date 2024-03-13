function [Masse]=ZPCR6(MasseIn)
    % Get the size of the power set and the number of sources
    [power_set_size, sources_number] = size(MasseIn);
    
     % Calculate conjunctive masses using Zhang distance
    conjunctive_weighted_masses = zeros(1, power_set_size);
    for i = 2:power_set_size
        % Get the focal matrix
        Focal_Matrix = get_Focal_Matrix(MasseIn);
        % Get the consensus matrix based on the focal element index
        Matrix_conjunctive_element_i = get_Focal_Conjunctive_Matrix(Focal_Matrix, [], i);

        % Calculate the value of the consensus
        [rows, cols] = size(Matrix_conjunctive_element_i);
        total  = 0;
        for j = 1:rows
            zhang_Distance = get_Zhang_Distance(Matrix_conjunctive_element_i(j,:));
            product = 1;
            for k = 1:cols
                product = product * MasseIn(Matrix_conjunctive_element_i(j,k), k);
            end
            product = product * zhang_Distance;
            total  = total  + product;
        end
        conjunctive_weighted_masses(i) = total ;
    end
    
    
    % Initialize combined masses array
    Combined_Mass = zeros(1, power_set_size);
    
    % Calculate the conflict matrix
    focal_Matrix = get_Focal_Matrix(MasseIn);
    conflict_Matrix = get_Conflict_Matrix(focal_Matrix, []);
    
    % Get the number of partial conflicts
    [partial_conflict_number, ~] = size(conflict_Matrix);
    
    % Calculate the weights for each partial conflict
    for k = 1:partial_conflict_number
        % Initialize variables
        weights = zeros(1, power_set_size);

        % Compute weights
        for i = 1:sources_number
            weights(conflict_Matrix(k, i)) = weights(conflict_Matrix(k, i)) + MasseIn(conflict_Matrix(k, i), i);
        end
        
         % Normalize the weights
        lambda = sum(weights);
        normalized_weights = weights / lambda;

        % Distribute the partial conflicting masses based on the calculated weights
        for i = 1:length(weights)
            Combined_Mass(i) = Combined_Mass(i) + normalized_weights(i) * get_Conjunctive_Mass(MasseIn, conflict_Matrix(k, :));
        end
    end
    
    % Add conjunctive masses and return combined masses
    Combined_Mass = Combined_Mass + conjunctive_weighted_masses;

    % Normalize and return the combined masses
    Masse = normalize_masses(Combined_Mass);
end