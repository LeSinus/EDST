function [out] = pltow(in)
% computing FMT from pl to w. 
% in = pl vector
% out = w vector

out = qtow(pltoq(in));
