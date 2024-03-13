function [out] = pltobel(in)

out = pltob(in);
if out(1) < 1
	out = out / (1-out(1));
end
out(1) = 0;
