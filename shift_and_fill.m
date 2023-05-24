function arr_shifted = shift_and_fill(arr, shift_size)
    % Ensure shift_size is integer
    if mod(shift_size, 1) ~= 0
        error('Shift size must be an integer.');
    end
    
    % Shift array
    if shift_size > 0  % Shift right
        arr_shifted = [zeros(1, shift_size), arr(1:end-shift_size)];
    elseif shift_size < 0  % Shift left
        arr_shifted = [arr(-shift_size+1:end), zeros(1, -shift_size)];
    else  % No shift
        arr_shifted = arr;
    end
end
