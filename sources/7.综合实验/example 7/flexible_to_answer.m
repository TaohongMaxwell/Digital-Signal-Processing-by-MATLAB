% 选做题，爱做不做
clc;close all;

% bp_hamming;
lp_rectan;
lp_btwz;

yrec=filter(b1,1,x);
y=filter(b,1,x);
[hrec,wrec]=freqz(yrec,1,512);
[h,w]=freqz(y,1,512);

figure('Name','不同窗函数滤波效果对比');
set(gcf,'outerposition',get(0,'screensize'));
subplot(321);stem(n,yrec);
title('矩形窗时域');grid on;
subplot(322);plot(wrec/pi,abs(hrec));
title('矩形窗频域');grid on;

subplot(323);stem(n,y);
title('对比滤波器时域');grid on;
subplot(324);plot(w/pi,abs(h));
title('对比滤波器频域');grid on;

subplot(325);stem(n,abs(yrec-y));
title('时域对比');
% axis([0 100 0 2]);
grid on;
subplot(326);
plot(w/pi,abs( abs(hrec)-abs(h) ) );
title('频域对比');grid on;