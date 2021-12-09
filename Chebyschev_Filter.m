clc
clear all
close all
wp = input('Enter Passband edge in rad/s')
ws = input('Enter StopBand edge in rad/s')
As = input('Stopband Attenuation in dB')
Rp = input('PassBand ripple in dB')
T = 1
Fs = 1/T
Os = (2/T)*tan(ws/2)
Op = (2/T)*tan(wp/2)
%Order Of chebyschev and cutoff freq of chebyschev filter
[n,wn] = cheb1ord(Op,Os,Rp,As,'s')
%Design Chebyschev filter using cheby1
[num,den] = cheby1(n,Rp,wn,'s')
[b,a] = bilinear(num,den,Fs)
hs = num/den
[H,W] = freqz(b,a)
subplot(2,1,1)
plot(W./pi,abs(H))
title('Magnitude Plot')
xlabel('Normalized Frequency(\omega/\pi)')
ylabel('Magnitude Response of LPF |H(\omega)|')
grid on
subplot(2,1,2)
plot(W./pi,angle(H))
title('Phase Plot')
xlabel('Normalized Frequency(\omega/\pi)')
ylabel('Phase Response of LPF |H(\omega)|')
grid on