pi = 3.1416;
Vm = 10;
fm = 10;
t = 0:0.01:1;
noise = rand(1,101);

subplot(311)
plot(Vm*(sin(2*pi*fm*t)))

subplot(312)
plot(noise)

subplot(313)
plot(Vm*(sin(2*pi*fm*t)) + noise)
