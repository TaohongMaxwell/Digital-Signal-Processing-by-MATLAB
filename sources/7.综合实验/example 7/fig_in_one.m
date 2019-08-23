% 时频变换总览

figure('Name','时频变换总览');
set(gcf,'outerposition',get(0,'screensize'));

subplot(421);stem(n,x);
title('x sequence in Time Domain');
grid on;
subplot(422);plot(w/pi,abs(h));
title('X sequence in Frequency Domain');
grid on;

subplot(423);stem(n,y1);
title('x1 sequence in Time Domain');
axis([0 100 -6 6]);
grid on;
subplot(424);plot(w/pi,abs(h1));
title('X1 sequence in Frequency Domain');
axis([0 1 0 160]);
grid on;

subplot(425);stem(n,y2);
title('x2 sequence in Time Domain');
axis([0 100 -6 6]);
grid on;
subplot(426);plot(w/pi,abs(h2));
title('X2 sequence in Frequency Domain');
axis([0 1 0 160]);
grid on;

subplot(427);stem(n,y3);
title('x3 sequence in Time Domain');
axis([0 100 -6 6]);
grid on;
subplot(428);plot(w/pi,abs(h3));
title('X3 sequence in Frequency Domain');
axis([0 1 0 160]);
grid on;
