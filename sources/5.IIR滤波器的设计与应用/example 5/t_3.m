% 设计低通数字滤波器，要求
% 在通带内频带低于 0.2pi rad/s 时，允许幅度误差在1dB以内，
% 在频率 0.3pi rad/s ~ pi rad/s 之间的阻带衰减大于15dB。
% 用双线性设计数字滤波器， ，模拟滤波器采用巴特沃兹滤波器原型。
clc;clear;close all;

rp=1;rs=15;
wp=.2*pi; ws=.3*pi;
Fs=1;
wap=tan(wp/2);
was=tan(ws/2);
[n,wn]=buttord(wap,was,rp,rs,'s');
[z,p,k]=buttap(n);
[bp,ap]=zp2tf(z,p,k);
[bs,as]=lp2lp(bp,ap,wap);
[bz,az]=bilinear(bs,as,Fs/2);
[h,w]=freqz(bz,az,256);
plot(w,abs(h));grid on;
xlabel('wp=0.2\pi ws=0.3\pi');
title('低通数字滤波器');
prove;
