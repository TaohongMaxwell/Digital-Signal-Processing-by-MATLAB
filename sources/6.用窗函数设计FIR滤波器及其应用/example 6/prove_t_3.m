t=0:.1:50;

w1=.5*pi;
w2=1.6*pi;
w3=3*pi;

x1=cos(pi*w1*t);
x2=cos(pi*w2*t);
x3=cos(pi*w3*t);
x=x1+x2+x3;
y=filter(b,1,x);

fx1=freqz(x1); fx2=freqz(x2); fx3=freqz(x3);
fx=freqz(x); fy=freqz(y);

figure('Name','Impz of t_3');impz(b);

figure('Name','归一化频率验证t_3');
subplot(3,3,1);
plot(t,x1);title(['x1=cos(',num2str(w1/pi),'\pi)']);
subplot(3,3,2);
plot(t,x2);title(['x2=cos(',num2str(w2/pi),'\pi)']);
subplot(3,3,3);
plot(t,x3);title(['x3cos(',num2str(w3/pi),'\pi)']);

subplot(3,3,4);
plot(w/pi,abs(fx1));title('X1');
subplot(3,3,5);
plot(w/pi,abs(fx2));title('X2');
subplot(3,3,6);
plot(w/pi,abs(fx3));title('X3');

subplot(3,3,7);
plot(w/pi,abs(fx));title('X');
subplot(3,3,8);
plot(w/pi,abs(fy));title('Y');
subplot(3,3,9);
plot(t/pi,y);title('y');

figure('Name','非归一化频率');
subplot(3,3,1);
plot(t,x1);title('x1');
subplot(3,3,2);
plot(t,x2);title('x2');
subplot(3,3,3);
plot(t,x3);title('x3');

subplot(3,3,4);
plot(w,abs(fx1));title('X1');
subplot(3,3,5);
plot(w,abs(fx2));title('X2');
subplot(3,3,6);
plot(w,abs(fx3));title('X3');

subplot(3,3,7);
plot(w,abs(fx));title('X');
subplot(3,3,8);
plot(w,abs(fy));title('Y');
subplot(3,3,9);
plot(t,y);title('y');
