clc
clear
close all
%% READING ACCELEROMETER DATA and defining Variables
                        % LEADING EDGE %
data   = xlsread('LE_700rpm.csv');
LE_time   = data(:,1);
LE_X_acc  = data(:,2);
LE_Y_acc  = data(:,3);
LE_Z_acc  = data(:,4);
LE_R_acc  = sqrt(LE_X_acc.^2 + LE_Y_acc.^2 + LE_Z_acc.^2);
% plot(LE_time,LE_R_acc)
N      = numel(LE_time);
Ts     = abs(diff(LE_time(1:2)));
fs     = 1/Ts;
f_axis = [0:N-1]*fs/N;
A_freq_LE = fft(LE_Z_acc);
figure(1) 
plot(LE_time,LE_Z_acc)
hold on
figure(2)
hold on
plot(f_axis,abs(A_freq_LE),'-r','LineWidth',0.5)
grid on 
grid minor
                        % TRAILING EDGE %
data   = xlsread('TE_700rpm.csv');
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
legend ('Leading Edge','Trailing Edge','FontSize',12,'FontWeight','normal')
title('Acceleration vs Time - NACA 34015 at 15 \circ AOA','FontSize',16,'FontWeight','normal')
ylim([0.5 2])
figure(2)
plot(f_axis,abs(A_freq_TE),'-b','LineWidth',0.5)
grid on 
grid minor
ylabel('Acceleration amplitude (m/s^2)','FontSize',14,'FontWeight','normal')
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','normal')
ylim([0 20])
legend ('Leading Edge','Trailing Edge','FontSize',12,'FontWeight','normal')
title('Acceleration vs Frequency - NACA 34015 at 15 \circ AOA','FontSize',16,'FontWeight','normal')