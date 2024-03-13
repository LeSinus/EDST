function [Cardinality]= get_Product_Cardinality(tab)
    % Get the size of the input array
    [~, num_elements] = size(tab);
    
    % Initialize the product
    product = 1;
    % Compute the product of cardinalities
    for s = 1:num_elements
        product = product * get_Cardinality(tab(s));
    end
    
    % Assign the product to the output variable
    Cardinality = product;
end
