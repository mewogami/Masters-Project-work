clear
close all
clc
format long g
%% coded by tresa thomas

%% datetime
Lon = [66.5:0.25:100.0];
Lat = [6.5:0.25:38.5];

for i=1901:2019
 
    flag=0;
    filename=['I:\Agami\rain\' num2str(i) '.grd'];
    fid = fopen(filename);
    text = fread(fid,'float32');
    flag=leapyear(i);
    if(flag==1)
        n=366;
    else
        n=365;
    end
    %if ((length(text)/(135*129*n))~=1)
        %break;
    %end
c=1;
for day= 1:n
    for j = 1:size(Lat,2)
        for k = 1:size(Lon,2)
            Data(j,k) = text(c,1);
            c=c+1;
        end
    end
  % filename=string(i)+"/ind"+string(i)+"_rfp25_"+string(day)+".csv";
    
     
    filename=['I:\Agami\CSV\' num2str(i) 'ind' num2str(i) '_rfp25' num2str(day) '.csv'];
    csvwrite(filename,Data);
end
 fclose(fid)
end







