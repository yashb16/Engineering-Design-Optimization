function children = crossover(parents , pop_size , cross_rate)

lambda = 0.618;

children = zeros(length(parents) , 8);

for i = 1:cross_rate*pop_size
   
   [r,~] = size(parents);
    
    p = randi([1,r] , 2,1); 
    
    children(i,:) = lambda*parents(p(1),:) + (1-lambda)*parents(p(2),:);
    
end

end