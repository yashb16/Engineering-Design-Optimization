function [m, f] = penalty(x , m , rp , i)

g = constraints(x);
psi = zeros(length(g) , 1);
% 
sum = 0;
% 
for j = 1:length(g)
    
    psi(j) = max(g(j) , 0);
    sum = sum + psi(j);
    
end
[m ,fun] = objF(x , m);

f = fun + rp*sum;

% C = (0.5*i)^2;
% 
% for j = 1:length(g)
%     
%     q(j) = max(g(j) , 0);
%     if g(j) <= 1
%         gamma(j) = 1;
%     else 
%         gamma(j) = 2;
%     end
%     psi(j) = 150*(1 - (1/exp(q(j)))) + 10; 
%     
%     H = sum + (psi(j)*q(j)^gamma(j));
%     
% end
% 
% [m ,fun] = objF(x , m);
% 
% f = fun + C*H;

end