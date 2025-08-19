clc
clear
close all
% %% READING ACCELEROMETER DATA and defining Variables
data   = xlsread('500rpm.csv');
time   = data(:,1);
X_acc  = data(:,2);
Y_acc  = data(:,3);
Z_acc  = data(:,4);
R_acc  = sqrt(X_acc.^2 + Y_acc.^2 + Z_acc.^2);
plot(time,R_acc)
N      = numel(time);
Ts     = abs(diff(time(1:2)));
fs     = 1/Ts;
f_axis = [0:N-1]*fs/N;
A_freq = fft(R_acc);
figure(2)
plot(f_axis,abs(A_freq),'-r','LineWidth',1.25)
grid on 
grid minor
ylabel('Acceleration amplitude')
xlabel('Frequency')
% xlim([min(abs(X_vel)) max(abs(X_vel))])
% title('V-f Graph - X Direction - 500 RPM 24015 0 degree AOA, at Leading edge')