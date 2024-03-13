function Conjunctive_Matrix = get_Focal_Conjunctive_Matrix(Focal_Elements, tab_conjunctive, focal) % replace get_Conjunctive_Matrix_for_Focal_Element
	% Computes the conjunctive matrix for the given focal element indices.
	%
	% Arguments:
	% - Focal_Elements: Matrix representing focal element indices
	% - tab_conjunctive: Current conjunctive matrix being constructed
    %- focal: focal element to calculate the conjunctive matrix for
	%
	% Returns:
	% - Conjunctive_Matrix: Final conjunctive matrix for element focal

	% Get the dimensions of the focal elements matrix
	[focal_lignes, sources_number] = size(Focal_Elements);

	% Initialize the final conflict matrix
	Conjunctive_Matrix  = [];

	% Iterate over each row of the focal elements matrix
	for j=1:focal_lignes
		% Check if the focal element index is non-zero
		if(Focal_Elements(j,1) ~=0)
			% Get the current size of the conflict matrix
			index = size(tab_conjunctive, 2) + 1;
			 
			% Add the current focal element index to the conflict matrix
			tab_conjunctive(:, index) = Focal_Elements(j,1);
			 
			% If there are more sources, recursively compute the conflict matrix
			if sources_number ~= 1
				MM = Focal_Elements(:,2:sources_number);
				Conjunctive_Matrix  = [Conjunctive_Matrix ; get_Focal_Conjunctive_Matrix(MM, tab_conjunctive, focal)];
				
				% Adjust the size of the conflict matrix
				index = index - 1;
				if (index > 0) 
					 tab_conjunctive = tab_conjunctive(:, 1:index);
				else
					 tab_conjunctive = [];
				end
			else
				% Placeholder for handling single-source case
				% Check if the conflict is valid and add it to the final matrix
				focal_index = get_MultiIntersection_Index(tab_conjunctive);
				 
				if(focal_index == focal)
					Conjunctive_Matrix  = [Conjunctive_Matrix  ; tab_conjunctive] ;
				end
				
				% Adjust the size of the conflict matrix
				index = index-1;
				if (index > 0) 
					tab_conjunctive  =  tab_conjunctive(:,1:index);
				else
					tab_conjunctive=[];
				end
			end
		end 
	end
end