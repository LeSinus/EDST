function [out] = qtow(in)
% computing FMT from q to w. Use algorithm qtom on log q
% in = q vector
% out = w vector

lm = length(in);
natoms = round(log2(lm)); 		
if 2^natoms == lm 
	if in(lm) > 0
		out = exp(-(qtom(log(in))));
		out(lm) = 1;
	else
		'Accident in qtow: algorithm works only if q(½) > 0'
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
		out = exp(-(qtom(log(in))));
		out(lm) = 1;
	end
else
	'ACCIDENT in qtow: length of input vector not OK: should be a power of 2'
end
