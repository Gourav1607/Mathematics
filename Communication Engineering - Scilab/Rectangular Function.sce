 %***rectangular function***
t = -10:0.01:10;
y = heaviside(t+5)- heaviside(t-5);
plot(t,y);
%***impulse function ***
n = -10:10;
delta =(n==0);
subplot(4,1,1);
stem(n,delta,'.');

%***unit step function***
step =(n>=0);
subplot(4,1,2);
stem(n,step,'.');

%***ramp function***
ramp=n.*(n>0);
subplot(4,1,3);
stem(n,ramp,'.');
