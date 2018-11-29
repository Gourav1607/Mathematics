clear all;
close all;
fc=1000;
fs=10000;
f1=200;
t=0:1/fs:(((2/f1)-(1/fs)));
x1=0.4*cos(2*pi*f1*t)+0.5;
y1=modulate(x1,fc,fs,'ppm');
subplot(2,2,1);
plot(x1);
title('message signal');
subplot(2,2,2);
plot(y1);
axis([0 200 -0.2 1.2]);
title('ppm');
x_rec=demod(y1,fc,fs,'ppm');
subplot(2,2,3);
plot(x_rec);
