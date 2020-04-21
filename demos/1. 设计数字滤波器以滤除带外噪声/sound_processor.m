% 对语音信号进行预处理，包括：
% 1.提取长度和频率向量
% 2.将双声道合并为单声道
% 3.播放原始音频信号

% 音频预先处理
L=length(x);
n=0:L-1;
X=fft(x,L);%对Y进行N点DFT变换到频域
f=fs*(0:L/2-1)/L;%对应点的频率

% 合并声道
x1=x(:,1); % 抽取第 1 声道
x2=x(:,2); % 抽取第 2 声道
x=(x1+x2); % 两路单声道列向量矩阵变量合并
xm=max(max(x),abs(min(x))); % 找出极值
x=x./xm; % 归一化处理

figure('Name','原始语音信号的时频分析');
set(gcf,'outerposition',get(0,'screensize'));

subplot(211);plot(n,x);
title('原始语音信号采样后时域波形图');
grid on;
subplot(212);plot(f,abs(X(1:L/2)));
title('原始语音信号采样后频谱图');
xlabel('频率/Hz（截至5KHz）');
ylabel('幅度（截至4500）');
axis([0 5*1000 0 4500]);
grid on;

% sound(x,fs);
% pause(21);