% 加入全频白噪声，并进行滤波 
% 全频白噪声分布在所有频率范围，包括人声部分
% 可使用低通滤波器对其进行处理
% 结论：处理效果不好，由于滤波器的限制，只能够抑制阻带内的噪声，不论采用什么算法，都无法抑制通带内的白噪声

% 加入全频段白噪声
noise=.2*rand(L,1);
Noise=fft(noise,L);

y_z=x+noise;
Y_z=fft(y_z,L);%对加噪后的信号进行n点DFT变换到频域

figure('Name','加入白噪声后的时频分析');
set(gcf,'outerposition',get(0,'screensize'));

subplot(231);plot(noise);
title('白噪声的时域波形图');
grid on;
subplot(234);plot(f,abs(Noise(1:L/2)));
title('白噪声的频域波形图');
xlabel('频率/Hz（截至5KHz）');
ylabel('幅度（截至4500）');
axis([0 5*1000 0 4500]);
grid on;

%FIR_LP Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.1 and the DSP System Toolbox 9.3.
% Generated on: 30-Jun-2019 18:09:09

% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are in kHz.
Fs = 44.1;  % Sampling Frequency

N    = 300;      % Order
Fc   = 3.5;        % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = hamming(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'low', win, flag);
Hd = dsp.FIRFilter( ...
    'Numerator', b);

% [EOF]
y=fftfilt(b,y_z);
Y=fft(y,L);

subplot(232);plot(y_z);
title('加躁后的语音信号时域波形');
% axis([0 1000000 -.6 .8]);
grid on;
subplot(235);plot(f,abs(Y_z(1:L/2)));
title('加噪后的语音信号频域波形');
xlabel('频率/Hz（截至5KHz）');
ylabel('幅度（截至4500）');
axis([0 5*1000 0 4500]);
grid on;

subplot(233);plot(y);
title('滤波后的语音信号时域波形');
% axis([0 1000000 -.6 .8]);
grid on;
subplot(236);plot(f,abs(Y(1:L/2)));
title('滤波后的语音信号频域波形');
xlabel('频率/Hz（截至5KHz）');
ylabel('幅度（截至4500）');
axis([0 5*1000 0 4500]);
grid on;

% sound(y_z,fs);
% pause(21);