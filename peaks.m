function [pks_up, locs_up, pks_down, locs_down, intervals] = peaks(data, threshold)
%PEAKS Summary of this function goes here
%   Detailed explanation goes here
locs_up = [];
pks_up = [];

% start with 0 for calculating the inteval
locs_down = [];
pks_down = [];
intervals = [];
for i= 1:length(data) - 1
    if (data(i+1) - data(i) > threshold)
        locs_up = [locs_up, i+1];
        pks_up = [pks_up, data(i+1)];
        if isempty(locs_down)
            last_loc = 0;
        else
            last_loc = locs_down(end);
        end

        intervals = [intervals, i+1 - last_loc];
    end
    if (data(i+1) - data(i) < -threshold)
        locs_down = [locs_down, i];
        pks_down = [pks_down, data(i)];
    end
end
end

