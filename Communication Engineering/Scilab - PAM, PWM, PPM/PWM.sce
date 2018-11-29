t=0:0.001:1;
s=sawtooth(2*pi*10*t+pi);
m=0.75*sin(2*pi*1*t);
n=length(s);
for i=1:n
    if(m(i)>=s(i))
        PWM(i)=1;
    else if(m(i)<=s(i))
            PWM(i)=0;
        end
    end
end
    plot(t,PWM,'-g',t,m,'--r',t,s,'--b');
    ylabel('amplitude');
    xlabel('time index');
    title('PWMWave');
    axis([0 1 -1.5 1.5]);
