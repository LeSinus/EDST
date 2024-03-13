function Conflict_Matrix = get_Conflict_Matrix(Focal_Matrix, tab_conflict)
	% Computes the conflict matrix for the given focal element indices.
	%
	% Arguments:
	% - Focal_Matrix: Matrix representing focal element indices
	% - tab_conflict: Current conflict matrix being constructed
	%
	% Returns:
	% - Conflict_Matrix: Final conflict matrix

	% Get the dimensions of the focal elements matrix
	[focal_lignes, sources_number] = size(Focal_Matrix);

	% Initialize the final conflict matrix
	Conflict_Matrix  = [];

	% Iterate over each row of the focal elements matrix
	for j=1:focal_lignes
		% Check if the focal element index is non-zero
		if(Focal_Matrix(j,1) ~=0)
			% Get the current size of the conflict matrix
			index = size(tab_conflict, 2) + 1;
			 
			% Add the current focal element index to the conflict matrix
			tab_conflict(:, index) = Focal_Matrix(j,1);
			 
			% If there are more sources, recursively compute the conflict matrix
			if sources_number ~= 1
				MM = Focal_Matrix(:,2:sources_number);
				Conflict_Matrix  = [Conflict_Matrix ; get_Conflict_Matrix(MM, tab_conflict)];
				
				% Adjust the size of the conflict matrix
				index = index - 1;
				if (index > 0) 
					 tab_conflict = tab_conflict(:, 1:index);
				else
					 tab_conflict = [];
				end
			else
				% Placeholder for handling single-source case
				% Check if the conflict is valid and add it to the final matrix
				focal_index = get_MultiIntersection_Index(tab_conflict);
				 
				if(focal_index == 1)
					Conflict_Matrix  = [Conflict_Matrix  ; tab_conflict] ;
				end
				
				% Adjust the size of the conflict matrix
				index = index-1;
				if (index > 0) 
					tab_conflict  =  tab_conflict(:,1:index);
				else
					tab_conflict=[];
				end
			end
		end 
	end
end