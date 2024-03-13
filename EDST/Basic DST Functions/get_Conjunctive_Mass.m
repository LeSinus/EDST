function [conjunctive_mass] = get_Conjunctive_Mass(masses, elements) 
% Calculates the conjunctive mass based on provided mass assignments and focal elements.

[~, n] = size(elements);
conjunctive_mass = 1;

for i = 1:n
    index = elements(i);
    conjunctive_mass = conjunctive_mass * masses(index, i);
end