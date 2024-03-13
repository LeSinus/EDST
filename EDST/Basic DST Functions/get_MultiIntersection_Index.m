function [Index]= get_MultiIntersection_Index(focals)  
% Calculates the index of the intersection between multiple focal elements.

% Check if there are at least 2 focal elements
if numel(focals) < 2
    error('At least two focal elements are required for intersection calculation.');
end

% Determine the number of focal elements
num_focals = numel(focals);

% Initialize the current index with the first focal element
current_Index = focals(1);

% Iterate over the remaining focal elements to compute the intersection
for i = 2:num_focals
    current_Index = get_Intersection_Index(current_Index, focals(i));
end

% Return the final intersection index
Index = current_Index;

