function [pks_up, locs_up, pks_down, locs_down, intervals, drop_length] = peaks(data, threshold)
%PEAKS Summary of this function goes here
%   Detailed explanation goes here
locs_up = [];
pks_up = [];
locs_down = [];
pks_down = [];
intervals = [];
drop_length = [];
for i= 1:length(data) - 1
    if (data(i+1) - data(i) > threshold)
        locs_up = [locs_up, i+1];
        pks_up = [pks_up, data(i+1)];
        if isempty(locs_down)
            last_loc_down = 0;
        else
            last_loc_down = locs_down(end);
        end

        intervals = [intervals, i+1 - last_loc_down];
    end
    if (data(i+1) - data(i) < -threshold)
        locs_down = [locs_down, i];
        pks_down = [pks_down, data(i)];

        if isempty(locs_up)
            last_loc_up = 0;
        else
            last_loc_up = locs_up(end);
        end

        drop_length = [drop_length, i - last_loc_up];


    end
end
end

