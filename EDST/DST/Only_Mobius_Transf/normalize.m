function [out] = normalize(in, type, n_atoms)
% transform general function m,b,q,pl,betp into a normalized one

%
%   Version : Oct 25,02.
%   Copyright (c) 2002 by Philippe Smets, Brussels, Belgium.
% 	Author: Philippe Smets
%
if strcmp(type,'bel') 
	out = in/in(length(in)); 
	out(1) = 0; 
elseif strcmp(type,'pl')
	out = in/in(length(in)); 
	out(1) = 0; 
else	
	switch type
	case 'betp'
		% beware in is already a betp son length = cardinal 
		out = in/(sum(in)); 
	case 'm'
		out = in/(1-in(1)); out(1) = 0;
	case 'b'
		out = in/(1-in(1)); out(1) = 0;
	case 'q'
		cf = [1 -1];
		for i = 2:n_atoms
			cf = [cf -cf];
		end
		out = in /(1- cf*in'); out(1) = 1; 
	case 'w'
		% this is not really a clever way to do it, 
		% but the request seems also so odd that I don't care
		q = wtoq(in);
		cf = [1 -1];
		for i = 2:n_atoms
			cf = [cf -cf];
		end
		out = in; 
		out(1) = in(1)/(1-cf*q');
	case 'wd'
		b = wdtob(in);
		b = (b - b(1)) / (1-b(1));
		out = btowd(b);
	end	
end

