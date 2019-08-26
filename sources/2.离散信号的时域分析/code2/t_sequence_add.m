n1=1:5; x10=[1 0.7 0.4 0.1 0];
n2=3:8; x20=[0.1 0.3 0.5 0.7 0.9 1];

n=1:8;
x1=[x10 zeros(1,8-length(n1) )]; % left add 3 zeros
x2=[zeros(1,8-length(n2) ) x20]; % right add 2 zeros
x=x1+x2;

subplot(3,1,1);stem(n,x1);title('x1 sequence');
subplot(3,1,2);stem(n,x2);title('x2 sequence');
subplot(3,1,3);stem(n,x);title('x1+x2 sequence');