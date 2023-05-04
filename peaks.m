function [pks, locs, pks_length] = peaks(data, threshold)
%PEAKS Summary of this function goes here
%   Detailed explanation goes here
locs = [];
pks = [];
pks_length =[];
for i= 1:length(data) - 1
    if (data(i+1) - data(i) > threshold)
        locs = [locs, i+1];
        pks = [pks, data(i+1)];
    end
    if (data(i+1) - data(i) < -threshold)
            pks_length = [pks_length, i - locs(end)];
    end
end
end

