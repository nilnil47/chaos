function [pks, locs] = peaks(data, threshold)
%PEAKS Summary of this function goes here
%   Detailed explanation goes here
locs = [];
pks = [];
for i= 1:length(data) - 1
    if (data(i+1) - data(i) > threshold)
        locs = [locs, i+1];
        pks = [pks, data(i+1)];
    end
end
end

