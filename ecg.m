% EOG Signal Processing in MATLAB
clc
clear all
close all
%% Generate a sample EOG signal
Fs = 1000; % Sampling frequency in Hz
t = 0:1/Fs:1; % Time vector from 0 to 1 second
f = 1; % Frequency of the EOG signal in Hz
eog_signal = 0.5*sin(2*pi*f*t);

% Add noise to the EOG signal
noise = 0.1*randn(size(t));
eog_signal_with_noise = eog_signal + noise;

% Filter the EOG signal to remove noise
cutoff_frequency = 10; % Cutoff frequency for the low-pass filter
order = 4; % Order of the filter
[b, a] = butter(order, cutoff_frequency/(Fs/2), 'low');
filtered_eog_signal = filtfilt(b, a, eog_signal_with_noise);

% Rectify the filtered EOG signal
rectified_eog_signal = abs(filtered_eog_signal);

%% Display the original and processed signals
figure;

subplot(4,1,1);
plot(t, eog_signal);
title('Original EOG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t, eog_signal_with_noise);
title('EOG Signal with Noise');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t, filtered_eog_signal);
title('Filtered EOG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
plot(t, rectified_eog_signal);
title('Rectified EOG Signal');
xlabel('Time (s)');
ylabel('Amplitude');

%% Set a threshold for peak detection
threshold = 0.2;

% Find peaks using the custom function
[peaks, locs] = findpeaks_custom(rectified_eog_signal, threshold);

% Display peaks on the rectified EOG signal plot
subplot(4,1,4);
hold on;
plot(t(locs), peaks, 'r', 'Marker', 'o', 'LineStyle', 'none');
hold off;

% Display peak information
disp('Detected Peaks:');
disp(t(locs));


