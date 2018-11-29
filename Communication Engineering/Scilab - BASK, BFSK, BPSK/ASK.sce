fc=100;
fp=10;
A=5;
t=0:0.001:1;

c=A.*sin(2*%pi*fc*t);
subplot(3,1,1);
plot(t,c);

m=A/2.*square(2*%pi*fp*t)+A/2;
subplot(3,1,2);
plot(t,m);

w=c.*m;
subplot(3,1,3);
plot(t,w);

title('ASK');
