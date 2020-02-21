# Experiment 5 Design and Filtering of IIR Filters

## Experimental purpose

1. Deepen the understanding of signal sampling,
2. Master the method of filter design;
3. Review the design of the low-pass filter.

## Experimental principle

At present, the general method for designing IIR digital filters is to design the corresponding low-pass filter, and then obtain the required digital filter through bilinear transformation and frequency transformation. The analog filter is functionally divided into four types: low-pass, high-pass, band-pass, and band-stop. The type is divided into Butterworth filter, Chebyshev I filter, and Chebyshev II. Type filters, elliptical (Elliptic) filters, and Bessel filters.

The typical analog low-pass filter specifications are as follows: passband frequency and stopband frequency, respectively, passband and stopband tolerance (peak ripple value). Required in the passband, sometimes the indicator is given by the maximum attenuation of the passband and the minimum attenuation of the stopband, as defined below:
The second common indicator is to use the parameters and A to indicate the passband and stopband requirements, as shown:

The relationship between the two is: and , according to these parameters can be derived two other parameters d, k, called the discriminating factor and the selectivity factor.

BUTTERWORTH low-pass filter: The amplitude squared function is defined as , N is the filter order and is the cutoff frequency. At the time, there is , 3DB bandwidth.

The BUTTERWORTH low pass filter system function has the following form:

To design the IIR digital filter from the analog filter, the mapping relationship between the s-plane and the z-plane must be established. The system function that transforms the analog system function into a digital filter usually uses the impulse invariant method and the bilinear transformation method. The spectral aliasing phenomenon exists in the impulse invariant method, and the bilinear transformation method eliminates this line image, and has been widely used in the design of the IIR digital filter.

The mapping relationship between the s-plane and the Z-plane is the mapping between the digital frequency to be input and the equivalent analog frequency: Since the two are not linear, they are called predistortion.

## Experimental content and its steps

### Experimental steps:

1. Given the amplitude corresponding parameters of the digital filter.
2. Transform the digital filter parameters into corresponding equivalent analog filter parameters using the predistortion formula.
3. Design an equivalent analog filter using the analog filter design method.
4. The equivalent analog filter is mapped to the desired digital filter using a bilinear transformation formula.

**The analog filter design steps in the third step are:**

- First, the selection factor k and the discriminant factor d are determined according to the filter index.
- Second, determine the filter order N required to meet the technology.
- Again, set the 3db cutoff frequency.
- Finally, the normalized Butterworth filter coefficients are found by the table.

### Design example:

#### Example 1

An analog Butterwater low-pass filter was designed with 1 dB or better fluctuation at 30 rad/s and at least 30 dB attenuation at 50 rad/s. Find the system function in cascaded form, and plot the amplitude response, log amplitude response, phase response and impulse response of the filter.

MATLAB reference program:

[`example_1.m`](./sources/5.IIR滤波器的设计与应用/code5/example_1.m)

```matlab
clc;clf;clear;

Wp=30;Ws=50;Rp=1;As=30;               %技术指标
Ripple=10^(-Rp/20);
Attn=10^(-As/20);
[b,a]=afd_butt(Wp,Ws,Rp,As)           %巴特沃兹低通滤波器子程序
[db,mag,pha,w]=freqs_m(b,a,50);       %计算幅频响应
[ha,x,t]=impulse(b,a);                %计算模拟滤波器的单位脉冲响应

figure(1);clf;
subplot(2,2,1);plot(w,mag);title('Magnitude Response');
xlabel('Analog frequency in rad/s'); ylabel('H');
axis([0,50,0,1.1]);
grid on;
subplot(2,2,2);plot(w,db);title('Magnitude in dB');
xlabel('Analog frequency in rad/s');
ylabel('decibels');
axis([0,50,-40,5])
grid on;
subplot(2,2,3);plot(w,pha/pi);title('Phase Response');
xlabel('Analog frequency in rad/s');
ylabel('radians');
axis([0,50,-1.1,1.1])
grid on;
subplot(2,2,4);plot(t,ha);title('Impulse Response');
xlabel('time in seconds');
ylabel('ha(t)');
axis([0,max(t)+0.05,min(ha),max(ha)+0.025]);
grid on;
```

Butterworth analog filter design subroutine:

[`afd_butt.m`](./sources/5.IIR滤波器的设计与应用/code5/afd_butt.m)

