%aa = readmatrix('flow.csv');
aa = readmatrix('6.5.csv');

% rotate to negative
v = aa(:,5);
v = -v;


% find the interval between 2 drips

% v = v(1:1000000);


%%
MinPeakDistance = 2000;
% [pks,locs] = findpeaks(v, 'MinPeakHeight', -1, 'MinPeakDistance',MinPeakDistance, 'MinPeakWidth', 8);
[pks_start,locs_start, pks_end, locs_end, intervals] = peaks(v, 3);
number_of_drops = min(length(locs_start), length(locs_end));
drop_length = locs_end(1:number_of_drops) - locs_start(1:number_of_drops);

intervals2 = diff(locs_start);
% intervals_start_end2 = locs_start(2:number_of_drops) - locs_end;
figure;

% plot the peaks
subplot(3,1,1);
hold on
plot(v, '.')
plot(locs_start, pks_start, '*')
plot(locs_end, pks_end, '*')
title('peaks', 'FontSize',20)
xlabel('Index','FontSize',13);
ylabel('Voltage','FontSize',13);
legend('voltage','drop start', 'drop end')
grid minor;
hold off

% plot the logistic map
subplot(3,1,2);
hold on
plot(intervals, '*')
plot(intervals2, '*')
% plot(intervals_start_end, '*')
title('logistic map time between the 2 drops', 'FontSize',20)
xlabel('Drop number','FontSize',13);
ylabel('Interval [indexes]','FontSize',13);
legend('interval','interval2')
hold off


subplot(3,1,3);
plot(drop_length, '*')
title('logistic map of drop size / speed', 'FontSize',20)
xlabel('Drop number','FontSize',13);
ylabel('Interval [indexes]','FontSize',13);

% plot 

% figure
% plot(v, '.')
% hold on
% plot(locs, pks, '*')