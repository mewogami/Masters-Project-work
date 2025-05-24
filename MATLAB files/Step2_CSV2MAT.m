clear
close all
clc
format long g

Lon = [66.5:0.25:100.0];
Lat = [6.5:0.25:38.5];
 y=1;  %initializing rows


for i=1901:2019
    i
    flag=0;
    flag=leapyear(i);
    if(flag==1)
        n=366;
    else
        n=365;
    end
   
    
for day= 1:n
    clear filename M
    filename=['I:\Agami\CSV\' num2str(i) 'ind' num2str(i) '_rfp25' num2str(day) '.csv'];
    M=csvread(filename);
    z=1;
  
   % start=length(Rainfall{1,1});
    for j = 1:size(Lat,2)
        for k = 1:size(Lon,2)
            Rf_Data{z,1}(y,:) = [Lat(j),Lon(k),i,M(j,k)];
           
           % Rainfall{z,1}(start+1,:)=[Lat(j),Lon(k),i,Data(j,k)];
            z=z+1;
        end
    end
    y=y+1;
end
% 

%save('Rainfall.mat')
end

Rfp251901_2019=Rf_Data;


%keep('Rfp251901_2019.mat')
save('Rfp251901_2019.mat', '-v7.3')
%save('Rfp251901_2019.mat');

