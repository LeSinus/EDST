function [normalized] = normalize_masses(masses) 
    % Initialize the normalized array
    normalized = zeros(size(masses));
    
    % Set the first element to 0
    normalized(1) = 0;
    
    % Calculate the normalization factor
    normalization_factor = sum(masses(2:end));
    
    % Normalize the masses
    for i = 2:length(masses)
        normalized(i) = masses(i) / normalization_factor;
    end
end
