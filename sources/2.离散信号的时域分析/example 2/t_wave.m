x=('dsp01.wav');
y=audioread(x);
plot(y);
grid on;
sound(y,1600);