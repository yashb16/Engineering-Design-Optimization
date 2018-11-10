function xmin = ext_penalty(x0)

x(:,1) = x0;
rp = 1;
% len = length(x0);
% Ef = 0.0001;
% Ep = 0.0001;

% z = sym('z' , [1 len]);
% z = z';

for cycle = 1:6
    
    x(:,cycle+1) = powell_method(x(:,cycle) , rp)

%       x(:,cycle+1) = powell_method(x(:,cycle) , rp)

%     f1 = abs((objF(x(:,cycle+1)) - objF(x(:,cycle)))/objF(x(:,cycle)));
%     f2 = abs((pseudoF(x(:,cycle+1) , rp) - pseudoF(x(:,cycle+1) , rp))/pseudoF(x(:,cycle+1) , rp));
    
%     if f1 < Ef && f2 < Ep
%         L = length(x);
%         break;
%     end
    
    rp = rp*10;
    
    L = length(x);
end

xmin = x(:,L-1);

end