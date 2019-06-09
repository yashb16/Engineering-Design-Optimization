function pop = mutation(pop , pop_size , m_rate)
    
bounds = 2.5;

rn = randi([1 pop_size] , pop_size*m_rate , 1);
rn = sortrows(rn , -1);

while length(rn) ~= length(unique(rn))
    rn = randi([1 pop_size] , pop_size*m_rate , 1);
    rn = sortrows(rn , -1);
end

for i = 1:length(rn)
    
    p(i,:) = pop(rn(i),:);
    pop(rn(i),:) = [];    
end


[r,c] = size(p);

for j = 1:r
   
   for k = 1:c
      
      p(j,k) = p(j,k) + (rand*(2*bounds) - bounds);
%       p(j,k) = p(j,k)*2;
      
   end

end    

pop = [pop ; p];

end