function [out] = mtonm(in)
% transform bbm m into normalized bbm

%
%   Version : Oct 25,02.
%   Copyright (c) 2002 by Philippe Smets, Brussels, Belgium.
% 	Author: Philippe Smets
%

% kept for compataibility with FMT 1.0
if in(1) < 1, out = in./(1-in(1)); end
out(1)=0;
