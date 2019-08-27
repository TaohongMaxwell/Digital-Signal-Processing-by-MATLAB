# Experiment 6 Designing FIR Filters with Window Functions

## Experimental purpose

1. Familiar with the methods and principles of FIR filter design.

2. Master the method and principle of designing FIR filter by window function method, and be familiar with the characteristics of filter.

3. Understand the effects of various window function filter characteristics.

## Experimental principle

The FIR filter is designed to find a system function $H(z)$ whose frequency response $H(e^{jw})$ approximates the ideal frequency response required by the filter, and its corresponding unit impulse response $h_d(n)$.

### (1)Basic method of designing FIR filter by window function

In the time domain, a window function is used to intercept the ideal $h_d(n)$ to obtain $h(n)$, and the finite-length sequence $h(n)$ approximates the ideal $h_d(n)$. In the frequency domain, the ideal $H_d(e^{jw})$ is sampled at the same angle on the unit circle to obtain $h(k)$. According to $h(k)$, $H(z)$ will approximate the ideal $H_d(z)$.

Let the ideal impulse's unit impulse response $H_d(e^{jw})$ be $h_d(n)$. Take the low-pass linear phase FIR digital filter as an example.
$$
H_{d}\left(e^{j \omega}\right)=\sum_{n=-\infty}^{\infty} h_{d}(n) e^{-j n \omega}
$$
$$
h_{d}(n)=\frac{1}{2 \pi} \int_{-\pi}^{\pi} H_{d}\left(e^{j \omega}\right) e^{j n \omega} d \omega
$$
In general $h_d(n)$ is infinitely long, non-causal and cannot be directly used as the unit impulse response of the FIR filter. To get a causal finite-length filter $h(n)$, the most straightforward method is to truncate $h(n) = h_d(n) w(n)$. That is, intercept the finite-length causal sequence and weight it with the appropriate window function. As the unit impulse response of the FIR filter, the center of symmetry must be equal to the delay constant of the filter, ie:
$$
\left\{\begin{array}{l}{h(n)=h_{d}(n) w(n)} \\ {a=(N-1) / 2}\end{array}\right.
$$
The FIR low-pass filter designed with a rectangular window, the amplitude function of the designed filter exhibits oscillation in both the passband and the stopband, and the maximum ripple is about 9% of the amplitude (the phenomenon is called Gibbs effect).

### (2)Typical window function

#### (a) Rectangle Window

$w(n) = R_n(n)$

Its frequency response and amplitude response are:

$$
W\left(e^{j \omega}\right)=\frac{\sin (N \omega / 2)}{\sin (\omega / 2)} e^{-j \omega \frac{N-1}{2}}
$$
and
$$
W_{R}(\omega)=\frac{\sin (N \omega / 2)}{\sin (\omega / 2)}
$$

That's `w=boxcar(N)` function in MATLAB, where N is the length of the window function.

#### (b) Bartlett Window

$w(n)=\left\{\begin{array}{cc}{\frac{2 n}{N-1},} & {0 \leq n \leq \frac{N-1}{2}} \\ {2-\frac{2 n}{N-1},} & {\frac{N-1}{2}<n \leq N-1}\end{array}\right.$

Its frequency response is:

$$
W\left(e^{j \omega}\right)=\frac{2}{N}\left[\frac{\sin (N \omega / 4)}{\sin (\omega / 2)}\right]^{2} e^{-j \omega \frac{N-1}{2}}
$$

That's `w=triang(N)` function in MATLAB, where N is the length of the window function.

#### (c) Hanning window

Also known as the raised cosine window.

$w(n)=\frac{1}{2}\left[1-\cos \left(\frac{2 n \pi}{N-1}\right)\right] R_{N}(n)$

Its frequency response and amplitude response are:

$$
\begin{aligned} W\left(e^{j \omega}\right) &=\left\{0.5 W_{R}(\omega)+0.25\left[W_{R}\left(\omega-\frac{2 \pi}{N-1}\right)+W_{R}\left(\omega+\frac{2 \pi}{N-1}\right)\right]\right\} e^{-j\left(\frac{N-1}{2}\right) \omega}=W(\omega) e^{-j \omega a} \end{aligned}
$$
and
$$
W(\omega)=0.5 W_{R}(\omega)+0.25\left[W_{R}\left(\omega-\frac{2 \pi}{N-1}\right)+W_{R}\left(\omega+\frac{2 \pi}{N-1}\right)\right]
$$

That's `w=hanning(N)` function in MATLAB, where N is the length of the window function.

#### (d) Hamming window

Also known as the improved raised cosine window.

$w(n)=\left[ 0.54 - 0.46 \cos \left(\frac{2 n \pi}{N-1}\right)\right] R_{N}(n)$

The magnitude response is:
$$
W(\omega)=0.54 W_{R}(\omega)+0.23\left[W_{R}\left(\omega-\frac{2 \pi}{N-1}\right)+W_{R}\left(\omega+\frac{2 \pi}{N-1}\right)\right]
$$
That's `w=hamming(N)` function in MATLAB, where N is the length of the window function.

#### (e) Blankman window

Also known as second-order raised cosine window.

$w(n)=\left[ 0.42 - 0.5 \cos \left(\frac{2 n \pi}{N-1}\right) + 0.08\cos \left(\frac{4 n \pi}{N-1}\right) \right] R_{N}(n)$

The magnitude response is:
$$
\begin{aligned} W(\omega)=& 0.42 W_{R}(\omega)+0.25\left[W_{R}\left(\omega-\frac{2 \pi}{N-1}\right)+W_{R}\left(\omega+\frac{2 \pi}{N-1}\right)\right]+0.04\left[W_{R}\left(\omega-\frac{4 \pi}{N-1}\right)+W_{R}\left(\omega+\frac{4 \pi}{N-1}\right)\right] \end{aligned}
$$
That's `w=blackman(N)` function in MATLAB, where N is the length of the window function.

#### (f) Kaiser window

$w(n)=\frac{I_{0}(\beta \sqrt{1-[1-2 n /(N-1)]^{2}})}{I_{0}(\beta)}, 0 \leq n \leq N-1$

Where: β is an optional parameter used to select the exchange relationship between the main lobe width and the side lobe attenuation. In general, the larger β, the wider the transition band, and the smaller the stop band, the greater the attenuation. $I_0(·)$ is the first type of modified zero-order Bessel function.

That's `w=kaiser(N,beta)` in MATLAB, function N is the length of the window function, and beta is the parameter of the window function.

### (3)The specific steps of designing the FIR filter using the window function are as follows:

1. According to the specific performance requirements, select the appropriate window function by analyzing the parameters such as the transition band width Δω and the stopband attenuation A~S~, and estimate the length N of the filter.
2. The ideal unit impulse response $h_d(n)$ is found from the amplitude-frequency response parameter of a given filter.
3. Determine the delay value and calculate the unit sampling response $h(n)$ of the filter, $h(n)=h_d(n)w(n)$.
4. Verify that the technical indicators meet the requirements. Analyze the amplitude-frequency characteristics of the designed filter.

## Experimental content and its steps

1. Before the experiment, carefully review the relevant knowledge about the FIR filter design, especially the window function, familiar with the window function and the characteristics of the FIR filter, and master the specific steps of the window function design filter.

2. Program the window function to design the main program of the FIR filter and the corresponding subroutine. Draw the amplitude and phase curves, observe the transformation of the amplitude and phase characteristic curves, and pay attention to the effect of the length N on the curve.

3. Design the filter using the window function method and meet certain performance indicators.

### Example 1:

Use `fir1` to design a standard frequency response FIR filter, including low pass, band pass, high pass, band stop and other types of filters.

`b=fir1(n, Wn, ‘ftype’)`

The passband boundary frequency $\omega_p=0.5\pi$, the stopband boundary frequency$\omega_s=0.66\pi$, the stopband attenuation is not less than 40dB, and the passband ripple is not more than 3dB.

**Reference:** 

According to the requirements of the filter, the stopband attenuation is not less than 40 dB, and the Hanning window is selected.

FIR filter based on window function:

[`example_1.m`](./sources/6.用窗函数设计FIR滤波器及其应用/code6/example_1.m)

```matlab
clc;clear;close all;

Wp=0.5*pi; ws=0.66*pi; % performance index
Wdelta=ws-wp; % transition band width
N=ceil(3.11*pi/wdelta) % filter length
Nw=2*N+1; % window length
Wc=(ws+wp)/2; % cutoff frequency
Win=hanning(Nw); %Han window's time domain response

b=fir1(Nw -1, wc/pi, win)
%fir1 is a windowed linear phase FIR digital filter design function.
% N-1 is the order of the filter.
% Win is a window function, which is a column vector of length N.
% By default, the function automatically takes hamming.

Freqz(b,1,512)
% is the frequency response.
% The numerator is b and the denominator is 1
```

We also can write a program to prove if this filter work correctly,  see

[`prove_1.m`](./sources/6.用窗函数设计FIR滤波器及其应用/code6/prove_1.m)

The experimental results are shown in the figure:

`(Need to be done)`

### Example 2:

Use `fir2` to design digital filter with arbitrary response. The amplitude frequency response of the filter has different amplitude values in different frequency bands.

The `fir2` function usage:

`b=fir2(n,f,m,npt,lap,window)`

n is the order of the designed filter; f is a positive vector of 0 to 1, corresponding to the frequency of the filter, where 0 corresponds to frequency 0, 1 corresponds to half of the signal sampling frequency; m is a positive real number of all elements Vector, corresponding to the amplitude of the frequency point in the m vector; window is the window function, fir2 defaults to the Hamming window; npt defaults to 512; lap defaults to 25; b is the length of the designed filter coefficients Vector of n+1.

It is required to design a multi-band filter: its amplitude response is 0 at 0 to $\frac \pi 8$,  1/2 at $\frac {\pi} 8$ to $\frac {2\pi} 8$, and 1/4 at $\frac {2\pi} 8$ to $\frac {4\pi} 8$. The amplitude response is 1/6 at $\frac {4\pi} 8$ to $\frac {6\pi} 8$, 1/8 at $\frac {6\pi} 8$ to $\pi$, and the order of the filter is 60. Draw the ideal filter and compare the amplitude and frequency response of the designed filter.

**reference:**

Multi-band filter design:

[`example_2.m`](./sources/6.用窗函数设计FIR滤波器及其应用/code6/example_2.m)

```matlab
f=[0 0.125 0.125 0.250 0.250 0.500 0.500 0.750 0.750 1.00];
m=[1 1 0.5 0.5 0.25 0.25 1/6 1/6 0.125 0.125];
b=fir2(60,f,m);
[h,w]=freqz(b);
Plot(f,m,w/pi,abs(h))
Grid on;
Legend('‘Ideal Filter', 'Design Filter');
```

We also can write a programme to prove if this filter work correctly,  see

[`prove_2.m`](./sources/6.用窗函数设计FIR滤波器及其应用/code6/prove_2.m)

## Filter Design & Analysis Tools

In addition, there is a more intuitive way to design filters, using `Filter Design & Analysis Tools` in MATLAB to design filters is more intuitive.

The Fliter Type selects a `low pass`, `high pass`, `band pass` or `band stop` filter.

The Design Method selects the `IIR` or the `FIR` filter. The drop-down menu selects the type, and the `window` type is used in the program.

`Fliter Order` selects the order of the filter.

`Windows Specifications` is the selection window function type.

Then set the sampling frequency and cutoff frequency, then click `Design Fliter` to complete the design.

## Thinking question

1. How the window length and shape affect the filter performance during the experiment.

When the FIR filter is designed by window method, the length of the window affects the transition bandwidth of the filter: The longer the length of the window, the narrower and steeper the transition band of the filter.

2. Using a window function method to design a linear phase FIR low-pass filter, the performance indicators are: passband cutoff frequency is 0.2π, band stop cutoff frequency is 0.3π, stopband attenuation is not less than 40dB, passband attenuation is not more than 3dB . Write a program implementation and draw graphics.

[`t_2.m`](./sources/6.用窗函数设计FIR滤波器及其应用/code6/t_2.m)

```matlab
clc;clear;close all;

wp=0.2*pi;ws=0.3*pi;    %性能指标
wdelta=ws-wp;           %过渡带宽度
N=ceil(3.11*pi/wdelta)  %滤波器长度
Nw=2*N+1;               %窗口长度
wc=(ws+wp)/2;           %截止频率
win=hanning(Nw);        %汉宁窗的时域响应

b=fir1(Nw-1,wc/pi,win)
% fir1是基于加窗的线性相位FIR数字滤波器设计函数。
% N-1为滤波器的阶数。
% Win为窗函数，是长度为N的列向量，默认是函数自动取hamming。

freqz(b,1,512)          %为求取频率响应。分子为b，分母为1
[h,w]=freqz(b,1,512);
figure('Name','Filter of t_2');plot(w,abs(h));

prove_t_2;
```

3. Design a band-stop filter with a band resistance of 0.4 to 0.65 and an order of 34, and use a Chebyshev window and compare it with the default window function.

[`t_3.m`](./sources/6.用窗函数设计FIR滤波器及其应用/code6/t_3.m)

```matlab
clc;clear;close all;

w1=0.4; w2=0.65;
alpha=40; N=34;
win=chebwin(N+1,alpha);
b=fir1(N,[w1,w2],'stop',win);
freqz(b,1,512)
[h,w]=freqz(b,1,512);
figure('Name','Filter of t_3');plot(w,abs(h));

prove_t_3;
```

## Experimental report requirements

1. Defining the purpose of the experiment and the principle of the experiment.
2. Learn more about the filter design method through the experimental content.
3. Complete the content of the thinking questions, analyze and contrast the experimental results and their waveforms, and summarize the main conclusions.
