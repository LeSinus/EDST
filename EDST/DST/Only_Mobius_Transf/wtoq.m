function [out] = wtoq(in)
% computing FMT from w to q. use algortihm mtoq
% in = w vector
% out = q vector

lm = length(in);
natoms = round(log2(lm)); 		
if 2^natoms == lm 
	if min(in)>0
		out = prod(in)./exp( mtoq(log(in)));
	else
	'accident in wtoq: one of the weigths are non positive'
	end
else
	'ACCIDENT in wtoq: length of input vector not OK: should be a power of 2'
end
