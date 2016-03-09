clear all;
close all;
clc;

[x,fs] = wavread('C:/Users/nitu/Desktop/Project_5_audio.wav');
y = fft(x);
N = length(y);
f=(0:(N-1))*fs/N;
%wavplay(x,fs);
figure(1);
plot(f,abs(y));
title('Corrupt Audio Signal');
xlabel('Frequency');
ylabel('Magnitude');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%-------1st filter   BAND STOP FILTER
wc1=1100; 
wc2=1500; 
wn=[wc1 wc2]/(fs/2); 
N=2000; 
h=fir1(N,wn,'stop'); 
yb_s1 = conv(x,h);
%wavplay(yb_s1,fs);
yb_s11 = fft(yb_s1);
N1 = length(yb_s11);
f1=(0:(N1-1))*fs/N1;
figure(2);
plot(f1,abs(yb_s11));
title('Output of Filter 1');
xlabel('Frequency');
ylabel('Magnitude');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-------2nd filter    BAND STOP FILTER
wc3=100; 
wc4=250; 
wn2=[wc3 wc4]/(fs/2); 
%N=2000; 
h2=fir1(N,wn2,'stop'); 
yb_s2 = conv(yb_s1,h2);
%wavplay(yb_s2,fs);
yb_s21 = fft(yb_s2);
N2 = length(yb_s21);
f2=(0:(N2-1))*fs/N2;
figure(3);
plot(f2,abs(yb_s21));
title('Output of Filter 2');
xlabel('Frequency');
ylabel('Magnitude');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%--------3rd filter      BAND STOP FILTER
wc5=3000; 
wc6=8000; 
wn3=[wc5 wc6]/(fs/2); 
N=2000; 
h3=fir1(N,wn3,'stop'); 
yb_s3 = conv(yb_s2,h3);
%wavplay(yb_s3,fs);
yb_s31 = fft(yb_s3);
N3 = length(yb_s31);
f3=(0:(N3-1))*fs/N3;
figure(4);
plot(f3,abs(yb_s31));
title('Output of Filter 3');
xlabel('Frequency');
ylabel('Magnitude');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%--------4th filter     BAND STOP FILTER
wc7=45;
wc8=105;
wn4=[wc7 wc8]/(fs/2); 
h4=fir1(N,wn4,'stop'); 
yb_s4 = conv(yb_s3,h4);
%wavplay(yb_s4,fs);
yb_s41 = fft(yb_s4);
N4 = length(yb_s41);
f4=(0:(N4-1))*fs/N4;
figure(5);
plot(f4,abs(yb_s41));
title('Output of Filter 4');
xlabel('Frequency');
ylabel('Magnitude');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%---------5th filter    HIGH PASS FILTER
wc9=100; 
%wc10=5000;
wn5=[wc9]/(fs/2); 
h5=fir1(N,wn5,'high'); 
yb_s5 = conv(yb_s4,h5);
%wavplay(yb_s5,fs);
yb_s51 = fft(yb_s5);
N5 = length(yb_s51);
f5=(0:(N5-1))*fs/N5;
figure(6);
plot(f5,abs(yb_s51));
title('Output of Filter 5');
xlabel('Frequency');
ylabel('Magnitude');
grid on;

%%%%%%%%%%%%%%%%%%%%%%---------6th filter         BAND STOP FILTER
wc11=1050; 
wc12=1200;
wn6=[wc11 wc12]/(fs/2); 
N6 = 2000; 
h6=fir1(N,wn6,'stop'); 
yb_s6 = conv(yb_s5,h6);
%wavplay(yb_s6,fs);
yb_s61 = fft(yb_s6);
N6 = length(yb_s61);
f6=(0:(N6-1))*fs/N6;
figure(7);
plot(f6,abs(yb_s61));
title('Output of Filter 6');
xlabel('Frequency');
ylabel('Magnitude');
grid on;
wavwrite(yb_s6,fs,'AA_NM.wav');