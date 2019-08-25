% （3）设计一个带阻滤波器
% 带阻为0.4到0.65 ，阶数为34
% 并且使用一个切比雪夫窗，并与默认的窗函数进行比较
clc;clear;close all;

w1=0.4; w2=0.65;
alpha=40; N=34;
win=chebwin(N+1,alpha);
b=fir1(N,[w1,w2],'stop',win);
freqz(b,1,512)
[h,w]=freqz(b,1,512);
figure('Name','Filter of t_3');plot(w,abs(h));

prove_t_3;