```matlab
Function[b,a]=afd_butt(Wp,Ws,Rp,As);
If Wp<=0
    Error('Passband edge must be larger than 0')
End
If Ws<=Wp
    Error('Stopband edge must be larger than Passed edge')
End
If (Rp<=0)|(As<0)
    Error('PB ripple and /0r SB attenuation must be larger than 0')
End
N=ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(Wp/Ws))));
OmegaC=Wp/((10^(Rp/10)-1)^(1/(2*N))));
[b,a]=u_buttap(N,OmegaC);
```

Design non-normalized Butterworth analog low-pass filter prototype subroutine:

[`u_buttpp.m`](./sources/5.IIR滤波器的设计与应用/code5/u_buttap.m)

```matlab
Function [b,a]=u_buttap(N,OmegaC);
[z,p,k]=buttap(N); z, p, and k are the designed poles, zeros, and gains, respectively.
p=p*OmegaC; % non-normalized
k=k*OmegaC^N;
B=real(poly(z));
B0=k;
b=k*B; molecular vector
a=real(poly(p)); denominator vector
```

Calculate system function amplitude response and phase response subroutine:

[`freqs_m.m`](./sources/5.IIR滤波器的设计与应用/code5/freqs_m.m)

```matlab
Function [db,mag,pha,w]=freqs_m(b,a,wmax);
w=[0:1:500]*wmax/500;
H=freqs(b,a,w);
Mag=abs(H);
Db=20*log10((mag+eps)/max(mag));
Pha=angle(H);
```

#### Example 2

A digital low pass filter designed as follows.

The corresponding MATLAB program is as follows:

[`example_2.m`](./sources/5.IIR滤波器的设计与应用/code5/example_2.m)

```matlab
clc;clf;clear;close all;

fp=100;fst=300;Fs=1000;
rp=3;rs=20;
wp=2*pi*fp/Fs;
ws=2*pi*fst/Fs;
Fs=Fs/Fs;  % let Fs=1   
wap=tan(wp/2);was=tan(ws/2);% 预畸变公式
[n,wn]=buttord(wap,was,rp,rs,'s') ;% 设计等效模拟滤波器
[z,p,k]=buttap(n); 
[bp,ap]=zp2tf(z,p,k)               % 设计模拟低通原型滤波器
[bs,as]=lp2lp(bp,ap,wap)   ;     % 将模拟低通原型滤波器转换为低通滤波器
[bz,az]=bilinear(bs,as,Fs/2)   % 实现双线性变换，即由模拟滤波器 得到数字滤波器
[h,w]=freqz(bz,az,256,Fs*1000);
plot(w,abs(h));grid on;
xlabel('wp=100  ws=300');
title('数字低通滤波器');
```

Debug the program and run the following:

```matlab
Bp=[1,0,0]
ap=[1,1.4142,1]
bs=[0.1056,0,0]
as=[1,0.4595,0.1056]
Bz=[0.0675,0.1349,0.06745]
az=[1,-1.143,0.4128]
```

Prove that this filter works correctly:

[`prove.m`](./sources/5.IIR滤波器的设计与应用/code5/prove.m)

```matlab
%% Given 2 sequence
t=0:.1:100;
w1=.1*pi;
w2=1*pi;
x1=cos(2*pi*w1*t);
x2=cos(2*pi*w2*t);

%% Structure a new sequence by added that two sequences
x=x1+x2;
y=filter(bz,az,x);

% Turn to Time domain
fx1=freqz(x1); fx2=freqz(x2);
fx=freqz(x); fy=freqz(y);

%% Figures part
figure;impz(bz);

figure;
subplot(4,2,1);
plot(t,x1);title('x1');
subplot(4,2,2);
plot(t,x2);title('x2');
subplot(4,2,3);
plot(t,x);title('x1+x2');
subplot(4,2,4);
plot(t,y);title('y');

subplot(4,2,5);
plot(abs(fx1));title('X1');
subplot(4,2,6);
plot(abs(fx2));title('X2');
subplot(4,2,7);
plot(abs(fx));title('X1+X2');
subplot(4,2,8);
plot(abs(fy));title('Y');
```

The [`prove.m`](./sources/5.IIR滤波器的设计与应用/code5/prove.m) program works with later programs to prove if the filter we created goes wrong.

## Introduction to experiment with MATLAB function

During the experiment, the MATLAB function commands have digital filter functions `[N, Wn]=buttord(Wp, Ws, Rp, Rs)`, and analog filter functions `[N, Wn]=buttord(Wp, Ws, Rp, Rs, 's')`.

