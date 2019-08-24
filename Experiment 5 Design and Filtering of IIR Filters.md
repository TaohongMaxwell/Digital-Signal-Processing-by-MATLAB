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

```matlab
Wp=30; Ws=50; Rp=1; As=30; %Technical index
Ripple=10^(-Rp/20);
Attn=10^(-As/20);
[b,a]=afd_butt(Wp,Ws,Rp,As) %Butterworth low pass filter subroutine
 [db,mag,pha,w]=freqs_m(b,a,50); % Calculate the amplitude-frequency response
[ha,x,t]=impulse(b,a); % Calculate the unit impulse response of the analog filter
Figure(1);clf;
Subplot(2,2,1);plot(w,mag);title('Magnitude Response');
Xlabel('Analog frequency in rad/s'); ylabel('H');
Axis([0,50,0,1.1]);grid;
Subplot(2,2,2);plot(w,db);title('Magnitude in dB');
Xlabel('Analog frequency in rad/s');
Ylabel('decibels');
Axis([0,50,-40,5])
Grid
Subplot(2,2,3);plot(w,pha/pi);title('Phase Response');
Xlabel('Analog frequency in rad/s');
Ylabel('radians');
Axis([0,50,-1.1,1.1])
Grid
Subplot(2,2,4);plot(t,ha);title('Impulse Response');
Xlabel('time in seconds');
Ylabel('ha(t)');
Axis ([0,max(t)+0.05,min(ha),max(ha)+0.025]);
Grid
```


Butterworth analog filter design subroutine

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
% design non-normalized Butterworth analog low-pass filter prototype subroutine
Function [b,a]=u_buttap(N,OmegaC);
[z,p,k]=buttap(N); z, p, and k are the designed poles, zeros, and gains, respectively.
p=p*OmegaC; % non-normalized
k=k*OmegaC^N;
B=real(poly(z));
B0=k;
b=k*B; molecular vector
a=real(poly(p)); denominator vector
% calculation system function amplitude response and phase response subroutine
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

```matlab
Fp=100; fst=300; Fs=1000;
Rp=3; rs=20;
Wp=2*pi*fp/Fs;
Ws=2*pi*fst/Fs;
Fs=Fs/Fs; % let Fs=1
Wap=tan(wp/2);was=tan(ws/2); predistortion formula
[n,wn]=buttord(wap,was,rp,rs,'s') ; design equivalent analog filter
[z,p,k]=buttap(n);
[bp,ap]=zp2tf(z,p,k) Designing an Analog Low Pass Prototype Filter
[bs,as]=lp2lp(bp,ap,wap) ; Convert analog low-pass prototype filter to low-pass filter
[bz,az]=bilinear(bs,as,Fs/2) implements bilinear transformation, ie digital filter obtained by analog filter
[h,w]=freqz(bz,az,256,Fs*1000);
Plot(w,abs(h));grid on;
Debug the program and run the following:
Bp=[1,0,0], ap=[1,1.4142,1],bs=[0.1056,0,0], as=[1,0.4595,0.1056]
Bz=[0.0675,0.1349,0.06745],az=[1,-1.143,0.4128]
```

## Introduction to experiment with MATLAB function

During the experiment, the MATLAB function commands have digital filter functions `[N, Wn]=buttord(Wp, Ws, Rp, Rs)`, and analog filter functions `[N, Wn]=buttord(Wp, Ws, Rp, Rs, 's')`.

In the formula, Wp and Ws respectively cut off the cutoff frequency of the passband and the stopband. In fact, they are normalized frequencies, and their values are between 0 and 1. Rp and Rs are the attenuation of the passband and the stopband, respectively. . N is the order of the corresponding low-pass filter found, Wn is the obtained 3dB frequency, and the unit of the second equation is rad/s, so they are actually frequencies.

Used to design an analog low-pass prototype filter whose calling format is [z,p,k]=buttap(N) N is the order of the low-pass prototype filter to be designed, and z, p, and k are designed respectively. The pole, zero and gain.

The following four files are used to convert the analog low-pass prototype filters into low-pass, high-pass, band-pass, and band-stop filters, respectively. The calling format is

- (1) `[B,A]=lp2lp(b,a,Wo)` or `[B,A]=lp2hp(b,a,Wo)`
- (2) `[B, A] = lp2bp (b, a, Wo, Bw)` or `[B, A] = lp2bs (b, a, Wo, Bw)`

Where b, a are the coefficient vectors of the numerator and denominator polynomial of the simulated low-pass prototype filter, respectively, B and A are the coefficient vectors of the transformed numerator and denominator polynomial respectively; in the format (1), Wo is the low pass Or the cutoff frequency of the high pass filter; in the format (2) Wo is the center frequency of the band pass or band stop filter, and Bw is its bandwidth.

A bilinear transformation is achieved, ie a digital filter is obtained from an analog filter. Its calling format is

`[Bz, Az]=bilinear(B,A,Fs)`.

In the formula, B and A are the coefficient vectors of the numerator and denominator polynomial respectively; Bz and Az are the coefficient vectors of the numerator and denominator polynomial respectively, and Fs is the sampling frequency.

## Thinking question

1. IIR filter design steps.
2. Analyze the problems involved in the experiment, try to compile and modify the corresponding procedures, and get the final correct results and waveforms, and analyze and analyze the experimental reports.
3. Design a low-pass digital filter that requires an amplitude error of less than 1 dB and a stopband attenuation of more than 15 dB between frequencies when the band in the passband is below. The digital filter is designed with bilinearity, and the analog filter uses a Butterworth filter prototype.
4. Design a Butterworth high-pass filter that requires a passband cutoff frequency of no more than 1dB in the passband, a stopband start frequency of not less than 15dB in the stopband. (optional)

## Experimental report requirements

1. Defining the purpose of the experiment and the principle of the experiment.
2. Master the design of the filter through the experimental content.
3. Complete the content of the thinking questions, analyze the experimental results and their waveforms, and summarize the main conclusions.

