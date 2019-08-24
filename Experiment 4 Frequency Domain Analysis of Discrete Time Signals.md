# Experiment 4 Frequency Domain Analysis of Discrete Time Signals

## Experimental purpose

1. Understand and deepen the concept of Fourier transform and its properties.
2. Calculation and basic properties of discrete time Fourier transform (DTFT).
3. Calculation and basic properties of Discrete Fourier Transform (DFT).

## Experimental principle

Frequency domain analysis of discrete time signals is first performed by Fourier transform and analyzed by the obtained spectrum function.

Discrete-time Fourier Transform (DTFT) is a kind of Fourier transform. It transforms the discrete time nT (where T is the sampling interval) as a function of the variable (discrete time signal) f(nT) into a continuous frequency domain, ie a continuous spectrum of the discrete time signal, the spectrum of which is continuous .

Let the sampling signal of the continuous time signal f(t) be: and its Fourier transform is: .

This is the DTFT:: of the sample sequence f(nT). For convenience, the sampling interval T is usually normalized, and then: This is the discrete-time Fourier transform of the signal f(n). The inverse transformation is:

 Discrete Fourier Transform (DFT) is a Fourier transform of discrete periodic signals. For a signal with a finite length, it is equivalent to transforming its periodic extension. In the frequency domain, the discrete spectrum of the DFT is an equally spaced sampling of the DTFT continuum.

The finite-length signal x(n) of length N, whose N-point discrete Fourier transform is: .

The inverse discrete Fourier transform of X(k) is:

DTFT is a Fourier analysis of arbitrary sequences, its spectrum is a continuous function; while DFT is a period with a finite-length sequence as a periodic sequence, and for Fourier analysis of finite-length sequences, DFT is characterized by The domain or the frequency domain is a finite sequence.

## Experimental content and its steps

**(1) Review the definition and properties of the Fourier transform to deepen understanding.**
**(2) Familiar with the concept of discrete time Fourier transform and its properties.**

**Reference 1:** Calculate the discrete time Fourier transform and draw the graph.

The finite length sequence x(n) = {1, 2, 3, 4, 5} is known.

```matlab
n=-1:3; x=1:5; k=0:500; w=(pi/500)*k; X=x*(exp(-j*2*pi/500)).^(n '*k);
magX=abs(X); angX=angle(X);realX=real(X);imagX=imag(X);
Subplot(2,2,1);plot(w/pi,magX);grid;
Xlabel('');ylabel('modular');title('modular part');
Subplot(2,2,2);plot(w/pi,angX);grid;
Xlabel('pi is the unit'); ylabel('radian'); title('phase angle part');
Subplot(2,2,3);plot(w/pi,realX);grid;
Xlabel('');ylabel('real part');title('real part');
Subplot(2,2,4);plot(w/pi,imagX);grid;
Xlabel('pi is the unit'); ylabel('imaginary part'); title('imaginary part');
```



**Reference 2:** Calculate the discrete time Fourier transform.

```matlab
% Evaluation of the DTFT
Clf;
% Compute the frequency samples of the DTFT
w = -4*pi:8*pi/511:4*pi; num = [2 1];den = [1 -0.6];
h = freqz(num, den, w); % Plot the DTFT
Subplot(2,1,1) plot(w/pi,real(h));grid
Title('Real part of H(e^{j\omega})')
Xlabel('\omega /\pi'); ylabel('Amplitude');
Subplot(2,1,2) plot(w/pi,imag(h));grid
Title('Imaginary part of H(e^{j\omega})')
Xlabel('\omega /\pi'); ylabel('Amplitude');
Pause
Subplot(2,1,1) plot(w/pi,abs(h));grid
Title('Magnitude Spectrum |H(e^{j\omega})|')
Xlabel('\omega /\pi'); ylabel('Amplitude');
Subplot(2,1,2) plot(w/pi,angle(h));grid
Title('Phase Spectrum arg[H(e^{j\omega})]')
Xlabel('\omega /\pi'); ylabel('Phase in radians');
```



**(3) Familiar with the concept of discrete Fourier transform and its properties**

**Reference 1:** x(n)=sin(n*pi/8)+sin(n*pi/4) is a sequence of N=16, and its Fourier transform is calculated.

```matlab
N=16; n=0: N-1; xn=sin(n*pi/8)+sin(n*pi/4); k=0:1:N-1;
WN=exp(-j*2*pi/N); nk=n'*k; WNnk=WN.^nk; Xk=xn*WNnk;
Subplot(2,1,1);stem(n,xn);subplot(2,1,2);stem(k,abs(Xk));
```



 **Reference 2:** Calculate x(n)=8*(0.4).^n, where n is a circular shift of [0,20).

```matlab
N=20; m=10; n=0:1: N-1; x=8*(0.4).^n;
N1=mod((n+m),N);xm=x(n1+1);subplot(2,1,1);stem(n,x);
Title('original sequence');xlabel('n');ylabel('x(n)');
Subplot(2,1,2);stem(n,xm);
Title('circular shift equence');xlabel('n');ylabel('x((n+10))mod 20');
```

## Thinking questions

1. Understand the frequency domain analysis of discrete time systems, master and deepen the understanding of the Fourier transform and its properties.
2. Calculate a discrete time Fourier transform of the sequence x(n)=cos(n*pi/6) of N=12.
3. Find x1(n)=(0.8).^n, where n belongs to [0,10] and x2(n)=(0.6).^n, and n belongs to the circular convolution of [0,18] N=20). First construct a function that computes the circular convolution for calculation.

## Experimental report requirements

1. Defining the purpose of the experiment and the principle of the experiment.

2. Analyze the properties of discrete time signals through experimental content.

3. Complete the content of the thinking questions, analyze and contrast the experimental results and their waveforms, and summarize the main conclusions.