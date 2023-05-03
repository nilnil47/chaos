[pks,locs] = findpeaks(v, 'MinPeakHeight', -1, 'MinPeakDistance',00, 'MinPeakWidth', 8);
figure
plot(v, '.')
hold on
plot(locs, pks, '*')