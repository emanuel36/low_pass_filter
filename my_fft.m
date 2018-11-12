function [X,freq] = my_fft(x,Fs)
N = length(x);
k = 0:N-1;                          
T = N/Fs;                          
freq = k/T;
X = fft(x)/N;                      
cutOff = ceil(N/2);                 
X = X(1:cutOff);
figure
plot(freq(1:cutOff),abs(X));        
title('Transformada Rápida de Fourier');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');
end
