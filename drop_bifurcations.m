clear;
myDir=pwd;
myFiles=dir(fullfile(myDir,'*.csv'));

    
for k = 1:length(myFiles)
    baseFileName = myFiles(k).name;
    aa=readmatrix(baseFileName);
    % aa(:,5) = aa(:,5);

    vec_len = length(aa(:,4));

%     first half
    time = aa(1:0.6*vec_len,4);
    measured_voltage = aa(1:vec_len,5);
    % measured_voltage = smoothdata(measured_voltage,"gaussian");
    % [given_peaks,given_peaks_time] = findpeaks(given_voltage,time,'MinPeakHeight',0.1);
    [measured_peaks,measured_peaks_time] = findpeaks(measured_voltage,time,'MinPeakDistance',0.8*mean(diff(given_peaks_time)));

    figure;
%     subplot(2,1,1);
%     grid minor;
%     hold on;
%     plot(time,measured_voltage);
%     plot(time,given_voltage);
%     plot(measured_peaks_time,measured_peaks,'o');
%     plot(given_peaks_time,given_peaks,'o');
%     xlabel('Time [s]','FontSize',13);
%     ylabel('Voltage [V]','FontSize',13);
%     legend('measured voltage','','given voltage peaks')
%     hold off;
    
    belonged_peaks = zeros(1,length(given_peaks_time));
    for a = 1:length(given_peaks_time)
        [~,closest_index] = min(abs(measured_peaks_time-given_peaks_time(a)));
        belonged_peaks(a) = measured_peaks(closest_index);
    end
%     subplot(2,1,2);
    grid minor;
    hold on;
    plot(given_peaks,belonged_peaks,'*','LineStyle','none');
    xlabel('Transmited Voltage [V]','FontSize',13);
    ylabel('Diode Voltage [V]','FontSize',13);


%     second half
%     time = aa(0.6*vec_len:0.5*vec_len,4);
%     measured_voltage = aa(0.6*vec_len:0.5*vec_len,5);
%     given_voltage = aa(0.6*vec_len:0.5*vec_len,11);
%     given_voltage = smoothdata(given_voltage,"gaussian");
%     [given_peaks,given_peaks_time] = findpeaks(given_voltage,time,MinPeakHeight=0.1);
%     [measured_peaks,measured_peaks_time] = findpeaks(measured_voltage,time,'MinPeakDistance',0.8*mean(diff(given_peaks_time)));
% 
%     subplot(2,2,3);
%     grid minor;
%     hold on;
%     plot(time,measured_voltage);
% %     plot(time,given_voltage);
%     plot(measured_peaks_time,measured_peaks,'o');
%     plot(given_peaks_time,given_peaks,'o');
%     title('AM Signal - 34 kHz',FontSize=16);
%     xlabel('Time [s]','FontSize',13);
%     ylabel('Voltage [V]','FontSize',13);
%     legend('measured voltage','','given voltage peaks')
%     hold off;
%     
%     belonged_peaks = zeros(1,length(given_peaks_time));
%     for a = 1:length(given_peaks_time)
%         [~,closest_index] = min(abs(measured_peaks_time-given_peaks_time(a)));
%         belonged_peaks(a) = measured_peaks(closest_index);
%     end
%     subplot(2,2,4);
%     grid minor;
%     hold on;
%     plot(given_peaks,belonged_peaks,'*',LineStyle='none');
%     title('Logistic Map - Measured VS Given Voltage',FontSize=16);
%     xlabel('Given Voltage [V]','FontSize',13);
%     ylabel('Measured Voltage [V]','FontSize',13);

    
% XY - map
    drop = [1:len(measured_voltage)];
    figure;
    plot(drop,measured_voltage);
    hold on;
    grid on;
    xlabel('Given Voltage [V]','FontSize',13);
    ylabel('Measured Voltage [V]','FontSize',13);

end
