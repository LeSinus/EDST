function [Distance]= get_Zhang_Distance( elements)
    % Compute the cardinality of the intersection of all elements
    intersect_Cadinality = get_MultiIntersection_Cardinality(elements);
    
    % Compute the product cardinality 
    product_Cadinality = get_Product_Cardinality(elements);
    
    % Compute the Zhang distance
    Distance =intersect_Cadinality / product_Cadinality;
end