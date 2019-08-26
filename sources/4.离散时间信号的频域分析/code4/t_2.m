% 验证 DTFT 时域卷积定理
clf;clc;clear;

n1=0:10; n2=0:18; k=0:500;
w=pi/500*k; n=0:28;
x1=(0.8).^n1; x2=(0.6).^n2;

% g[n] conv h[n]
y1=conv(x1,x2);
Y1=y1*(exp(-1j*pi/500)).^(n'*k);

% G .* H
G=x1*(exp(-1j*pi/500)).^(n1'*k);
H=x2*(exp(-1j*pi/500)).^(n2'*k);
Y2=G.*H;

subplot(3,1,1);
plot(w,abs(Y1));grid on;
title('g[n] conv h[n]');
subplot(3,1,2);
plot(w,abs(Y2));grid on;
title('G(e^j^\omega) * H(e^j^\omega)');
subplot(3,1,3);
plot(w,abs(Y1)-abs(Y2) );grid on;
title('Difference');axis([0 3.5 -1 1]);