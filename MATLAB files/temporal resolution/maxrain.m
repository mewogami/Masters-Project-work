clear
close all
clc
%%
%Cordinates of India region  

%% 
load ('RF_4.mat')
z=1;

%% 

for k = 1:20082
    
    maxrain_4{k,1} = RF_4{k,1};
    maxrain_4{k,2} = RF_4{k,2}; 
    for i = 1:10
        c = max(RF_4{k,3}{1,i});
        
        maxrain_4{k,3}(i,:) = c;
        
        
    end
   

end

save ('maxrain_4.mat','-v7.3')

