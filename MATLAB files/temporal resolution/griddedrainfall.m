clear all
clc

load('Cat4.mat') 
% mn = xlsread('coordinates.csv');
% 
% lat = mn(:,1); %lat
% lon = mn(:,2); %long



lat = [8.16:0.12:36.96];
lon = [68.28:0.12:97.32];
count = 1;
for j = 1:length(lon)
    for k = 1:length(lat)
        NCWRF4{count,1}(:,1) = lat(k);
        NCWRF4{count,1}(:,2) = lon(j);
        NCWRF4{count,2}(:,1) = C4(k,j,:);
        count=count+1;
    end
end

% M = mn(:,3); %lat_num
% N = mn(:,4); %long_num
% 
% lat = num2cell(X);
% long = num2cell(Y);
% 
% for a = 1:20082
%     IMD_grided{a,1} = lat{a,1};
%     IMD_grided{a,2} = long{a,1};
%     
% 
% end
% 
% for c = 1: length(M)
%     for b = 1:66498
%         
%         IMD_grided{a,3}(b,:) = Data{b,1}(i,j);
%     end
% 
% save('IMD_grided.mat')




