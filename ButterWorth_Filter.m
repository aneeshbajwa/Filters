clc 
clear all
close all
 wp = input('Enter value of passband edge');
 ws = input('Enter value of stopband edge');
Rp = input('Enter value of passband ripple');
As = input('Enter value of stopband attenuation');
Rp = 1%passband ripple
As = 10%stop band Attenuation
T = 1
Fs = 1/T
%convert frequencies from DT to CT
Op = (2/T)*tan(wp/2)
Os = (2/T)*tan(ws/2)
%Calculate Cut-off frequency and order of filter
N = ceil(log10((10^(Rp/10)-1)/(10^(As/10)-1))/(2*log10(Op/Os)));
Oc = Op/((10^(Rp/10)-1)^(1/(2*N)))
%Design H(s) using butterworth approximation
c = input('Enter type of filter :1 for LPF, 2 for HPF, 3 for BPF, 4 for BSF')
%H(s) = num/den
if(c==1)
    [num,den] = butter(N,Oc,'s')
elseif (c==2)
    [num,den] = butter(N,Oc,'high','s')
elseif (c==3)
    [num,den] = butter(N,Oc,'bandpass','s')
else
    [num,den] = butter(N,Oc,'stop','s')
end
%convert H(s) to H(z) using bilinear transfrom
%H(z) = b/a
[b,a] = bilinear(num,den,Fs)
%convert H(z) from z domain to frequency domain
[h,w] = freqz(b,a)
%w is frequencies and h denote corresponding values of h(w)
subplot(2,1,1)
plot(w./pi,abs(h))
title('Magnitude Response')
xlabel('Normalized Frequency(\omega/\pi)')
ylabel('|H(\omega)|')
grid on
subplot(2,1,2)
plot(w./pi,angle(h))
title('Phase Response')
xlabel('Normalized Frequency(\omega/\pi)')
ylabel('Phase(H(\omega))')
grid on
