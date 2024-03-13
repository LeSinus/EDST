function [out] = mtopl(in)
% computing FMT from m to pl
% in = m vector
% out = pl vector

out = btopl(mtob(in));
