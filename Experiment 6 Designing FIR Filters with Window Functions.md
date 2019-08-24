## Experiment 6 Designing FIR Filters with Window Functions

## Experimental purpose

1. Familiar with the methods and principles of FIR filter design.
2. Master the method and principle of designing FIR filter by window function method, and be familiar with the characteristics of filter.
3. Understand the effects of various window function filter characteristics.

## Experimental principle

There are three main methods for designing FIR filters: window function method, frequency sampling method, and Chebyshev. The FIR filter is designed to seek a system function that approximates its frequency response to the ideal frequency response required by the filter, which corresponds to the unit impulse response.

### Basic method of designing FIR filter by window function

In the time domain, a window function is used to intercept the ideal one, and the finite length sequence is approximated to approximate the ideal; in the frequency domain, the ideal one is sampled at the equi-angle of the unit circle to obtain h(k), and h(k) is used to obtain H(z). Will approximate the ideal Hd(z).

Let the ideal impulse's unit impulse response be . Take the low-pass linear phase FIR digital filter as an example.

Generally infinitely long, non-causal, cannot be directly used as the unit impulse response of the FIR filter. To get a causal finite-length filter h(n), the most straightforward method is truncation, that is, truncation into a finite-length causal sequence, and weighting with a suitable window function as the unit impulse response of the FIR filter. According to the requirements of the linear phase filter, h(n) must be even symmetric. The center of symmetry must be equal to the delay constant of the filter, ie
                                                   
The FIR low-pass filter designed with a rectangular window, the amplitude function of the designed filter exhibits oscillation in both the passband and the stopband, and the maximum ripple is about 9% of the amplitude (the phenomenon is called Gibbs). effect).

### Typical window function

#### (a) Rectangle Window

Its frequency response and amplitude response are:

Call w=boxcar(N) function in matlab, where N is the length of the window function

#### (b) Bartlett Window

Its frequency response is:

Call w=triang(N) function in matlab, where N is the length of the window function

#### (c) Hanning window,

also known as the raised cosine window

Its frequency response and amplitude response are:

Call w=hanning(N) function in matlab, where N is the length of the window function

#### (d) Hamming window,

also known as the improved raised cosine window

The magnitude response is:

Call w=hamming(N) function in matlab, where N is the length of the window function

#### (e) Blankman window,

also known as second-order raised cosine window

The magnitude response is:

Call w=blackman(N) function in matlab, where N is the length of the window function

#### (f) Kaiser window

Where: β is an optional parameter used to select the exchange relationship between the main lobe width and the side lobe attenuation. In general, the larger β, the wider the transition band, and the smaller the stop band, the greater the attenuation. I0(·) is the first type of modified zero-order Bessel function.

Call w=kaiser(N,beta) in matlab, function N is the length of the window function, and beta is the parameter of the window function.

### The specific steps of designing the FIR filter using the window function are as follows:

1. According to the specific performance requirements, select the appropriate window function by analyzing the parameters such as the transition band width Δω and the stopband attenuation AS, and estimate the length N of the filter.
2. Find the ideal unit impulse response from the amplitude-frequency response parameters of the given filter.
3. Determine the delay value and calculate the unit sampling response of the filter.
4. Verify that the technical indicators meet the requirements. Analyze the amplitude-frequency characteristics of the designed filter.

## Experimental content and its steps

1. Before the experiment, carefully review the relevant knowledge about the FIR filter design, especially the window function, familiar with the window function and the characteristics of the FIR filter, and master the specific steps of the window function design filter.

2. Program the window function to design the main program of the FIR filter and the corresponding subroutine. Draw the amplitude and phase curves, observe the transformation of the amplitude and phase characteristic curves, and pay attention to the effect of the length N on the curve.

3. Design the filter using the window function method and meet certain performance indicators.

### Example 1:

Use fir1 to design a standard frequency response FIR filter, including low pass, band pass, high pass, band stop and other types of filters.

`b=fir1(n, Wn, ‘ftype’)`

The passband boundary frequency, the stopband boundary frequency, the stopband attenuation is not less than 40dB, and the passband ripple is not more than 3dB.

**Reference:** 

According to the requirements of the filter, the stopband attenuation is not less than 40 dB, and the Hanning window is selected.

%FIR filter based on window function

```matlab
Wp=0.5*pi; ws=0.66*pi; % performance index
Wdelta=ws-wp; % transition band width
N=ceil(3.11*pi/wdelta) % filter length
Nw=2*N+1; % window length
Wc=(ws+wp)/2; % cutoff frequency
Win=hanning(Nw); %Han window's time domain response
b=fir1(Nw -1, wc/pi, win)
%fir1 is a windowed linear phase FIR digital filter design function. N-1 is the order of the filter. Win is a window function, which is a column vector of length N. By default, the function automatically takes hamming.
Freqz(b,1,512)
% is the frequency response. The numerator is b and the denominator is 1
```

The experimental results are shown in the figure:

### Example 2:

Fir2 design digital filter with arbitrary response

The amplitude frequency response of the filter has different amplitude values in different frequency bands.

Fir2 function usage: `b=fir2(n,f,m,npt,lap,window)`

n is the order of the designed filter; f is a positive vector of 0 to 1, corresponding to the frequency of the filter, where 0 corresponds to frequency 0, 1 corresponds to half of the signal sampling frequency; m is a positive real number of all elements Vector, corresponding to the amplitude of the frequency point in the m vector; window is the window function, fir2 defaults to the Hamming window; npt defaults to 512; lap defaults to 25; b is the length of the designed filter coefficients Vector of n+1.

It is required to design a multi-band filter: its amplitude response is 0 at 0 to pi/8, 1/2 at pi/8 to 2pi/8, and 1/4 at 2pi/8 to 4pi/8. The amplitude response is 1/6 at 4pi/8 to 6pi/8, 1/8 at 6pi/8 to pi, and the order of the filter is 60. Draw the ideal filter and compare the amplitude and frequency response of the designed filter.

**reference:**

% multi-band filter design

```matlab
f=[0 0.125 0.125 0.250 0.250 0.500 0.500 0.750 0.750 1.00];
m=[1 1 0.5 0.5 0.25 0.25 1/6 1/6 0.125 0.125];
b=fir2(60,f,m);
[h,w]=freqz(b);
Plot(f,m,w/pi,abs(h))
Grid on;
Legend('‘Ideal Filter', 'Design Filter');
```
## Filter Design & Analysis Tools

In addition, there is a more intuitive way to design filters, using Filter Design & Analysis Tools in MATLAB to design filters is more intuitive.

The Fliter Type selects a low pass, high pass, band pass or band stop filter.

The Design Method selects the IIR or the FIR filter. The drop-down menu selects the type, and the window type is used in the program.

Fliter Order selects the order of the filter.

Windows Specifications is the selection window function type.

Then set the sampling frequency and cutoff frequency, then click Design Fliter to complete the design.

## Thinking question

1. How the window length and shape affect the filter performance during the experiment.

2. Using a window function method to design a linear phase FIR low-pass filter, the performance indicators are: passband cutoff frequency is 0.2pi, band stop cutoff frequency is 0.3pi, stopband attenuation is not less than 40dB, passband attenuation is not more than 3dB . Write a program implementation and draw graphics.

3. Design a band-stop filter with a band resistance of 0.4 to 0.65 and an order of 34, and use a Chebyshev window and compare it with the default window function.

## Experimental report requirements

1. Defining the purpose of the experiment and the principle of the experiment.
2. Learn more about the filter design method through the experimental content.
3. Complete the content of the thinking questions, analyze and contrast the experimental results and their waveforms, and summarize the main conclusions.
