function [Distance]= get_Jaccard_Distance( elements)
   % Compute the cardinalities of the intersection and union
    intersect_cardinality = get_MultiIntersection_Cardinality(elements);
    union_cardinality = get_MultiUnion_Cardinality(elements);
    
    % Compute the Jaccard distance
    Distance = intersect_cardinality / union_cardinality;
end
