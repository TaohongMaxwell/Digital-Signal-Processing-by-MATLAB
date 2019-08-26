function y=mycirconv(x1,x2,N)
L1=length(x1);
L2=length(x2);

if( (N<L1) || (N<L2) )
    error('Length of convolution is too short');
end

x1=[x1,zeros(1,N-L1)];
x2=[x2,zeros(1,N-L2)];
sh=[x2(1),x2(N:-1:2)];

for k=1:N
    y(k)=x1*sh';
    sh=[sh(N),sh(1:N-1)];
end
