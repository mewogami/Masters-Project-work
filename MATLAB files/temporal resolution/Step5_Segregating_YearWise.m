clear
close all
clc
format long g

%%
load('NCWRF1.mat');
IMD1=NCWRF1;


%%
%Cordinates of India region  
Cord = xlsread('coordinates.csv'); 
Cord1 = xlsread('coordinates - Copy.csv');

Long=Cord(:,1);
Lat=Cord(:,2);

Long1=Cord1(:,1);
Lat1=Cord1(:,2);

%% 

%Extracting data from IMD to Indian region given by Cord
disp('India data is loading...')
count=1;
L=length(IMD)
%% 

idx = ismember([Long1, Lat1],[Long, Lat],"rows");
count = 1;
for i  = 1:58563
    if idx(i) == 1
        IMD_India{count,:} = IMD1{i,:};
        count  = count +1;
    end
end

save('IMD_India.mat', '-v7.3')

%IMD_India=cell(length(Cord),2);
%for j=1:20082
%    for k = 1:58563
 %           if (j<=length(Cord)) && (Long(j,1)==IMD{k,1}(1,1)) && (Lat(j,1)==IMD{k,1}(1,2))
  %              IMD_India{j,1}=IMD{k,1};
   %             IMD_India{j,2}=IMD{k,2};
%
 %           end 
            
%     end
%end

%for i = 1: 200


% 
% %Replacing -999 with NaN
% for r=1:length(IMD_India)
%     
%     IMD_India{r,2}(IMD_India{r,2}==-999)=NaN;
%     
% end
% 
% %%
% %%Segregating data year wise
% Row_Ind=length(IMD_India);
% Year=(2010:1:2020)';
% L=length(Year);
% RF_2=cell(Row_Ind,2);
% for r=1:Row_Ind
% RF_2{r,1}=IMD_India{r,1};
% fprintf('segregating data yearwise %d/%d\n',r,Row_Ind);
% a=1;
% b=0;
% for i=1:L
% 
% n = 5136
% end
% 
% b=b+n;
% RF_2{r,2}{i}= IMD_India{r,2}(a:b,1);
% a=a+n;
% 
% end
% end
% %keep('RF');
% save ('RF_2', 'RF_2','-v7.3');
% 
