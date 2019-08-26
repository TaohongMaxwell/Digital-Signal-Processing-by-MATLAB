clc;clf;clear;close all;

fp=100;fst=300;Fs=1000;
rp=3;rs=20;
wp=2*pi*fp/Fs;
ws=2*pi*fst/Fs;
Fs=Fs/Fs;  % let Fs=1   
wap=tan(wp/2);was=tan(ws/2);% 预畸变公式
[n,wn]=buttord(wap,was,rp,rs,'s') ;% 设计等效模拟滤波器
[z,p,k]=buttap(n); 
[bp,ap]=zp2tf(z,p,k)               % 设计模拟低通原型滤波器
[bs,as]=lp2lp(bp,ap,wap)   ;     % 将模拟低通原型滤波器转换为低通滤波器
[bz,az]=bilinear(bs,as,Fs/2)   % 实现双线性变换，即由模拟滤波器 得到数字滤波器
[h,w]=freqz(bz,az,256,Fs*1000);
plot(w,abs(h));grid on;
xlabel('wp=100  ws=300');
title('数字低通滤波器');

prove; % Prove that this filter work correctly
