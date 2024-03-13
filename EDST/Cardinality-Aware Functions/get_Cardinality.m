function [Cardinality] = get_Cardinality(focal)
    % Check if the focal element is the empty set
    if(focal == 1)
        Cardinality = 0;
        return
    % Check if the focal element is one of the singletons
    elseif ((focal == 2) || (focal == 3))
        Cardinality = 1;
        return
    % Check if the focal element is the union of two singletons
    elseif (focal == 4)
        Cardinality = 2;
        return
    end

    % Calculate the cardinality based on the given focal element
    res = focal;
    iteration_count = 0; % Counter for the number of iterations
    while (res > 2)
        res = res / 2;
        iteration_count = iteration_count + 1;
    end
    frame_size = iteration_count + 1; % Calculate the size of the frame of discernment
    offset = focal - 2^(frame_size - 1); % Calculate the offset
    Cardinality = 1 + get_Cardinality(offset); % Recursively calculate the cardinality
end
