t=0:.1:100;
w1=.05*pi;
w2=.2*pi;
w3=.4*pi;
w4=.6*pi;
w5=.9*pi;

x1=cos(pi*w1*t);
x2=cos(pi*w2*t);
x3=cos(pi*w3*t);
x4=cos(pi*w4*t);
x5=cos(pi*w5*t);

x=x1+x2+x3+x4+x5;
y=filter(b,1,x);

fx1=freqz(x1);
fx2=freqz(x2);
fx3=freqz(x3);
fx4=freqz(x4);
fx5=freqz(x5);

fx=freqz(x);
fy=freqz(y);

figure('Name','Impz of exmaple_2');impz(b);

figure('Name','归一化频率验证example_2');
subplot(4,2,1);
plot(w/pi,abs(fx1));title('X1');
subplot(4,2,2);
plot(w/pi,abs(fx2));title('X2');
subplot(4,2,3);
plot(w/pi,abs(fx3));title('X3');
subplot(4,2,4);
plot(w/pi,abs(fx4));title('X4');
subplot(4,2,5);
plot(w/pi,abs(fx5));title('X5');
subplot(4,2,7);
plot(w/pi,abs(fx));title('X');
subplot(4,2,8);
plot(w/pi,abs(fy));title('Y');

figure('Name','非归一化频率');
subplot(4,2,1);
plot(w,abs(fx1));title('X1');
subplot(4,2,2);
plot(w,abs(fx2));title('X2');
subplot(4,2,3);
plot(w,abs(fx3));title('X3');
subplot(4,2,4);
plot(w,abs(fx4));title('X4');
subplot(4,2,5);
plot(w,abs(fx5));title('X5');
subplot(4,2,7);
plot(w,abs(fx));title('X');
subplot(4,2,8);
plot(w,abs(fy));title('Y');
