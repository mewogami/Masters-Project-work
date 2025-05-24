clear all
clc 
directory = ['H:\chirps_p05']
cd(directory)
count = 1
for i = 1981:2022
    Filename = ['chirps-v2.0.' num2str(i) '.days_p05.nc']
    file  = ncinfo(Filename);
    var = file.Variables;
    Latitude = ncread(Filename,'latitude');
    Longitude = ncread(Filename,'longitude');
    dummy = ncread(Filename,'precip');
    Rain{count,1}= dummy(4929:5552,1125:1752,:);
    count = count+1
end


count = 1
for i = 1981:2021
    
    leap_year =  leapyear(i);
    if leap_year==0
        i
        for k =1:365
            Data{count,1}(:,:) = Rain{i-1980,1}(:,:,k)';
            count = count+1;
        end
    else
        i
        for k =1:366
            Data{count,1}(:,:) = Rain{i-1980,1}(:,:,k)';
            count = count+1;
        end
    end
end

cd H:\Anubhav_code\India
save('Rain.mat', 'Rain', '-v7.3')            
save('Rain_arranged_chirps.mat', 'Data', '-v7.3')       
        



