clc;
clear all;
close all;
x=[10 20 30 40];
N=length(x); %size of x
l=(N-1)/2;

r=zeros(1,2*l+1);
han=zeros(1,2*l+1);
ham=zeros(1,2*l+1);
blk=zeros(1,2*l+1);
brt=zeros(1,2*l+1);

for i=1:(2*l+1)
    n=i-(l+1);
    r(i)=1;
    han(i)=0.5+0.5*cos(2*pi*n/N);
    ham(i)=0.54+0.46*cos(2*pi*n/N);
    blk(i)=0.42+0.*cos(2*pi*n/(N-1))+0.8*cos(4*pi*n/(N-1));
    brt(i)=1- abs((2*n-N+1)/(N-1));
    n=n+1
end

%rectangular window
r1=fftshift(fft(r,100));
y1=abs(r1)/max(r1);
r2=20*log10(y1);
subplot(5,2,1);
plot(r);
grid
title('time domain of rectangular window 101906116');
subplot(5,2,2);
plot(r2);
grid
title('frequency domain of rectangular window 101906116');

%hanning window
han1=fftshift(fft(han,1000));
w1=abs(han1)/max(han1);
han2=20*log10(w1);
subplot(5,2,3);
plot(han)
grid
title('time domain of hanning window 101906116');
subplot(5,2,4);
plot(han2);
grid
title('frequency domain of hannning window 101906116');

%hamming window
ham1=fftshift(fft(ham,1000));
a1=abs(ham1)/max(ham1);
ham2=20*log10(a1);
subplot(5,2,5);
plot(ham);
grid
title('time domain of hamming window 101906116');
subplot(5,2,6);
plot(ham2);
grid
title('frequency domain of hamming window 101906116');

%blackman window
blk1=fftshift(fft(blk,1000));
b1=abs(blk1)/max(blk1);
blk2=20*log10(b1);
subplot(5,2,7);
plot(blk);
grid
title('time domain of blackman window 101906116');
subplot(5,2,8);
plot(blk2);
grid
title('frequency domain of blackman window 101906116');

%bartlet window
brt1=fftshift(fft(brt,1000));
c1=abs(brt1)/max(brt1);
brt2=20*log10(c1);
subplot(5,2,9);
plot(brt);
grid
title('time domain of bartlet window 101906116');
subplot(5,2,10);
plot(brt2);
grid
title('frequency domain of bartlet window 101906116');