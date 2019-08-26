% 判断系统 y[n]=nx[n] 的线性
% Generate the input sequences
clf;n=0:50;a=2;b=-3;

x1=cos(2*pi*0.2*n);
x2=cos(2*pi*0.6*n);
x=a*x1+b*x2;

y1=n.*x1;
y2=n.*x2;
y=n.*x;
yt=a.*y1+b.*y2;
d=y-yt;

subplot(3,1,1);
stem(n,y);grid on;
title('Normal output');

subplot(3,1,2);
stem(n,yt);grid on;
title('Add output');

subplot(3,1,3);
stem(n,d);grid on;
title('Different signal');
axis([0 50 -1 1]);