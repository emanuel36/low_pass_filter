close all;
filename = 'audio.mp3';
[s1, Fs] = audioread(filename);

fsamp = Fs;

fp = 2300; 
fs = 3800;

wp = (fp/(fsamp/2))*pi; 
ws = (fs/(fsamp/2))*pi;

wt = ws - wp;    

M = ceil((6.6*pi/wt)) + 1;

wc = (ws + wp)/2; 

hd = my_lowpass_ideal(wc,M);

w_hamm = hamming(M)'; 
 
h = hd.*w_hamm;

s1_filtrado = conv(h,s1); 


% figure
% w = bartlett(64)
% my_plot(w, 'Janela de Bartlett');

% w = kaiser(64 ,0.1);
% figure;
% my_plot(w, 'Janela de Kaiser-Bessel (B = 0.1)');

% w = flattopwin(64);
% figure;
% my_plot(w, 'Janela de Flattopwin');

%my_fft(s1,fsamp);

%my_fft(s1_filtrado,fsamp);

% subplot(2,1,1)
% my_plot(s1, 'Sinal de áudio original no domínio tempo', 'Tempo (s)', 'Amplitude');
% 
% subplot(2,1,2)
% my_plot(s1_filtrado, 'Sinal de áudio filtrado no domínio tempo', 'Tempo (s)', 'Amplitude');


% figure
% hold on
% u = s1(0.2 * Fs:0.2 * Fs + 511) .* hanning(512);
% U = fft(u);
% f = (0:256) / 256 * Fs / 2;
% plot(f, 20 * log10(abs(U(1:257))), 'r')
% xlabel('frequency [Hz]')
% ylabel('amplitude [dB]')
% 
% u = s1_filtrado(0.2 * Fs:0.2 * Fs + 511) .* hanning(512);
% U = fft(u);
% f = (0:256) / 256 * Fs / 2;
% plot(f, 20 * log10(abs(U(1:257))), 'b')
% xlabel('frequency [Hz]')
% ylabel('amplitude [dB]')
% 
% legend('Sinal de áudio', 'Sinal de áudio filtrado')
