function [out] = wtopl(in)
% computing FMT from w to pl. 
% in = w vector
% out = pl vector
out = qtopl(wtoq(in));
