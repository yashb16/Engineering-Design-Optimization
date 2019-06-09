function children = crossover(parents , pop_size , cross_rate)

lambda = 0.618;

[~ , c] = size(parents);

children1 = zeros(cross_rate*pop_size/2 , c);
children2 = zeros(cross_rate*pop_size/2 , c);
for i = 1:cross_rate*pop_size/2
   
   [r,~] = size(parents);
    
    p = randi([1,r] , 2,1);
    
    children1(i,1:c-1) = (lambda)*parents(p(1),1:c-1) + (1-lambda)*parents(p(2),1:c-1);
    children2(i,1:c-1) = (1-lambda)*parents(p(1),1:c-1) + (lambda)*parents(p(2),1:c-1);
%     [m , children(i,c)] = objF(children(i,1:c-1) , m);
    
end

children = [children1 ; children2];

end