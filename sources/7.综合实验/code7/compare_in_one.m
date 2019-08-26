% 滤波前后幅度对比

figure('Name','滤波前后幅度对比');
set(gcf,'outerposition',get(0,'screensize'));

subplot(241);stem(n,x);
title('x sequence in Time Domain');
grid on;
subplot(245);plot(w/pi,abs(h));
title('X sequence in Frequency Domain');
grid on;

subplot(242);stem(n,y1);
title('y1 sequence in Time Domain');
axis([0 100 -6 6]);
grid on;
subplot(246);plot(w/pi,abs(h1));
title('Y1 sequence in Frequency Domain');
axis([0 1 0 160]);
grid on;

subplot(243);stem(n,y2);
title('y2 sequence in Time Domain');
axis([0 100 -6 6]);
grid on;
subplot(247);plot(w/pi,abs(h2));
title('Y2 sequence in Frequency Domain');
axis([0 1 0 160]);
grid on;

subplot(244);stem(n,y3);
title('y3 sequence in Time Domain');
axis([0 100 -6 6]);
grid on;
subplot(248);plot(w/pi,abs(h3));
title('Y3 sequence in Frequency Domain');
axis([0 1 0 160]);
grid on;
