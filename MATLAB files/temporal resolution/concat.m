clear all
clc

load('Rain4.mat') 

C4 = cat(3,Rain{1,1},Rain{2,1},Rain{3,1},Rain{4,1},Rain{5,1},Rain{6,1},Rain{7,1},Rain{8,1},Rain{9,1},Rain{10,1});

save('Cat4.mat', 'C4', '-v7.3');