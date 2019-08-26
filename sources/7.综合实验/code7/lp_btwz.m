rp=1;rs=20;
wp=.45*pi; ws=.6*pi;
Fs=1;

wap=tan(wp/2);
was=tan(ws/2);

[nn,wn]=buttord(wap,was,rp,rs,'s');
[z,p,k]=buttap(nn);
[bp,ap]=zp2tf(z,p,k);
[bs,as]=lp2lp(bp,ap,wap);
[b,a]=bilinear(bs,as,Fs/2);
[h,w]=freqz(b,a,256);

figure('Name','Filter of lp btwz');
plot(w/pi,real(h));