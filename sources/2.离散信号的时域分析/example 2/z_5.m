n1=1:5; x1=[1 0.7 0.4 0.1 0];
n2=3:8; x2=[0.1 0.3 0.5 0.7 0.9 1];

subplot(4,1,1);stem(n1,x1);title('x1 sequence');
subplot(4,1,2);stem(n2,x2);title('x2 sequence');

c=4:13;x3=conv(x1,x2);
subplot(4,1,3);stem(c,x3);title('function conv result');

x4=myconv(x1,x2);
subplot(4,1,4);stem(c,x4);title('function myconv result');