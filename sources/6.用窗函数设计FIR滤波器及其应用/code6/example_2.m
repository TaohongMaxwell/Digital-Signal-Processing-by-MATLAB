%多带滤波器的设计
clc;clear;close all;

f=[0  0.125  0.125  0.250  0.250  0.500  0.500  0.750  0.750  1.00];
m=[1  1  0.5  0.5  0.25  0.25  1/6  1/6  0.125  0.125];
b=fir2(60,f,m);
[h,w]=freqz(b);
plot(f,m,w/pi,abs(h))
grid on;
legend('理想滤波器','设计滤波器');
prove_2;
