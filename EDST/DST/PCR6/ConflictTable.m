function [out] = ConflictTable(lm,nbexperts)
% computing the table of conflict for nbexperts and natoms =
% round(log2(lm)) classes

% out = array nbexperts lines and number of conflict columns. Only one kind
% of conflict is done. 
% E.g. if expert 1 says 3, and expert 2 says 2 gives [2;3]
% and if expert 1 says 2, and expert 2 says 3 gives also [2;3]


natoms = round(log2(lm)); 		
if 2^natoms == lm 
    ind(1)={[1]};
    ind(2)={[2]};
    step =3;
    while step<2^natoms
        ind(step)={[step]};
        step=step+1;
        indatom=step;
        for step2=2:indatom-2
            ind(step)={union(ind{indatom-1},ind{step2})};
            step=step+1;
        end
    end

    out=[];
	for i=2:2^natoms-1
        for j=i+1:2^natoms-1
            Int=intersect(ind{i},ind{j});
            if isempty(Int)
                out=[out sortrows([i; j;zeros(nbexperts-2,1)])];
            else
                experts=3;
                indAjout=[i; j];
                [out]=AddConflict(natoms,Int,ind,out,indAjout,experts,nbexperts);
                
            end
        end
	end
else
 	'ACCIDENT in ConflictTable: length of input vector not OK: should be a power of 2'
end


out=unique(out','rows')';

