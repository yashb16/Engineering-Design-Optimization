clc
clear 

count = 0;
m = [count,0];
pop_size = 60;
generation = 1;
cross_rate = 0.8;
Ef = 0.001;
mutation_rate = 0.05;
len = 20; % number of variables

pop = lhsdesign(pop_size,10)*100;
pop(:,11:20) = lhsdesign(pop_size , 10)*60 - 30;

while generation <= 2500
    
    for j = 1:pop_size
   
        [m, pop(j,len+1)] = objF(pop(j,:) ,m);
        
    end
    
    pop = sortrows(pop , len+1);
    
    avgF(generation) = mean(pop(:,len+1));
    xbest(generation,:) = pop(1,1:len);
    Fbest(generation) = pop(1,len+1);
    
    parents = tourn_sort(pop , cross_rate);
    
    children = crossover(parents , pop_size , cross_rate);
    [m , children(:,len+1)] = objF(children(:,1:len), m);
%     for j = 1:pop_size*cross_rate
%    
%         [m, children(j,len+1)] = objF(children(j,:) ,m);
%         
%     end

    pop = [parents ; children];
    
    pop = sortrows(pop,len+1);
    
    if generation > 2
        
        if (abs(avgF(generation) - avgF(generation-1)) <= Ef) && (abs(Fbest(generation) - Fbest(generation-1)) <= Ef)
            break
        end
        
    end
    
    pop(:,len+1) = [];
    
    pop = mutation(pop , pop_size , mutation_rate);
    
    generation = generation + 1

end
xmin = pop(1,1:len)
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
ylabel('Average value of Fitness')
title('Average of population fitness v/s Generation')

figure
plot(xbest(1,1:10) , xbest(1,11:20) , '*')
xlabel('x')
ylabel('y')
title('Configuration Initial')
figure
plot(xbest(500,1:10) , xbest(500,11:20) , '*')
xlabel('x')
ylabel('y')
title('Configuration 1')
figure
plot(xbest(1000,1:10) , xbest(1000,11:20) , '*')
xlabel('x')
ylabel('y')
title('Configuration 2')
figure
plot(xbest(1500,1:10) , xbest(1500,11:20) , '*')
xlabel('x')
ylabel('y')
title('Configuration 3')
figure
plot(xbest(2000,1:10) , xbest(2000,11:20) , '*')
xlabel('x')
ylabel('y')
title('Configuration 4')
figure
plot(xbest(2500,1:10) , xbest(2500,11:20) , '*')
xlabel('x')
ylabel('y')
title('Configuration Final')
