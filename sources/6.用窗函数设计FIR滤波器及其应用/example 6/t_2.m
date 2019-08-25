% （2）利用窗函数法设计一个线性相位FIR低通滤波器，性能指标为：
% 通带截止频率为0.2pi，带阻截止频率为0.3pi
% 阻带衰减不小于40dB，通带衰减不大于3dB
% 编写程序实现，并绘制图形
clc;clear;close all;

wp=0.2*pi;ws=0.3*pi;    %性能指标
wdelta=ws-wp;           %过渡带宽度
N=ceil(3.11*pi/wdelta)  %滤波器长度
Nw=2*N+1;               %窗口长度
wc=(ws+wp)/2;           %截止频率
win=hanning(Nw);        %汉宁窗的时域响应

b=fir1(Nw-1,wc/pi,win)
% fir1是基于加窗的线性相位FIR数字滤波器设计函数。
% N-1为滤波器的阶数。
% Win为窗函数，是长度为N的列向量，默认是函数自动取hamming。

freqz(b,1,512)          %为求取频率响应。分子为b，分母为1
[h,w]=freqz(b,1,512);
figure('Name','Filter of t_2');plot(w,abs(h));

prove_t_2;