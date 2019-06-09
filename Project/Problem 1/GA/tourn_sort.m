function parent = tourn_sort(pop , cross_rate)

[r,c] = size(pop);

r = (r*(1-cross_rate));

temp = pop;

if ~mod(r,2)
    i = 1;
%     r = r/2;
else 
    parent(1,:) = temp(1,:);
    i = 2;
%     r = (r-1);
end

while i < r+1
    
    [l,~] = size(temp);
    
    p = randi([1,l] , 2 , 1);
    
    tournament(1,:) = temp(p(1),:);
    tournament(2,:) = temp(p(2),:);
    
    if p(1,1) == p(2,1)
        continue
    elseif tournament(1,c) > tournament(2,c)
        parent(i,:) = tournament(2,:);
    elseif tournament(2,c) >= tournament(1,c)
        parent(i,:) = tournament(1,:);
    end
    
    [j,~] = max(p);
    [k,~] = min(p);
    
    temp(j,:) = [];
    temp(k,:) = [];
    
    i = i+1;
    
end

parent = sortrows(parent,c);

end