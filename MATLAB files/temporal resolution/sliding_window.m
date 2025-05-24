clear all
clc

load ('RF_4.mat');

%%
for i = 1:20082
    for j =1:10
        
        for k = 1:5136
            a(k,1) = RF_4{i,3}{1,j}(k,1);
            
        end

        for b = 1:5134
        
    
        Rain3hr_4{i,1}{1,j}(b,1)=sum(a(b:b+2));
        
        end

    end
end


for k = 1:20082
    
        for i = 1:10
        c = max(Rain3hr_4{k,1}{1,i});
        
        maxrain3hr_4{k,1}(i,:) = c;
        
        
    end
   

end

save ('maxrain3hr_4.mat','-v7.3')

%save('Rain2hr_3.mat','-v7.3')


