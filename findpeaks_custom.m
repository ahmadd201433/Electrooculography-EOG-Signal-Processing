function [peaks, peak_indices] = findpeaks_custom(signal, threshold)
    % Find peaks in the signal above the specified threshold
    
    % Ensure the signal has at least two points
    if length(signal) < 2
        error('Signal must have at least two points');
    end
    
    % Initialize variables
    peaks = [];
    peak_indices = [];
    
    % Iterate through the signal
    for i = 2:(length(signal) - 1)
        % Check if the current point is a peak above the threshold
        if signal(i) > signal(i - 1) && signal(i) > signal(i + 1) && signal(i) > threshold
            peaks = [peaks, signal(i)];
            peak_indices = [peak_indices, i];
        end
    end
end
