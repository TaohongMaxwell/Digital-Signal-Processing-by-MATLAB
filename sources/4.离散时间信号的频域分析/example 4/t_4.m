% 验证圆周卷积定理
clf;clc;clear;
k=0:100; w=pi/100*k;
n1=0:10; x1=(.8).^n1;
n2=0:18; x2=(.6).^n2;
k=0:100; N=28; n=0:N-1;

y1=mycirconv(x1,x2,N);
Y1=y1*(exp(-1j*pi/100)).^(n'*k);

G=x1*(exp(-1j*pi/100)).^(n1'*k);
H=x2*(exp(-1j*pi/100)).^(n2'*k);
Y2=G.*H;

subplot(3,1,1);
stem(w,abs(Y1));grid on;
title('g[n] circonv h[n]');

subplot(3,1,2);
stem(w,abs(Y2));grid on;
title('G(k) * H(k)');

subplot(3,1,3);
stem(w,abs(Y1)-abs(Y2) );grid on;
title('Difference');axis([0 3.5 -1 1]);