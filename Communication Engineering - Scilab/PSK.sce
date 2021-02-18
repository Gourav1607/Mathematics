clear all;
close all;
A=5;
t=0:0.001:1;
f1=10;
f2=2;
x=A.*sin(2*pi*f1*t);
subplot(3,1,1);
plot(t,x);
title('carrier signal')
xlabel('time');
ylabel('amplitude');
u=square(2*pi*f2*t);
subplot(3,1,2);
plot(t,u);
title('modulating signal')
xlabel('time');
ylabel('amplitude');
v=x.*u;
subplot(3,1,3);
plot(t,v);
xlabel('time');
ylabel('amplitude');
title('psk');
