function [Masses] = get_Conjunctive_Masses(MasseIn)
% Calculates the conjunctive masses based on the provided mass assignments.

% Get the dimensions of the mass assignment matrix
[power_set_size, sources_number] = size(MasseIn);

% Initialize belief and plausibility vectors
belief = ones(1, power_set_size);
plausibility = ones(1, power_set_size);

% Iterate through each source to compute belief and plausibility
for i = 1:sources_number
    % Convert mass assignment to belief and plausibility vectors
    bj = mtob(MasseIn(:, i));
    qj = mtoq(MasseIn(:, i));
   
    % Update belief and plausibility vectors
    belief = belief .* bj;
    plausibility = plausibility .* qj;
end

% Compute Dempster-Shafer combination criteria (normalized)
Masses = qtom(plausibility);
Masses(1) = 0; % Set the empty set mass to 0

end
