function [out] = beltow(in)
% computing FMT from bel to w. 
% in = b vector
% out = w vector

out = qtow(btoq(in));
