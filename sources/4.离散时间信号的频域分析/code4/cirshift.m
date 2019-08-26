function y=cirshift(x,n0,N)

if length(x)>N
    error('N should bigger or equal to the length of x');
end

x=[x,zeros(1,N-length(x))];
n=0:1:N-1;
n=mod(n-n0,N);
y=x(n+1);