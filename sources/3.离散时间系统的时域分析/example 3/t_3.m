% 判断系统 y[n]=nx[n] 时不变性
% Generate the input sequences
clf;  n=0:40;  D=10;  
x = cos(2*pi*0.1*n);
xd=[zeros(1,D),x]; 
n1=0:40+D;

y=n.*x;
yd=n1.*xd;
d = y - yd(1+D:41+D);

subplot(3,1,1);
stem(n,y);grid on;
title('Output y[n]');

subplot(3,1,2);
stem(n,yd(1:41) );grid on;
title(['Output due to Delayed Input x[n - ', num2str(D),']']);

subplot(3,1,3);
stem(n,d);grid on;
title('Difference Signal');