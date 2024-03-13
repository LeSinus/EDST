function Focal_Matrix = get_Focal_Matrix(Masses)
% Retrieves the matrix containing focal elements from the provided mass matrix.
%
% Arguments:
% - Masses: Matrix containing mass assignments
%
% Returns:
% - Focal_Matrix: Matrix containing focal elements (index)

% Get the dimensions of the mass matrix
[power_set_size, sources_number] = size(Masses);

% Initialize the focal elements matrix
Focal_Matrix = zeros(1, 1);

% Iterate over each source
for j = 1:sources_number
    % Initialize the current row index
    current_row = 1;
    
    % Iterate over each element in the power set
    for i = 1:power_set_size
        % Check if the mass assignment is non-zero
        if Masses(i, j) ~= 0
            % Store the index of the focal element
            Focal_Matrix(current_row, j) = i;
            
            % Increment the current row index
            current_row = current_row + 1;
        end
    end
end
