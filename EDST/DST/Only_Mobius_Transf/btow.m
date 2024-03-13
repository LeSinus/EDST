function [out] = btow(in)
% computing FMT from b to w. 
% in = b vector
% out = w vector

out = qtow(btoq(in));
