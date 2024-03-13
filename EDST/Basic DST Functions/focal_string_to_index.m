function index = focal_string_to_index(focal_str) 
    % Convert a string representation of focal elements to their corresponding numerical index.

    % Initialize an empty array to store individual characters of the string
    all_focal = [];

    % Split the string into individual characters and store them in 'all_focal'
    while ~isempty(focal_str)
        all_focal = [all_focal; focal_str(1)];
        focal_str = focal_str(2:end);
    end

    % Determine the number of characters
    num_chars = size(all_focal, 1);

    % Initialize the final index value
    index_final = 0;

    % Initialize a counter
    t = -1;

    % Iterate through the characters to compute the index
    while num_chars > 0
        % Calculate the value of the character
        char_value = abs(all_focal(1)) - 95;

        % Calculate the corresponding index
        index = 2^(char_value - 2) + 1;

        % Update the final index value
        index_final = index_final + index;

        % Remove the processed character
        all_focal = all_focal(2:end);

        % Update the number of characters
        num_chars = size(all_focal, 2);

        % Increment the counter
        t = t + 1;
    end

    % Adjust the final index value
    index_final = index_final - t;

    % Assign the final index value to the output variable
    index = index_final;
end