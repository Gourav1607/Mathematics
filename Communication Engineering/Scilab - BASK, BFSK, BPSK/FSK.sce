I = [0 1 1 0 1 0 0 1];
f = input('Enter frequency of carrier: ');
t=0:1/512:1;
pi = 3.1416;
x= sin(2*pi*f*t);
Xfsk= [];
x1 = sin(2*pi*f*t);
x2 = sin(2*pi*2*f*t);

for n=1:length(I)
    if(I(n) == 1)
        Xfsk=[Xfsk,x2];
    elseif(I(n)~=1)
        Xfsk=[Xfsk, x1];
    end
end
subplot(3,1,1);
plot(t, x);
subplot(3,1,2);
plot(Xfsk);
