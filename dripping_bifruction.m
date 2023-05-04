aa = readmatrix('flow.csv');
% aa = readmatrix('6.5.csv');

% rotate to negative
v = aa(:,5);
v = -v;


% find the interval between 2 drips

% v = v(1:1000000);


%%
MinPeakDistance = 2000;
% [pks,locs] = findpeaks(v, 'MinPeakHeight', -1, 'MinPeakDistance',MinPeakDistance, 'MinPeakWidth', 8);
[pks,locs, pks_length] = peaks(v, 2);
drop_end_locs = locs + pks_length;
drop_end_pks = v(drop_end_locs);

intervals = diff(locs);

figure;

% plot the peaks
subplot(3,1,1);
hold on
plot(v, '.')
plot(locs, pks, '*')
plot(drop_end_locs, drop_end_pks, 'o')
title('peaks', 'FontSize',20)
xlabel('Index','FontSize',13);
ylabel('Voltage','FontSize',13);
legend('data','peaks')
grid minor;
hold off

% plot the logistic map
subplot(3,1,2);
hold on
plot(intervals, '*')
title('logistic map time between the 2 drops', 'FontSize',20)
xlabel('Drop number','FontSize',13);
ylabel('Interval [indexes]','FontSize',13);
% legend('measured voltage','','given voltage peaks')
hold off


subplot(3,1,3);
plot(pks_length, '*')
title('logistic map of drop size / speed', 'FontSize',20)
xlabel('Drop number','FontSize',13);
ylabel('Interval [indexes]','FontSize',13);

% plot 

% figure
% plot(v, '.')
% hold on
% plot(locs, pks, '*')