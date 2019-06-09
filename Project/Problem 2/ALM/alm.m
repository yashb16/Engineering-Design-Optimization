function [m , xmin] = alm(x0)

x(:,1) = x0;
rp = 1000000;
count = 0;
cycle = 1;
Ex = 0.01;
m = [count , 0];
[m , ~] = objF(x0 , m);
fcount_prev = 0;

%%%%%%%%%%% Calculating lambda based on grad(g)*grad(F) sign %%%%%%%%%%%%
syms z1 z2 z3 z4 z5 z6 z7
z = [z1;z2;z3;z4;z5;z6;z7];
g = constraints(z);
% gradG = zeros(length(g),1);
for c = 1:length(g)
   
    gradG(c,:) = gradient(g(c),z);
    
end
fgrad = gradF(z);
lambda = zeros(length(g) , 1);

for k = 1:length(g)
    
   f1 = subs(gradG(k,:) , z , x(:,1));
   f2 = subs(fgrad , z , x(:,1));
   
   if f1*f2 < 0
      lambda(k,1) = 1;
   elseif f1*f2 > 0
       lambda(k,1) = -1;
   else 
       lambda(k,1) = 0;
   end
    
end


%%%%%%%%%%%%%% end of lambda calculations %%%%%%%%%%%%%%%%%

while true
    
    lambda(:,cycle);
    
    % Evaluating current value of constraints and psi
    g(:,cycle) = vpa(constraints(x(:,cycle)))
    psi = max(g(:,cycle) , -lambda(:,cycle)/(2*rp));

    
    fun = @(y) augF(y , m , lambda(:,cycle) , rp);
    [x(:,cycle+1)] = fminunc(fun, x(:,cycle));
    [m , ~] = objF(x(:,cycle+1) , m);
    % update x
%     [m ,x(:,cycle+1)] = bfgs(x(:,cycle) , lambda(:,cycle) , rp , m);
%     i = 1;
%     while true
%     
%         options = optimoptions(@fminunc,'Display','iter' , 'MaxIter', i);
%         [fun] = @(y) augF(y , m , lambda(:,cycle) , rp);
%         [x(:,cycle+1) , fval(i) , ~ , output] = fminunc(fun, x(:,cycle),options);
%         [r,~] = size(m);
%         count = fcount_prev + output.funcCount;
%         m(r+1,:) = [count , fval(i)];
%         if i > 2
%        
%             if abs(fval(i) - fval(i-1)) < 0.01
%                 fcount_prev = count;  
%                 break;
%             end
%         
%         end
%     
%         i = i+1;
% 
%     end


% update lambda
    for k = 1:15
        lambda(k,cycle+1) = lambda(k,cycle) + 2*rp*psi(k);
    end
    
    flag = true;
    for a = 1:length(g(:,cycle))
       if g(a,cycle) <= 0
          flag = flag && true;
       else
           flag = flag && false;
       end
    end
    
    if (norm(x(:,cycle+1)-x(:,cycle))<=Ex) && augF(x(:,cycle+1), m, lambda(:,cycle+1) , rp ) - augF(x(:,cycle),m, lambda(:,cycle) , rp ) < Ex && flag
        break
    end
   
    cycle = cycle + 1
    
end

xmin = x(:,cycle+1)

end