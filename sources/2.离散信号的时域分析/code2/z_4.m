n1=-3:3;x=[-4 5 1 -2 -3 0 2];
n2=-1:5;y=[6 -3 -1 0 8 7 -2];

subplot(4,1,1);stem(n1,x);title('x sequence');
subplot(4,1,2);stem(n2,y);title('y sequence');

% x[n-1]
x1=x;n3=-2:4;

% y[-n]
for i=1:length(y)
y1(i)=y(length(y)-i+1);
end
n4=-5:1;

subplot(4,1,3);stem(n3,x1);title('x[n-1] sequence');
subplot(4,1,4);stem(n4,y1);title('y[-n] sequence');

z=dot(x1,y1)