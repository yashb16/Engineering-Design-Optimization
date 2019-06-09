clc
clear all

count = 0;
m = [count,0];
rp = 10000;
pop_size = 100;
generation = 1;
cross_rate = 0.8;
mutation_rate = 0.03;
Ef = 0.1;

pop(:,1) = rand(pop_size,1)*(1) + 2.6;
pop(:,2) = rand(pop_size,1)*0.1 + 0.7;
pop(:,3) = rand(pop_size,1)*(28-17) + 17;
pop(:,4) = rand(pop_size,1)*1 + 7.3;
pop(:,5) = rand(pop_size,1)*1 + 7.3;
pop(:,6) = rand(pop_size,1)*1 + 2.9;
pop(:,7) = rand(pop_size,1)*0.5 + 5;

for j = 1:pop_size
   
        [m, f_pop(j)] = penalty(pop(j,:) ,m ,rp);
        pop(j,8) = f_pop(j);
        
    end
pop = sortrows(pop,8);

while generation <= 500
    
    for j = 1:pop_size
   
        [m, f_pop(j)] = penalty(pop(j,:) ,m ,rp);
        pop(j,8) = f_pop(j);
        
    end
    
    parents = tourn_sort(pop , cross_rate);
    
    avgF(generation) = mean(pop(:,8))
    
%     parents(:,8) = [];
    
    children = crossover(parents , pop_size , cross_rate);
    
    pop = [parents ; children];
    
    pop = sortrows(pop,8);
    
    if generation > 2
        
        g = constraints(pop(1,1:7))
        flag = true;
        for a = 1:length(g)
            if g(a) <= 0
                flag = flag && true;
            else
                flag = flag && false;
                
            end
        end
        
        if (abs(avgF(generation) - avgF(generation-1)) < Ef) && flag
            break
        end
        
    end
    
    pop(:,8) = [];
    
    pop = mutation(pop , pop_size , mutation_rate);
    
    generation = generation + 1;

end
xmin = pop(1,1:7)
[m , fmin] = objF(xmin , m);

[r,~] = size(m);

figure
plot(m(2:r,1) , m(2:r,2) , '.')
xlabel('Count')
ylabel('Objective Function')
title('Objective Function v/s Number of evaluations')

figure
plot(avgF)
xlabel('Generation')
ylabel('Average value of Penalty')
title('Average of population fitness v/s Generation')
