% aa = readmatrix('flow.csv');
aa = readmatrix('6.5.csv');

% rotate to negative
v = aa(:,5);
v = -v;

% find the interval between 2 drips

v = v(1:1000000);
[pks,locs] = findpeaks(v, 'MinPeakHeight', -1, 'MinPeakDistance',500, 'MinPeakWidth', 8);
%%

intervals = diff(locs);

figure;

% plot the peaks
subplot(2,1,1);
hold on
plot(v, '.')
plot(locs, pks, '*')
grid minor;
hold off

% plot the logistic map
subplot(2,1,2);
hold on
plot(intervals, '*')
title('logistic map time between the 2 drops')
xlabel('Time [s]','FontSize',13);
ylabel('Voltage [V]','FontSize',13);
legend('measured voltage','','given voltage peaks')
hold off

% plot 

% figure
% plot(v, '.')
% hold on
% plot(locs, pks, '*')