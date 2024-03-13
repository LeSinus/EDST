function Masse = StringToMassVector(MasseIn, n) 
% StringToMassVector: Converts mass assignments from string format to an array.
% Parameters:
%   - MasseIn: Input string containing mass assignments
%   - n: Size of the power set
% Returns:
%   - Masse: Array containing the converted mass assignments

% Initialize the array to store converted masses
Masse = zeros(1, 2^n);

% Loop until the input string is fully processed
while ~isempty(MasseIn)
    % Remove leading spaces
    MasseIn = strtrim(MasseIn);
    
    % Extract focal element and its value
    [focal_and_value, MasseIn] = strtok(MasseIn, ' ');
    
    % Extract focal and its value
    [focal, valeur] = strtok(focal_and_value, '(');
    valeur = str2double(valeur(2:end-1)); % Convert value to double
    
    % Get the index of the focal element
    index = focal_string_to_index(focal);
    
    % Store the value in the corresponding index of the array
    Masse(index) = valeur;
end

% Transpose the array to match the desired format
Masse = Masse';
end
