%巴特沃兹模拟滤波器的设计子程序
function[b,a]=afd_butt(Wp,Ws,Rp,As)
if Wp<=0
    error('Passband edge must be larger than 0')
end
if Ws<=Wp
    error('Stopband edge must be larger than Passed edge')
end
if (Rp<=0)||(As<0)
    error('PB ripple and /0r SB attenuation must be larger than 0')
end 
N=ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(Wp/Ws)));
OmegaC=Wp/((10^(Rp/10)-1)^(1/(2*N)));
[b,a]=u_buttap(N,OmegaC);
