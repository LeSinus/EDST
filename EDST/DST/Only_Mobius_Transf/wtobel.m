function [out] = wtobel(in)
% computing FMT from w to b. 
% in = w vector
% out = b vector
out = qtobel(wtoq(in));
