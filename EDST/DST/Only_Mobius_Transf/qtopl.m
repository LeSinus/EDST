function [out] = qtopl(in)
% computing FMT from q to pl.
% in = q vector
% out = pl vector
in(1) = 0;
out = abs(btom(in));
