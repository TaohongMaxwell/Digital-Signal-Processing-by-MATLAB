% 计算一个N=12的序列x(n)=cos(n*pi/6)的 DTFT 和 DFT，并分析他们的关系
clf;clc;clear;

N=12; n=0:N-1;
x=cos(n*pi/6);
k=0:500;
w=(pi/500)*k;

% DTFT
X=x*(exp(-1i*2*pi/500)).^(n'*k);
% magX=abs(X);angX=angle(X);
% realX=real(X);imagX=imag(X);

% DFT
k=n;
WN=exp(-1i*2*pi/N);
nk=n'*k;
WNnk=WN.^nk;
Xk=x*WNnk;

subplot(2,1,1);
plot(w/pi,abs(X));grid on;
title('DTFT');
subplot(2,1,2);
stem(k,abs(Xk));grid on;
title('DFT');
