function [out] = btov(in)
% computing FMT from b to v. Use algorithm btom on log b
% in = b vector
% out = v vector

lm = length(in);
natoms = round(log2(lm)); 		
if 2^natoms == lm 
	if in(lm) > 0
		out = exp(-(btom(log(in))));
		out(1) = 1;
	else
		'Accident in btov: algorithm works only if b(½) > 0'
		'I nevertheless try to compute it, I add an epsilon to m(½)'
		'No garantee it is really OK'
		mini=1;
		for i=1:lm
			if in(i)>0
				mini=min(mini,in(i));
			end
		end
		mini=mini/10000000000;
		for i = 1:lm
			in(i)=max(in(i),mini);
		end
		out = exp(-(btom(log(in))));
		out(1) = 1;
	end
else
	'ACCIDENT in btov: length of input vector not OK: should be a power of 2'
end
