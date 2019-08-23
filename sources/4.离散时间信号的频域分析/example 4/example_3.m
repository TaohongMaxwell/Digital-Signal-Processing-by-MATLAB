% DFT
% 熟悉离散傅里叶变换的概念及其性质
% 参考一：x(n)=sin(n*pi/8)+sin(n*pi/4)是一个N=16的序列，计算其傅里叶变换
clf;clear;

N=16; n=0:N-1;
xn=sin(n*pi/8)+sin(n*pi/4);
k=0:1:N-1;

WN=exp(-j*2*pi/N); nk=n'*k;
WNnk=WN.^nk; Xk=xn*WNnk;

subplot(2,1,1);stem(n,xn);
title('x[n] sequense');

subplot(2,1,2);stem(k,abs(Xk));
title('abs of X[k] sequense');
