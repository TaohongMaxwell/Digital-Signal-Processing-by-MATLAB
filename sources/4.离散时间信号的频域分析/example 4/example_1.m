% DTFT
% 参考一：计算离散时间傅里叶变换，并绘制图形
% 已知有限长序列x(n)={1,2,3,4,5}
clf;clear;
n=-1:3; x=1:5; k=0:500;
w=(pi/500)*k; X=x*(exp(-j*2*pi/500)).^(n'*k);

magX=abs(X);angX=angle(X);
realX=real(X);imagX=imag(X);

subplot(2,2,1);plot(w/pi,magX);grid on;
xlabel('');ylabel('模值 ');title('模值部分');

subplot(2,2,2);plot(w/pi,angX);grid on;
xlabel('pi为单位');ylabel('弧度');title('相角部分');

subplot(2,2,3);plot(w/pi,realX);grid on;
xlabel('');ylabel('实部');title('实部部分');

subplot(2,2,4);plot(w/pi,imagX);grid on;
xlabel('pi为单位');ylabel('虚部');title('虚部部分');
