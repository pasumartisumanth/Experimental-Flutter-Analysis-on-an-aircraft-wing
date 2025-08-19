clc
clear
close all
%% READING ACCELEROMETER DATA and defining Variables
                      % TRAILING EDGE %
data   = xlsread('TE_200rpm.csv');
TE_time   = data(:,1);
TE_X_acc  = data(:,2);
TE_Y_acc  = data(:,3);
TE_Z_acc  = data(:,4);
TE_R_acc  = sqrt(TE_X_acc.^2 + TE_Y_acc.^2 + TE_Z_acc.^2);
% plot(TE_time,TE_R_acc)
N      = numel(TE_time);
Ts     = abs(diff(TE_time(1:2)));
fs     = 1/Ts;
f_axis = [0:N-1]*fs/N;
A_freq_TE = fft(TE_Z_acc);
figure(1)
plot(TE_time, TE_Z_acc)
grid on
grid minor
xlabel('Time (s)','FontSize',14,'FontWeight','normal')
ylabel('Acceleration Amplitude (m/s^2)','FontSize',14,'FontWeight','normal')
legend ('Trailing Edge','FontSize',12,'FontWeight','normal')
title('Acceleration vs Time - NACA 34015 at 5 \circ AOA','FontSize',16,'FontWeight','normal')
% ylim([0.5 2])
figure(2)
plot(f_axis,abs(A_freq_TE),'-b','LineWidth',0.5)
grid on 
grid minor
ylabel('Acceleration amplitude (m/s^2)','FontSize',14,'FontWeight','normal')
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','normal')
ylim([0 5])
legend ('Trailing Edge','FontSize',12,'FontWeight','normal')
title('Acceleration vs Frequency - NACA 34015 at 5 \circ AOA','FontSize',16,'FontWeight','normal')