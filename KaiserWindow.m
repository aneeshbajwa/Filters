clc;
clear all;
close all;
%Parameters
wp1 = 0.30*pi;
ws1 = 0.35*pi;
wp2 = 0.65*pi;
ws2 = 0.70*pi;
tr_width = min((ws1 - wp1),(ws2-wp2));
wc1 = (wp1+ws1)/2;
wc2 = (wp2+ws2)/2;
delta = 0.00047;
%Window Function
A = -20*log10(delta);
if A>50
  bet = 0.1102*(A-8.7)
  ;
elseif A>=21 && A<=51
    bet = 0.5842*(A-21).^0.4 + 0.07886*(A-21);
else
    bet = 0;
end
M = ceil((A-8)/(2.285*tr_width)) + 1
w_n = kaiser(M,bet);

%Band Pass Filter Coefficients 
n = -(M-1)/2 : (M-1)/2;
fc1 = wc1/(2*pi);
fc2 = wc2/(2*pi);
hd = 2*fc2*(sinc(2*fc2*n))-2*fc1*(sinc(2*fc1*n));
%Multiplication in Time Domain
h = hd.*w_n';
%Frequency Response
[HW,WW] = freqz(h,1);
%Plots
subplot(2,1,1);
stem(n,w_n);
title('Window function Kaiser');
xlabel('\bfn');
ylabel('\bfW[n]');
grid on;

subplot(2,1,2);

plot(WW./pi,abs(HW));
title('Band Pass filter');
xlabel('\bfNormalized Frequency');
ylabel('\bfMagnitude response of BPF');
grid on;