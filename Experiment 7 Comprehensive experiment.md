# Experiment 7 Comprehensive Experiment

## Experimental purpose

Enable students to comprehensively use the theory of signal processing and Matlab tools to analyze and process signals

1. Proficiency in time domain and frequency domain analysis of signals.

2. Skilled in filter design and implementation.

3. Master the filtering and analysis of the signal.

## Experimental principle

Designing and implementing filters to analyze and process signals is the main content of signal processing courses. By performing spectrum analysis on the signal, the frequency characteristics of the signal and the frequency components of the constituent signals can be found. Filtering the signal can improve the quality of the signal, or provide preprocessing for data processing (such as transmission, classification, etc.). This experiment is to analyze and filter the specific signal, and it needs to be integrated before the experimental content, mainly in the following aspects.

### (1) Time domain analysis of discrete time signals and systems

Matlab provides a rich and powerful calculation function and graph analysis function for discrete time signal and system analysis, which is convenient for time domain representation and analysis of discrete time signals and systems.

### (2) Frequency domain analysis of signals

The signal processing course mainly studies the frequency domain analysis method and implementation of discrete signals and systems, as well as the design and implementation of filters. The frequency domain analysis of discrete signals and systems includes DTFT, DFT, Z transform, etc. FFT is a fast implementation of DFT. The spectrum of the signal can be analyzed by Matlab using the freqz function or the FFT function.

### (3) Filter design

The design of the filter first determines the type of filter, ie low pass, high pass, band pass or band stop. The edge frequency of the filter can be obtained by spectral analysis of the signal. The amplitude index of the filter mainly includes the minimum attenuation of the stopband As and the maximum attenuation of the passband Ap. In general, the larger As, the greater the attenuation of the frequency component that passes through; the smaller the Ap, the smaller the attenuation of the frequency component that needs to be retained. Therefore, the larger As, the smaller the Ap, the better the performance of the filter, but the larger the order of the filter, the greater the cost of implementation (including computation time and space). Thus, the design of the filter requires a balanced consideration of filter performance and implementation cost.

In addition, according to the length of the impulse response, it can be divided into two types, IIR and FIR. Both types of filters have their own characteristics. A FIR filter can be used to design a filter with a strict linear phase, but the FIR filter has a higher order than the IIR filter, while satisfying the same specifications. Matlab provides a rich set of functions for the design of various types of filters, which can be used to easily design a filter that meets the requirements.

## Experimental content and steps

A discrete signal x of length 100 is known, consisting mainly of signals of three different frequencies. Please analyze x and design the corresponding filter to get the three signals that make up x.

### Experimental steps:

1. The time domain and frequency domain analysis of the signal is performed to determine the frequency component of the signal x.

2. A filter is designed for each component signal. This includes determining the filter type, filter specifications, and so on.

3. Implement the filter with Matlab.

4. Apply a filter to filter and get the corresponding signal.

5. The filtering results are analyzed, the filter parameters and design methods are adjusted, and the filtering results are optimized.

6. Different filters are used to filter out the signals of the same frequency component, and the results of the filtering and the performance of the different filters are compared. (optional)

## Experimental report requirements

1. Defining the purpose of the experiment and the content of the experiment.

2. The process and results of analyzing the signal are described in detail, and the time domain and frequency domain waveforms of the signal are graphically displayed.

3. Detailed explanations are provided for each step of the filter design.

4. Each of the designed filters is given its order and cutoff frequency, and its time-frequency characteristics are shown graphically.

5. Each frequency component obtained by filtering is given its time domain and frequency domain waveforms in graphical form.

6. The complete source code of the experiment is attached and the code has a detailed explanation.

7. A summary of the experience of this experiment, as well as a summary of the experiments on the signal processing course.

