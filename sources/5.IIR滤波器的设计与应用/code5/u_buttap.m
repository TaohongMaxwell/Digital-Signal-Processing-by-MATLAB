%设计非归一化巴特沃兹模拟低通滤波器原型子程序
function [b,a]=u_buttap(N,OmegaC)
[z,p,k]=buttap(N);% z、p和k分别是设计出的 的极点、零点及增益。
p=p*OmegaC; %非归一化
k=k*OmegaC^N;
B=real(poly(z));
b0=k;
b=k*B; % 分子向量
a=real(poly(p)); % 分母向量
