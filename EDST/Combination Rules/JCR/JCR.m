function [Masse]=JCR(MasseIn)
    % Get the size of the power set and the number of sources
    [power_set_size, sources_number] = size(MasseIn);
    
     % Calculate conjunctive masses using Jaccard distance
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
            jaccard_Distance = get_Jaccard_Distance(Matrix_conjunctive_element_i(j,:));
            product = 1;
            for k = 1:cols
                product = product * MasseIn(Matrix_conjunctive_element_i(j,k), k);
            end
            product = product * jaccard_Distance;
            total  = total  + product;
        end
        conjunctive_weighted_masses(i) = total ;
    end
    
  % Normalize the masses
Masse = normalize_masses(conjunctive_weighted_masses);


