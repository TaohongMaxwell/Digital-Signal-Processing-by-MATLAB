x=0 : .1 : 2*pi;
stem(x,sin(x));
grid on;
title('sin in a period');
xlabel('time index x');
ylabel('amplitude');