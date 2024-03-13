function [out] = pltoq(in)
% computing FMT from pl to q. 
% in = pl vector
% out = q vector

out = abs(btom(in));
out(1)=1;
