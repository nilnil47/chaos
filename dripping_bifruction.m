aa = readmatrix(path);

% rotate to negative
v = aa(:,5);
v = -v;


% find the interval between 2 drips

% v = v(1:1000000);


%%
% MinPeakDistance = 2000;
% [pks,locs] = findpeaks(v, 'MinPeakHeight', -1, 'MinPeakDistance',MinPeakDistance, 'MinPeakWidth', 8);
[pks_start,locs_start, pks_end, locs_end, intervals, drop_length] = peaks(v, 3);
number_of_drops = min(length(locs_start), length(locs_end));
drop_length2 = locs_end(1:number_of_drops) - locs_start(1:number_of_drops);

intervals2 = diff(locs_start);
% intervals_start_end2 = locs_start(2:number_of_drops) - locs_end;
fig = figure;

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
% plot(intervals2, '*')
% plot(intervals_start_end, '*')
title('logistic map time between the 2 drops', 'FontSize',20)
xlabel('Drop number','FontSize',13);
ylabel('Interval [indexes]','FontSize',13);
legend('interval','interval2')
hold off




subplot(3,1,3);
% return map
hold on
plot(v(1:end-1), v(2:end),'.')
title('return map', 'FontSize',20)
xlabel('voltage (n)','FontSize',13);
ylabel('Voltage (n+1)','FontSize',13);
grid minor;
hold off

%%
% interval
% hold on
% plot(drop_length, '*')
% title('logistic map of drop size / speed', 'FontSize',20)
% xlabel('Drop number','FontSize',13);
% ylabel('Interval [indexes]','FontSize',13);
% legend('drop length','drop length 2')
% hold off
% 
% mkdir fig
% savefig(fig, fullfile('fig', name + ".fig"))
% saveas(gcf, fullfile('fig', name + ".png"))

%%

% return map
% subplot(3,1,1);
% figure
% hold on
% plot(v(1:end-1), v(2:end),'.')
% title('return map', 'FontSize',20)
% xlabel('voltage (n)','FontSize',13);
% ylabel('Voltage (n+1)','FontSize',13);
% grid minor;
% hold off


mkdir fig
savefig(fig, fullfile('fig', name + ".fig"))
saveas(gcf, fullfile('fig', name + ".png"))


% plot 

% figure
% plot(v, '.')
% hold on
% plot(locs, pks, '*')
