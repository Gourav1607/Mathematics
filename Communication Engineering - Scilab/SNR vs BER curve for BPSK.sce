clc;
clear all;
bit_count=100000; // Number of random bits to be generated
SNR= 0:1:10; //Range S/N over which is simulate.
for k=1:1:length(SNR)
    tote=0; //total error bits
    totb=0; //total bits
    while tote<100 //untill you get 100 error
        rbits=round(rand(1,bit_count)); //generate random bits
        tx=-2*(rbits-0.5); //bpsk modulation directly to bipolar NRZ
        No=(1/10)^(SNR(k)/10); //Noise level
        rx=tx+sqrt(No/2)*(rand(1,length(tx))+ i*rand(1,length(tx)));
        rx2=rx<0 ; // BPSK demodulator logic at ry
        diff=rbits-rx2 ; // Caclulate bit error
        tote=tote+sum(abs(diff)); //total error
        totb=totb+length(rbits); //total bits generated
    end
    ber(k)=tote/totb; //bit error rate
end
//semilogy(SNR,ber,'*r');
xlabel('S/N(db)');
ylabel('ber');
title('S/N vs ber plot for BPSK');
thber=0.5*erfc(sqrt(10.^(SNR/10))); //theoretical ber
//semilogy(SNR,thber);
legend('simulated curve','theoretical curve');
