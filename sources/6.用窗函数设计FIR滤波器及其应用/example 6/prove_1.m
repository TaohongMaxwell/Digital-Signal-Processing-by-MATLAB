t=0:.1:50;

w1=0.5*pi;
w2=3*pi;
x1=cos(pi*w1*t);
x2=cos(pi*w2*t);
x=x1+x2;
y=filter(b,1,x);

fx1=freqz(x1); fx2=freqz(x2);
fx=freqz(x); fy=freqz(y);

figure('Name','Impz of exmaple_1');impz(b);

figure('Name','归一化频率验证example_1');
subplot(4,2,1);
plot(t,x1);title(['x1=cos(',num2str(w1/pi),'\pi)']);
subplot(4,2,2);
plot(t,x2);title(['x2=cos(',num2str(w2/pi),'\pi)']);
subplot(4,2,3);
plot(t,x);title('x1+x2');
subplot(4,2,4);
plot(t,y);title('y');
subplot(4,2,5);
plot(w/pi,abs(fx1));title('X1');
subplot(4,2,6);
plot(w/pi,abs(fx2));title('X2');
subplot(4,2,7);
plot(w/pi,abs(fx));title('X1+X2');
subplot(4,2,8);
plot(w/pi,abs(fy));title('Y');

figure('Name','非归一化频率');
subplot(4,2,1);
plot(t,x1);title(['x1=cos(',num2str(w1/pi),'\pi)']);
subplot(4,2,2);
plot(t,x2);title(['x2=cos(',num2str(w2/pi),'\pi)']);
subplot(4,2,3);
plot(t,x);title('x1+x2');
subplot(4,2,4);
plot(t,y);title('y');
subplot(4,2,5);
plot(w,abs(fx1));title('X1');
subplot(4,2,6);
plot(w,abs(fx2));title('X2');
subplot(4,2,7);
plot(w,abs(fx));title('X1+X2');
subplot(4,2,8);
plot(w,abs(fy));title('Y');
