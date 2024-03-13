function [out] = vtob(in)
% computing FMT from v to b. use algortihm mtoq
% in = v vector
% out = b vector

lm = length(in);
natoms = round(log2(lm)); 		
if 2^natoms == lm 
	if min(in)>0
		out = prod(in)./exp( mtob(log(in)));
	else
	'accident in vtob: one of the weigths are non positive'
	end
else
	'ACCIDENT in vtob: length of input vector not OK: should be a power of 2'
end
