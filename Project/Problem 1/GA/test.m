clc
clear

count = 0;
m = [count , 0];
pop_size = 50;
len = 20;
pop = lhsdesign(pop_size,len)*200 - 100;
for j = 1:pop_size
   
    [m, pop(j,len+1)] = objF(pop(j,:) ,m);
        
end

pop = sortrows(pop , len+1);
children = crossover(pop , pop_size , 0.8);
for j = 1:pop_size*0.8
   
    [m, children(j,len+1)] = objF(children(j,:) ,m);
        
end

% [m , Fmin] = objF(xmin , m);
% Fmin

[r,c] = size(m);

figure
plot(m(2:r,1) , m(2:r,2) , '.')
xlabel('Count')
ylabel('Objective Function')
title('Objective Function vs Number of evaluations')
% ylim([-10^5 10^6])