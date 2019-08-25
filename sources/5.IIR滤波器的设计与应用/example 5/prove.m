%% Given 2 sequence
t=0:.1:100;
w1=.1*pi;
w2=1*pi;
x1=cos(2*pi*w1*t);
x2=cos(2*pi*w2*t);

%% Structure a new sequence by added that two sequences
x=x1+x2;
y=filter(bz,az,x);

% Turn to Time domain
fx1=freqz(x1); fx2=freqz(x2);
fx=freqz(x); fy=freqz(y);

%% Figures part
figure;impz(bz);

figure;
subplot(4,2,1);
plot(t,x1);title('x1');
subplot(4,2,2);
plot(t,x2);title('x2');
subplot(4,2,3);
plot(t,x);title('x1+x2');
subplot(4,2,4);
plot(t,y);title('y');

subplot(4,2,5);
plot(abs(fx1));title('X1');
subplot(4,2,6);
plot(abs(fx2));title('X2');
subplot(4,2,7);
plot(abs(fx));title('X1+X2');
subplot(4,2,8);
plot(abs(fy));title('Y');