function [Final_Mass]=get_Missing_Mass(MasseIn, conjunctive_indices, distance_type)
    [power_set_size, sources_number]=size(MasseIn);
    [num_conjunctions, ~] = size(conjunctive_indices);
    
    Final_Mass = repmat(0,1,power_set_size);
        
    for l=1 : num_conjunctions
        Masse = repmat(0,sources_number,power_set_size);
        original_masses = repmat(0,sources_number,power_set_size);
        result = 1;
        tab_intersect_union=[];
        
        for c=1:sources_number
            index =  conjunctive_indices(l,c);
            original_masses(c,index) = MasseIn( index, c);
            tab_intersect_union = [ tab_intersect_union  index];
            result = result * MasseIn( index, c)  ;
        end
        
        if(distance_type == 1)
            result_distance =     result * get_Jaccard_Distance(tab_intersect_union);
        else if (distance_type == 2)
                    result_distance =     result * get_Zhang_Distance(tab_intersect_union);
            end
        end
        missing = result - result_distance;
        
        % Calculate weights
        weight = original_masses / sum(original_masses(:)) ;
        
        for h1=1:sources_number
            for h2=1:power_set_size
                Masse(h1,h2) = Masse(h1,h2) + missing * weight(h1,h2);
            end
        end
        
        % Accumulate the masses
        Final_Mass = Final_Mass + sum(Masse);
    end
end
