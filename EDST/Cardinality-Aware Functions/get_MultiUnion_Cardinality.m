function [Cardinality]= get_MultiUnion_Cardinality(focals) 
% Calculates the cardinality of the union of multiple focal elements.

% Compute the union index of the focal elements
union_index = get_MultiUnion_Index(focals);

% Calculate the cardinality of the union index
Cardinality = get_Cardinality(union_index);
end
