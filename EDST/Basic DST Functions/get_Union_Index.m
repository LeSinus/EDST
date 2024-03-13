function [Index]= get_Union_Index(focal1, focal2)
% Computes the index of the union between two focal elements.

% Determine the cardinality of each focal element
card1 = ceil(log2(focal1));
card2 = ceil(log2(focal2));

% Check if both focal elements are within the first four elements of the powerset
if (focal1 <= 4) && (focal2 <= 4) 
    % Predefined union matrix for the first four elements
    Index_Union_Theta_2 = [1 2 3 4
                           2 2 4 4
                           3 4 3 4
                           4 4 4 4];
    % Retrieve the union index from the matrix
    Index = Index_Union_Theta_2(focal1, focal2);
    return
else 
    % Handle cases where at least one focal element is beyond the first four elements
    
    % Both focal elements are beyond the first four elements
    if (focal1 > 4) && (focal2 > 4)
        % Compute the adjusted values for each focal element
        var1 = focal1 - 2^(card1 - 1);
        var2 = focal2 - 2^(card2 - 1);
        
        % Recursively determine the union index
        if (card1 == card2)
            Index = 2^(card1 - 1) + get_Union_Index(var1, var2);
        elseif (card1 > card2)
            Index = 2^(card1 - 1) + get_Union_Index(var1, focal2);
        elseif (card1 < card2)
            Index = 2^(card2 - 1) + get_Union_Index(focal1, var2);
        end
    % Case where focal1 is beyond the first four elements and focal2 is within
    elseif (focal1 > 4) && (focal2 <= 4)
        % Compute the adjusted value for focal1
        var1 = focal1 - 2^(card1 - 1);
        % Recursively determine the union index
        Index = 2^(card1 - 1) + get_Union_Index(var1, focal2);
    % Case where focal2 is beyond the first four elements and focal1 is within
    elseif (focal1 <= 4) && (focal2 > 4) 
        % Compute the adjusted value for focal2
        var2 = focal2 - 2^(card2 - 1);
        % Recursively determine the union index
        Index = 2^(card2 - 1) + get_Union_Index(focal1, var2);
    end
end
