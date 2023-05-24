path = '/Users/user/Documents/university/semesters/4/lab/chaos/csv/12.csv';
aa = readmatrix(path);

% rotate to negative
sample_interval = 20e-6;
v = aa(:,5);
v = -v;


% find the interval between 2 drips

% v = v(1:100000);

[pks_start,locs_start, pks_end, locs_end, intervals, drop_length] = peaks(v, 3);
number_of_drops = min(length(locs_start), length(locs_end));
drop_length2 = locs_end(1:number_of_drops) - locs_start(1:number_of_drops);
intervals = sample_interval * intervals;
intervals2 = diff(locs_start);
% intervals_start_end2 = locs_start(2:number_of_drops) - locs_end;

%%  heatmap
fig = figure;
% Assuming you have a vector called `drop_intervals` representing the times between drops.

% Create a return map.
% In a return map, each point (x, y) represents two successive time intervals, so we need to create two vectors that represent this.
x = intervals(1:end-1);  % Time intervals t
y = intervals(2:end);    % Time intervals t+1

% Now you can use hist3 function to create a 2D histogram, which can serve as a heatmap.

% Define the number of bins you want in each dimension.
% This might need to be adjusted depending on your data.
num_bins = [200 200];

% Create 2D histogram
hist_data = hist3([x' y'], 'Edges', {linspace(min(x),max(x),num_bins(1)), linspace(min(y),max(y),num_bins(2))});

% Flip the data along the vertical axis
% hist_data = flipud(hist_data);
% hist_data = hist3([x' y']);

% Plot heatmap

% x=flipud(round(linspace(min(x),max(x),20),2));
% y=flipud(round(linspace(min(y),max(y),20),2));
% h = heatmap(x,y,hist_data, 'Colormap', parula(20), 'ColorbarVisible', 'on');


x = round(linspace(min(x),max(x),num_bins(1)),2);
y = round(linspace(min(y),max(y),num_bins(2)),2);
imagesc(x,y,hist_data');
colorbar;
set(gca,'YDir','normal'); % To align the (1,1) with bottom left.

% After your imagesc and colorbar commands
% xticks(linspace(min(x), max(x), 10));  % Replace 10 with desired number of ticks
% yticks(linspace(min(y), max(y), 10));  % Replace 10 with desired number of ticks


% Label axes
% h.Xlabel('T (n)','FontSize',13);
% h.Ylabel('T (n+1)','FontSize',13);
% h.Title('return map', 'FontSize',20)

xlabel('T (n)','FontSize',13);
ylabel('T (n+1)','FontSize',13);
title('return map', 'FontSize',20)

%%

fig = figure;
subplot(1,2,1);
% return map
hold on
plot(intervals(1:end-1), intervals(2:end),'.')
title('return map', 'FontSize',20)
xlabel('voltage (n)','FontSize',13);
ylabel('Voltage (n+1)','FontSize',13);
grid minor;
hold off

subplot(1,2,2);
% return map
hold on
plot(intervals2(1:end-1), intervals2(2:end),'.')
title('return map', 'FontSize',20)
xlabel('voltage (n)','FontSize',13);
ylabel('Voltage (n+1)','FontSize',13);
grid minor;
hold off

%%

fig = figure;

% plot the peaks
subplot(3,1,1);
hold on
plot(v, '.')
plot(locs_start, pks_start, '*')
plot(locs_end, pks_end, '*')
title("peaks" + name, 'FontSize',20)
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
plot(intervals(1:end-1), intervals(2:end),'.')
title('return map', 'FontSize',20)
xlabel('T (n)','FontSize',13);
ylabel('T (n+1)','FontSize',13);
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
