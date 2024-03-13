function [out] = mtow(in)
% computing FMT from m to w. 
% in = m vector
% out = w vector

out = qtow(mtoq(in));
