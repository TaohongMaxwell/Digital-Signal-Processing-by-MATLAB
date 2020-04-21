clc;close all;clear;

% fftfilt
% FFT-based FIR filtering using overlap-add method

[x,fs]=audioread('audio20s.mp3');

sound_processor; %音频预先处理

add_single_frequency_noise_out;%加入4KHz单频噪声，并进行滤波
add_single_frequency_noise_in;%加入1KHz单频噪声，并进行陷波
add_all_frequency_noise;%加入全频段噪声，并进行滤波

% close all;