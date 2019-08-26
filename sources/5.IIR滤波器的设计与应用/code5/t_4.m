% 设计一个巴特沃兹高通滤波器，
% 要求通带截止频率为 0.6pi ，通带内衰减不大于1dB，
% 阻带起始频率为 0.4pi ，阻带内衰减不小于15dB，T=1。
clc;clear;close all;

rp=1;rs=15;
wp=.6*pi; ws=.4*pi;
Fs=1;
wap=tan(wp/2);
was=tan(ws/2);
[n,wn]=buttord(wap,was,rp,rs,'s');
[z,p,k]=buttap(n);
[bp,ap]=zp2tf(z,p,k);
[bs,as]=lp2hp(bp,ap,wap);
[bz,az]=bilinear(bs,as,Fs/2);
[h,w]=freqz(bz,az,256);
plot(w,abs(h));grid on;
xlabel('ws=0.4\pi wp=0.6\pi');
title('巴特沃兹高通滤波器');

prove;
