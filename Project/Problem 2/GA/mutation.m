function pop = mutation(pop , pop_size , m_rate)
    
bounds = 0.1;

rn = randi([1 pop_size] , pop_size*m_rate , 1);

rn = sortrows(rn , -1);

for i = 1:length(rn)
    
    p(i,:) = pop(rn(i),:);
    pop(rn(i),:) = [];    
end


[r,c] = size(p);

for j = 1:r
   
   for k = 1:c
      
      p(j,k) = rand*(2*p(j,k)*bounds) + p(j,k)*(1 - bounds);
       
      switch k
          case 1
              if p(j,k) < 2.6
                  p(j,k) = 2.6;
              elseif p(j,k) > 3.6
                  p(j,k) = 3.6;
              end
          case 2
              if p(j,k) < 0.7
                  p(j,k) = 0.7;
              elseif p(j,k) > 0.8
                  p(j,k) = 0.8;
              end
          case 3
              if p(j,k) < 17
                  p(j,k) = 17;
              elseif p(j,k) > 28
                  p(j,k) = 28;
              end
          case 4
              if p(j,k) < 7.3
                  p(j,k) = 7.3;
              elseif p(j,k) > 8.3
                  p(j,k) = 8.3;
              end
          case 5
              if p(j,k) < 7.3
                  p(j,k) = 7.3;
              elseif p(j,k) > 8.3
                  p(j,k) = 8.3;
              end
          case 6
              if p(j,k) < 2.9
                  p(j,k) = 2.9;
              elseif p(j,k) > 3.9
                  p(j,k) = 3.9;
              end
          case 7
              if p(j,k) < 5
                  p(j,k) = 5;
              elseif p(j,k) > 5.5
                  p(j,k) = 5.5;
              end
          otherwise
      end
   end

end    

pop = [pop ; p];

end