% 参考：根据对滤波器的指标要求，阻带衰减不小于40 dB，选择汉宁窗。
%基于窗函数设计FIR滤波器
clc;clear;close all;

wp=0.5*pi;ws=0.66*pi;   %性能指标
wdelta=ws-wp;           %过渡带宽度
N=ceil(3.11*pi/wdelta)  %滤波器长度
Nw=2*N+1;               %窗口长度
wc=(ws+wp)/2;           %截止频率
win=hanning(Nw);        %汉宁窗的时域响应
b=fir1(Nw-1,wc/pi,win) %fir1是基于加窗的线性相位FIR数字滤波器设计函数。N-1为滤波器的阶数。Win为窗函数，是长度为N的列向量，默认是函数自动取hamming。
freqz(b,1,512)          %为求取频率响应。分子为b，分母为1
[h,w]=freqz(b,1,512);
figure('Name','Filter of example_1');plot(w,abs(h));

prove_1;
