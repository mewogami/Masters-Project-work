clear all
clc

load("Cat4.mat");

lat = [8.16:0.12:36.96];

lon = [68.28:0.12:97.32];
count = 1;
for j = 1:length(lon)
    for k = 1:length(lat)
        NCWRF4{count,1}(:,1) = lon(j);
        NCWRF4{count,2}(:,1) = lat(k);
        NCWRF4{count,3}(:,1) = C4(j,k,:);
        count=count+1
    end
end

save('NCWRF4.mat', 'NCWRF4', '-v7.3')