function [Masses]=Generate_Masses(sources, powerset, focal_element_number)
 %Initialize the matrix to store the generated masses
 Masses  = zeros(powerset, sources);

 % Generate random masses for each source
for i= 1 : sources 
     % Generate random probabilities for each focal element
      probabilities = rand(1, focal_element_number);
      probabilities = probabilities / sum(probabilities); % Normalize so the sum is 1
      
       % Assign the random probabilities to random focal elements
       for k =1:focal_element_number
            randomRow = randi(powerset); % Random row index
            if( randomRow == 1)
                randomRow =powerset; % Avoid assigning to the empty set
            end
            Masses(randomRow , i) = Masses(randomRow , i) + probabilities(k);
       end
end
end