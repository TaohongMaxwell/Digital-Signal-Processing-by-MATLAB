% 比较计算结果
% Generate the input sequences
clf;n=0:50;
x=sin(2*pi*0.2*n);

% using filter function compute
num=[1 -2 1];den=[1];ic=[0 0];
y1=filter(num,den,x,ic);

% using delay method compute
x10 = [x 0 0];% x1[n] = x[n+1] 
x00 = [0 x 0];% x2[n] = x[n]
x01 = [0 0 x];% x3[n] = x[n-1]
y2=x10-2*x00+x01;
y2=y2(1:51);

d=y1-y2;% compare two method

subplot(3,1,1);
stem(n,y1);title('Filter method');grid on;

subplot(3,1,2);
stem(n,y2);title('Delay method');grid on;

subplot(3,1,3);
stem(n,d);title('Different');grid on;
axis([0 50 -1 1]);
