function [out] = vtom(in)
% computing FMT from v to m. 
% in = v vector
% out = m vector
out = btom(vtob(in));
