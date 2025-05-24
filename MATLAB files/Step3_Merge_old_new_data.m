clear
close all
clc
format long g

load('Rfp252014_17.mat');
load('Weather_data_imd25.mat');
Newdata=Rfp252014_17;
Olddata=Weather_data;
Lon = [66.5:0.25:100.0];
Lat = [6.5:0.25:38.5];
LAT=length(Lat); % length of latattitute
LON=length(Lon); % length of longitute

%%
disp('All data is loading...')
Rainfall= cell(LAT*LON,2);
r=length(Rainfall);

    for t=1:r
        fprintf('Loading:%d/%d\n',t,r);
       clear Adding_data
                Rainfall{t,1}=[Newdata{t,1}(1,1),Newdata{t,1}(1,2)];
                Adding_data =[Olddata{t,1}',Newdata{t,1}']';
                Rainfall{t,2}=Adding_data(:,4); %mm
              
    end
  %%  
    IMDRf_1901_2017=Rainfall;
    keep('IMDRf_1901_2017');
    save ('IMDRf_1901_2017', 'IMDRf_1901_2017','-v7.3')
  