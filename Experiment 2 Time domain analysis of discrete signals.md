# Experiment 2 Time Domain Analysis of Discrete Signals

## Experimental purpose:

1.  Learn MATLAB software and its application in signal processing to deepen the understanding of commonly used discrete-time signals.
2.  Use MATLAB to generate common discrete time signals and their graphics display, and perform simple operations.
3.  Familiar with MATLAB's processing of discrete signals and its applications.

## Experimental principle

A discrete time signal is a signal whose time is a discrete variable. Its function value is a discontinuous "sequence" in time.

### 1. Unit sampling sequence

If the sequence has a delay of K units above the time axis, then you can get that, and the sequence can be implemented with the zeros function in MATLAB.

### 2. Sinusoidal sequence

Can be generated using the sin function.

### 3. Index sequence

It is implemented in MATLAB by : and .

## Experimental content and its steps

**(1) Review relevant content about discrete time signals.**

**(2) The generation of the above-mentioned signals is realized by the program, and a simple arithmetic operation is performed.**

##### Unit sampling sequence

reference:

If the sequence has a delay of K units above the timeline, you can get it, ie:
Through the program to achieve the results shown below.

##### Sinusoidal sequence

reference:

##### Index sequence

reference:

**(3) Deepen the understanding of discrete-time signals and their characteristics, and perform basic operations (such as signal addition, multiplication, delay, etc.) on discrete signals, and draw their graphs.**

reference:

**(4) Simple processing of a speech signal is realized through practical operation and application.**

For a speech signal, a few seconds are intercepted and saved in the form of ".wav", and the voice signal is read, waveform display, and the like.

Reference: For a section of the `"C:\MATLAB6p5\work\speech\"` voice signal `"f3.wav"`, proceed:

```matlab
x=('C:\MATLAB6p5\work\speech\f3.wav');
y=wavread(x);plot(y);
sound(y,16000)
```

## Experimental content:

1. Generate a unit step signal (using the ones function)
2. Generate an exponential sequence `x(n)`.
3. Generate a periodic sine function.
4. Given that:
`x[n]={-4 5 1 -2 -3 0 2}`, -4<n<4;
`y[n]={6 -3 -1 0 8 7 -2}`, -2<n<6;
Programming calculates the inner product of `x[n-1]` and `y[-n]`
5. Find `y[n]=a[n]*b[n]` to program the convolution of the two causal discrete signals.

