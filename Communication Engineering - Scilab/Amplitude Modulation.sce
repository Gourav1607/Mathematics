Am=5;
Ac=10;
m=Am/Ac;

fc=50;
fm=10;
t=0:0.001:.5;

Sm=Am*cos(2*%pi*fm*t);
subplot(2,2,1);
plot(t,Sm);

Sc=Ac*cos(2*%pi*fc*t);
subplot(2,2,2);
plot(t,Sc);

Sam=(1+(m*cos(2*%pi*fm*t)));
Sam1=Ac*Sam;
Sam2=cos(2*%pi*fc*t).*Sam1;
subplot(2,2,3);
plot(t,Sam2);
