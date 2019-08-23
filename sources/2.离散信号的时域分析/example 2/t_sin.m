n=0:40; f=0.1; phase=0; A=1.5;
arg=2*pi*f*n-phase;
x=A*cos(arg);

clf;% clear old graph
stem(n,x);% plot the generated sequence
axis([0 40 -2 2]);
grid on;

title('sin sequence');
xlabel('time index n');
ylabel('Amplitude');
axis;