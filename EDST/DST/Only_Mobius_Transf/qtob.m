function [out] = qtob (in)
% computing FMT from q to b. Compute thru pl
% in = q vector
% out = pl vector

out = pltob(qtopl(in));
