% Main entrance

%% Load the given sequence
clc;clear;close all;
load('x.mat');

%% Time domain & Frequency domain analyze
N=100;  n=0:N-1;
[h,w]=freqz(x,1,512);

figure('Name','Information of x sequence');
set(gcf,'outerposition',get(0,'screensize')); % Make the windows full of the screen

subplot(211);stem(n,x);
title('Time Domain');xlabel('Time index n');ylabel('Amploitude');
grid on;
subplot(212);plot(w/pi,abs(h));
title('Frequency Domain');xlabel('Normalized radian frequency');ylabel('Amplitude');
grid on;

%% processing the low frequency one y1
lp_rectan;
y1=filter(b1,1,x);
[h1,w1]=freqz(y1,1,512);

figure('Name','The low one');
set(gcf,'outerposition',get(0,'screensize'));

subplot(311);stem(n,y1);
title('y1 sequence in Time Domain');
axis([0 100 -6 6]);grid on;
subplot(312);plot(w/pi,abs(h1));
title('Y1 sequence in Frequency Domain');
axis([0 1 0 160]);grid on;
subplot(313);plot(wf1/pi,abs(hf1));
title('Filter of lp');
xlabel('Normalized radian frequency');ylabel('Gain');
grid on;


%% processing the mid frequency one y2
bp_rectan;
y2=filter(b2,1,x);
[h2,w2]=freqz(y2,1,512);

figure('Name','The middle one');
set(gcf,'outerposition',get(0,'screensize'));

subplot(311);stem(n,y2);
title('y2 sequence in Time Domain');
axis([0 100 -6 6]);grid on;
subplot(312);plot(w/pi,abs(h2));
title('Y2 sequence in Frequency Domain');
axis([0 1 0 160]);grid on;
subplot(313);plot(wf2/pi,abs(hf2));
title('Filter of bp');
xlabel('Normalized radian frequency');ylabel('Gain');
grid on;

%% processing the high frequency one y3
hp_rectan;
y3=filter(b3,1,x);
[h3,w3]=freqz(y3,1,512);

figure('Name','The high one');
set(gcf,'outerposition',get(0,'screensize'));

subplot(311);stem(n,y3);
title('y3 sequence in Time Domain');
axis([0 100 -6 6]);grid on;
subplot(312);plot(w/pi,abs(h3));
title('Y3 sequence in Frequency Domain');
axis([0 1 0 160]);grid on;
subplot(313);plot(wf3/pi,abs(hf3));
title('Filter of hp');
xlabel('Normalized radian frequency');ylabel('Gain');
grid on;

%% Compare processing
fig_in_one;
compare_in_one;
