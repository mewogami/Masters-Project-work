clear
close all
clc
format long g
%% coded by tresa thomas

%% datetime
Lon = [66.5:0.25:100.0];
Lat = [6.5:0.25:38.5];
Start_yr=2020;
End_yr=2021;
for i=Start_yr:End_yr   %%%%%%%%%%%%%%%%%%%%%%%%%%Change here
 
    flag=0;
    filename=['D:\02_Research_Work\PMP_Working\02_IMD\ind' num2str(i) '_rfp25.grd'];
    fid = fopen(filename);
    text = fread(fid,'float32');
    flag=leapyear(i)
    if(flag==1)
        n=366;
    else
        n=365;
    end
    if ((length(text)/(135*129*n))~=1)
        break;
    end
c=1;
for day= 1:n
    for j = 1:size(Lat,2)
        for k = 1:size(Lon,2)
            Data(j,k) = text(c,1);
            c=c+1;
        end
    end
  % filename=string(i)+"/ind"+string(i)+"_rfp25_"+string(day)+".csv";
    
     
    filename=['D:\02_Research_Work\PMP_Working\02_IMD\CSV\' num2str(i) 'ind' num2str(i) '_rfp25' num2str(day) '.csv'];
    csvwrite(filename,Data);
end
 fclose(fid);
end

clear
close all
clc
format long g

Lon = [66.5:0.25:100.0];
Lat = [6.5:0.25:38.5];
 y=1;  %initializing rows
Start_yr=2020;
End_yr=2021;

for i=Start_yr:End_yr      %%%%%%%%%%%%%%%%%%%%%%%%%%Change here
    flag=0;
    flag=leapyear(i)
    if(flag==1)
        n=366;
    else
        n=365;
    end
   
    
for day= 1:n
    clear filename M
    filename=['D:\02_Research_Work\PMP_Working\02_IMD\CSV\' num2str(i) 'ind' num2str(i) '_rfp25' num2str(day) '.csv'];
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

Newdata=Rf_Data;

keep('Newdata');
load('IMDRf_1901_2019.mat');   %%%%%%%%%%%%%%%%%%%%%%%%%%Change here
Olddata=IMDRf_1901_2019;

r=length(Olddata);  %%%%%%%%%%%%%%%%%%%%%%%%%%Change here
%%
disp('All data is loading...')
Rainfall= cell(r,2);

    for t=1:r
        fprintf('Loading:%d/%d\n',t,r);
       clear Adding_data V1 V2
                    V1=Olddata{t,2}';
                    V2=Newdata{t,1}(:,4)';
                    Adding_data =[V1,V2]';
                Rainfall{t,1}= Olddata{t,1}; 
                Rainfall{t,2}=Adding_data(:,1); %mm
              
    end
  %%  
    IMDRf_1901_2021=Rainfall;
    keep('IMDRf_1901_2021');
    save ('IMDRf_1901_2021', 'IMDRf_1901_2021','-v7.3')


