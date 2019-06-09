function parent = truncation(pop , cross_rate)

[r,c] = size(pop);

pop_size = r;

l = pop_size*(1 - cross_rate) + 1;

parent = pop(1:l,:);

parent = sortrows(parent,c);

end