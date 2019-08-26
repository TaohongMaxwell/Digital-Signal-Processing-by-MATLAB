% generation of a unit sample sequence
clf;
% generate a vector  from -10 to 20
n= -10:20;
% generate the unit sample sequence
u=[zeros(1,10) ones(1,21)];

stem(n,u);
xlabel('time index n');
ylabel('amplitude');
title('unit step sequence');
axis([-10 20 0 1.2]);