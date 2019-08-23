%计算系统函数的幅度响应和相位响应子程序
function [db,mag,pha,w]=freqs_m(b,a,wmax)
w=[0:1:500]*wmax/500;
H=freqs(b,a,w);
mag=abs(H);
db=20*log10((mag+eps)/max(mag));
pha=angle(H);
