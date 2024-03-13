function [out] = wtob(in)
% computing FMT from w to b. 
% in = w vector
% out = b vector
out = qtob(wtoq(in));
