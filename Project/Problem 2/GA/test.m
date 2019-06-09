clc
clear

pop_size = 100;
pop(:,1) = rand(pop_size,1)*(1) + 2.6;
pop(:,2) = rand(pop_size,1)*0.1 + 0.7;
pop(:,3) = rand(pop_size,1)*(28-17) + 17;
pop(:,4) = rand(pop_size,1)*1 + 7.3;
pop(:,5) = rand(pop_size,1)*1 + 7.3;
pop(:,6) = rand(pop_size,1)*1 + 2.9;
pop(:,7) = rand(pop_size,1)*0.5 + 5;

m_rate = 0.05;

pop = mutation(pop , pop_size , m_rate);