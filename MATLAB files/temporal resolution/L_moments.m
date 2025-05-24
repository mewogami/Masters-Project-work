clear all
clc
load ('maxrain_3.mat');
%% 

for i = 1:20082
    for j = 1:10
        m{j,1} = rmmissing(maxrain_3{i,3}(j,1));

    end
    n = cell2mat(m);
    ln = length(n);
    op = sort(n);
    b0 = mean(op);
    qr = num2cell( op );

    for k = 1:ln
        st{k,1} = qr{k,1}*((k-0.35)/ln);
        uv{k,1} = qr{k,1}*((k-0.35)/ln)^2;
        xy{k,1} = qr{k,1}*((k-0.35)/ln)^3;

    end
    b1 = mean(cell2mat(st));
    b2 = mean(cell2mat(uv));
    b3 = mean(cell2mat(xy));

    l1 = b0;
    l2 = 2*b1 - b0;
    l3 = 6*b2 - 6*b1 + b0;
    l4 = 20*b3 - 30*b2 + 12*b1 - b0;

    t = l2/l1;
    t3 = l3/l2;
    t4 = l4/l2;

    Lmoments_3{i,1} = maxrain_3{i,1};
    Lmoments_3{i,2} = maxrain_3{i,2};
    Lmoments_3{i,3} = l1;
    Lmoments_3{i,4} = t;
    Lmoments_3{i,5} = t3;
    Lmoments_3{i,6} = t4; 
end
      
save ('Lmoments_3.mat')