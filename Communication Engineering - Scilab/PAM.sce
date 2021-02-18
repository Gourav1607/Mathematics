a=5;
f=1;
t=0:0.01:2;
x1=rand(t/3);
x2=sin(2*pi*f*t);
y=x1.*x2;

subplot(3,1,1);
//stem(x1);
title('impulse signal');
xlabel( 'time index ');
ylabel('amplitude');

subplot(3,1,2);
plot(t,x2);
title( 'sin wave ');

subplot(3,1,3);
//stem(t,y);
title('pam signal');
