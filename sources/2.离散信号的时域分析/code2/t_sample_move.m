% generation of a unit sample sequence
clf;
% generate a vector  from -10 to 20
n= -10:20;
% move steps
k=5;
% generate the unit sample sequence
u=[zeros(1,10+k) 1 zeros(1,20-k)];

stem(n,u);
xlabel('time index n');
ylabel('amplitude');
title('unit sample shifted sequence');
axis([-10 20 0 1.2]);