clear all
clc 
directory = ['C:\Users\User\OneDrive - Indian Institute of Science\temporal resolution\1990-1999']
cd(directory)
count = 1
for i = 1990:1999
    Filename = ['ncum_imdaa_reanl_HR_APCP-sfc_' num2str(i) '.nc']
    file  = ncinfo(Filename);
    var = file.Variables;
    Latitude = ncread(Filename,'latitude');
    Longitude = ncread(Filename,'longitude');
    dummy = ncread(Filename,'APCP_sfc');
    Rain{count,1}= dummy(1:243,1:241,:);
    count = count+1
end

save('Rain4.mat', 'Rain', '-v7.3') 
% count = 1
% for i = 1990:1999
%    h = length(Rain{i-1989,1}(1,:,:))
%         for k =1:h
%             Data{count,1}(:,:) = Rain{i-1989,1}(:,:,k);
%             count = count+1;
%         end
%    
% end
% save('Rain_arranged_chirps4.mat', 'Data', '-v7.3') 
% cd C:\Users\User\OneDrive - Indian Institute of Science\temporal resolution
           


