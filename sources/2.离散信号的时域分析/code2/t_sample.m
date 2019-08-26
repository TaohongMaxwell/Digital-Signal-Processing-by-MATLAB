% generation of a unit sample sequence
clf;
% generate a vector  from -10 to 20
n= -10:20;
% generate the unit sample sequence
u=[zeros(1,10) 1 zeros(1,20)];

stem(n,u);
xlabel('time index n');
ylabel('amplitude');
title('unit sample sequence');
axis([-10 20 0 1.2]);