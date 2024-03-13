function [Final_Masses]=CBF(MasseIn)
    % Reference: Tang, Y., Zhang, X., Zhou, Y. et al.
    % A new correlation belief function in Dempster-Shafer evidence theory and its application in classification.
    % Sci Rep 13, 7609 (2023). https://doi.org/10.1038/s41598-023-34577-y

    % Get the size of the power set and the number of sources
    [power_set_size, sources_number] = size(MasseIn);
    
    % Calculate the size of the frame of discernment
    nbclasses = log2(power_set_size);
    
    % Initialize arrays for modified and transferred belief functions
    modified_BBA = repmat(0,power_set_size,sources_number);
    transferred_BBA  = repmat(0,power_set_size,sources_number);
 
    % 1. Modified BBA (m) of proposition
    % Replace original masses by pignistic masses for singletons
     for k=1:sources_number
        massetmp=MasseIn(:,k);
        pignistic_proba = mtobetp(massetmp'); % pignistic transformation BetP
    
        % affect singleton to the modified BBA
        for j=1:nbclasses
            modified_BBA(2^(j-1)+1,k) = pignistic_proba(j);
        end
     end
    
    % 2. Correlation belief transfer
    % Transfer masses from singletons to multi-subset propositions with intersection
    transferred_BBA = modified_BBA;

    for k=1:sources_number
        massetmp=modified_BBA(:,k);
        for j=2:power_set_size
            if (( get_Cardinality(j) == 1) && (modified_BBA(j,k)~=0 ))
                for z = j+1 :power_set_size
                    if (get_Intersection_Index(j,z) == j)
                        transferd_masse = modified_BBA(j,k) /((2^(nbclasses) - 1) * get_Cardinality(z) );
                        transferred_BBA(j,k) = transferred_BBA(j,k) - transferd_masse;
                        transferred_BBA(z,k) = transferred_BBA(z,k) + transferd_masse;
                    end
                end
            end
        end
    end
    
    % Combine the transferred masses using Dempster's rule of combination
    Final_Masses = DST(transferred_BBA, 2) ;
end