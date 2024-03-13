function [out] = mtob(in)
% computing FMT from m to b. 
% in = m vector
% out = b vector

lm = length(in);
natoms = round(log2(lm)); 		
if 2^natoms == lm 
for step = 1:natoms 
	i124 = 2^(step-1); 			
	i842 = 2^(natoms+1-step); 	
	i421 = 2^(natoms - step); 	
	in = reshape(in,i124,i842);
	in(:,(1:i421)*2) = in(:,(1:i421)*2) + in(:,(1:i421)*2-1);
end	
out = reshape(in,1,lm);
else
	'ACCIDENT in mtob: length of input vector not OK: should be a power of 2'
end
