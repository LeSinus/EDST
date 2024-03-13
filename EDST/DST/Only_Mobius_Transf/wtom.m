function [out] = wtom(in)
% computing FMT from w to m. 
% in = w vector
% out = m vector
out = qtom(wtoq(in));