In the formula, Wp and Ws respectively cut off the cutoff frequency of the passband and the stopband. In fact, they are normalized frequencies, and their values are between 0 and 1. Rp and Rs are the attenuation of the passband and the stopband, respectively. . N is the order of the corresponding low-pass filter found, Wn is the obtained 3dB frequency, and the unit of the second equation is rad/s, so they are actually frequencies.

Used to design an analog low-pass prototype filter whose calling format is `[z,p,k]=buttap(N)`. N is the order of the low-pass prototype filter to be designed, and z, p, and k are designed respectively. The pole, zero and gain.

The following four files are used to convert the analog low-pass prototype filters into low-pass, high-pass, band-pass, and band-stop filters, respectively. The calling format is

- (1) `[B,A]=lp2lp(b,a,Wo)` or `[B,A]=lp2hp(b,a,Wo)`
- (2) `[B,A]=lp2bp(b,a,Wo,Bw)` or `[B,A]=lp2bs(b,a,Wo,Bw)`

Where b, a are the coefficient vectors of the numerator and denominator polynomial of the simulated low-pass prototype filter, respectively, B and A are the coefficient vectors of the transformed numerator and denominator polynomial respectively; in the format (1), Wo is the low pass Or the cutoff frequency of the high pass filter; in the format (2) Wo is the center frequency of the band pass or band stop filter, and Bw is its bandwidth.

A bilinear transformation is achieved, ie a digital filter is obtained from an analog filter. Its calling format is

`[Bz, Az]=bilinear(B,A,Fs)`.

In the formula, B and A are the coefficient vectors of the numerator and denominator polynomial respectively; Bz and Az are the coefficient vectors of the numerator and denominator polynomial respectively, and Fs is the sampling frequency.

## Question to think about:

1. Description IIR filter design steps.
2. Analyze the problems involved in the experiment, try to compile and modify the corresponding procedures, and get the final correct results and waveforms, and analyze and analyze the experimental reports.

3. Design a low-pass digital filter by bilinear method requires an amplitude error of less than 1 dB when the band in the passband is below 0.2 π rad. The stopband attenuation between the frequencies from 0.3 π rad to π rad is greater than 15 dB, T = 1, and the analog filter uses the Butterworth filter prototype.

Example like that:

[`t_3.m`](./sources/5.IIR滤波器的设计与应用/code5/t_3.m)

```matlab
clc;clear;close all;

rp=1;rs=15;
wp=.2*pi; ws=.3*pi;
Fs=1;
wap=tan(wp/2);
was=tan(ws/2);
[n,wn]=buttord(wap,was,rp,rs,'s');
[z,p,k]=buttap(n);
[bp,ap]=zp2tf(z,p,k);
[bs,as]=lp2lp(bp,ap,wap);
[bz,az]=bilinear(bs,as,Fs/2);
[h,w]=freqz(bz,az,256);
plot(w,abs(h));grid on;
xlabel('wp=0.2\pi ws=0.3\pi');
title('低通数字滤波器');

prove;
```

4. Design a Butterworth high pass filter. The passband cutoff frequency is required to be 0.6 π, and the passband attenuation is not more than 1 dB. The stop band start frequency is 0.4 π, and the attenuation in the stop band is not less than 15dB, T=1. (optional)

Example like that:

[`t_4.m`](./sources/5.IIR滤波器的设计与应用/code5/t_4.m)

```matlab
clc;clear;close all;

rp=1;rs=15;
wp=.6*pi; ws=.4*pi;
Fs=1;
wap=tan(wp/2);
was=tan(ws/2);
[n,wn]=buttord(wap,was,rp,rs,'s');
[z,p,k]=buttap(n);
[bp,ap]=zp2tf(z,p,k);
[bs,as]=lp2hp(bp,ap,wap);
[bz,az]=bilinear(bs,as,Fs/2);
[h,w]=freqz(bz,az,256);
plot(w,abs(h));grid on;
xlabel('ws=0.4\pi wp=0.6\pi');
title('巴特沃兹高通滤波器');

prove;
```

## Experimental report requirements

1. Defining the purpose of the experiment and the principle of the experiment.
2. Master the design of the filter through the experimental content.
3. Complete the content of the thinking questions, analyze the experimental results and their waveforms, and summarize the main conclusions.
