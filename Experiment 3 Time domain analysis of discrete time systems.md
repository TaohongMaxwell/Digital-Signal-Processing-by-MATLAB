# Experiment 3 Time Domain Analysis of Discrete Time Systems

## Experimental purpose

1. A system for understanding discrete time signals and its characteristics.
2. Analyze the simple discrete time system and study its time domain characteristics.
3. Using MATLAB to simulate discrete time systems, observe t he results, and understand their time domain characteristics.

## Experimental principle

Discrete-time systems, mainly systems for processing discrete-time signals, that is, some kind of operation that maps the input signal into an output. The block diagram of the system is shown in the figure:

### (1) Linear system

A linear system is a system that satisfies the principle of superposition. If the input signal is for a discrete system, the output signals are respectively, ie: .

Moreover, when the input signal of the system is , where a and b are arbitrary constants and the output is , then the system is a linear discrete time system.

### (2) Time-invariant system

If the response of the system is independent of the moment when the stimulus is applied to the system, the system is a time-invariant system. For a discrete-time system, if the input produces an output of , then the input is , and the output is , ie:

If , then .



**Usually we study linear time-invariant discrete systems.**

## Experimental content and its steps

**(1) Review the main properties of the discrete time system and grasp its principle and significance.**

A simple reference for a nonlinear discrete-time system:
% Generate a sinusoidal input signal

**(2) Simulation reference for linear and nonlinear systems:**
% Generate the input sequences

**(3) Simulation reference for time-invariant and time-varying systems:**
% Generate the input sequences

## Thinking questions

(1) What are the characteristics of discrete time systems?
(2) Summarize the conclusions obtained during the experiment and analyze them.
(3) Analyze the problems involved in the experiment, try to compile and modify the corresponding procedures, and get the final correct results and waveform diagrams, and analyze and analyze the experimental reports.
(4) Through MATLAB simulation, the discrete time system is studied, and the linear, nonlinear, time-varying, non-time-varying systems are simulated.

## Experimental report requirements:

(1) Defining the purpose of the experiment and the principle of the experiment.
(2) Analyze the properties of discrete time signals through experimental content.
(3) Complete the content of the thinking questions, analyze and contrast the experimental results and their waveforms, and summarize the main conclusions.