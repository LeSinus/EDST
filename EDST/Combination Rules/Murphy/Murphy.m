function [Mass] = Murphy(MasseIn)
    % Get the size of the power set and the number of sources
    [power_set_size, sources_number] = size(MasseIn);
    
    % Initialize vector for mean values
    Mean_Vector = repmat(0,power_set_size,1);
    
    % Calculate mean values for each row 
    for j = 1:power_set_size
        Mean_Vector(j) = mean(MasseIn(j, :));
    end

    % Initialize matrix for Dempster's rule of combination
    Combination_Matrix = repmat(Mean_Vector, 1, sources_number);

    % Combine mean values using Dempster's rule of combination
    Mass = DST(Combination_Matrix, 2);
end
