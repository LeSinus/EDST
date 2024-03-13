function [out]=AddConflict(natoms,Int,ind,in,indAjout,experts,nbexperts)
% recursive function for add the conflict for 3 and more experts

if experts<nbexperts+1
    for k=2:2^natoms-1
        Int2=intersect(Int,ind{k});
        if isempty(Int2)
            in=[in sortrows([indAjout; k;zeros(nbexperts-experts,1)])];
        else
            expertsRec=experts+1;
            indAjoutRec=[indAjout ; k];
            [in]=AddConflict(natoms,Int,ind,in,indAjoutRec,expertsRec,nbexperts);
        end
    end
end
out=in;
                        