function minima = powell_method(x0)

x(:,1) = x0;

% Ex = 0.0001;

% d = length(x0);

S = zeros(length(x0) , length(x0) + 1);
S_len = length(S);
% Defining the Search vector
% Stored in a matrix form for easier accessibility

for i = 1:length(x0)
    S(i,i) = 1;
end
% 1st n search directions will be along the n orthogonal unit vectors

for cycle = 1:2
   
   x_temp = x(:,cycle);
%    This is the value of x at the intermediate steps within the cycle.
%    
   
   for j = 1:(S_len- 1)
      x_curr = x_temp
      search_dir = S(:,j)
%       subplot(4,2,j)
      alpha_star = gold_section(x_temp, S(:,j))
%       Alpha star calculated using the 1D search algorithm - Golden
%       Section
      x_temp = x_temp + alpha_star*S(:,j);
      x_update = x_temp
%       Updated x
   end
   
   S(:,S_len) = x_temp - x(:,cycle);
%    Conjugate search direction added to the last column of the matrix
   
   x_curr = x_temp
   search_dir = S(:,S_len)
   alpha_star = gold_section(x_temp, S(:,S_len))
   x(:,cycle+1) = x_temp + alpha_star*S(:,S_len)
%    Updated x based on the conjugate search direction
   
   S
   
%    New Search matrix for the 2nd cycle
   for r = 1:S_len-1
       S(:,r) = S(:,r+1);
   end
   
   
end

minima = x(:,length(x));

end