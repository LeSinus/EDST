function [out] = btoq(in)
% computing FMT from b to q. Compute thru pl
% in = b vector
% out = q vector

out = pltoq(btopl(in));
