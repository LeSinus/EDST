function [Index]= get_MultiUnion_Index(focals) 
% Calculates the index of the union between multiple focal elements.

% Check if there are at least 2 focal elements
if numel(focals) < 2
    error('At least two focal elements are required for union calculation.');
end

% Determine the number of focal elements
num_focals = numel(focals);

% Initialize the current index with the first focal element
current_index = focals(1);

% Iterate over the remaining focal elements to compute the union
for i = 2:num_focals
    current_index = get_Union_Index(current_index, focals(i));
end

% Return the final union index
Index = current_index;