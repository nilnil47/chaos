files = dir('csv/*.csv');
for i = 1:length(files)
    name = files(i).name;
    path = fullfile(files(i).folder, files(i).name);
    disp(path)
    
    dripping_bifruction
end