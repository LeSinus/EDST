function [out] = betp(m)
% computing BetP on W from the m vector 
% out = BetP vector: order a,b,c,...

% kept for compatibility with FMT 1.0

%
%   Version : Oct 25,02.
%   Copyright (c) 2002 by Philippe Smets, Brussels, Belgium.
% 	Author: Philippe Smets
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% for historical reasons these FMT function use line vecotrs and the TBMLAB use vertical vectors
% so I look if input vectors are line or ciolumn and tanspose the column one
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[nl nc] = size(m);
if nl > nc % case column
	m = m';
	to_be_transp = 1;
else
	to_be_transp = 0;
end

lm = length(m);
natoms = round(log2(lm)); 		
if 2^natoms == lm 
	out = mtobetp(m);
else
	'ACCIDENT in betp: length of input vector not OK: should be a power of 2'
end

if 	to_be_transp == 1
	out = out';
end
