function [xleft, xright] = bounding_phase_algo(x0, step_size)

x(1) = x0;

k = 1;

del = abs(step_size);
% delta is assigned the absolute value of step_size

% Checking whether the function is increasing or decreasing
if (objF(x(1) - del) >= objF(x(1))) && (objF(x(1)) >= objF(x(1) + del))
    disp('Step size is positive');
    step_size = del;
elseif (objF(x(1) - del) <= objF(x(1))) && (objF(x(1)) <= objF(x(1) + del))
    disp('Step size is negative');
    step_size = -1*del;
else
    disp('Input smaller value of step_size');
    disp( 'xleft =  x(1) - abs(step_size)');
    xleft = x(1) - del;
    disp('xleft =  x(1) + abs(step_size)');
    xright = x(1) + del;
    return
end
% if increasing, step_size is positive
% if decreasing, step_size is negative

while k > 0
    
    x(k+1) = x(k) + (2^(k-1))*step_size;
    % Since the matrix indices start with 1 as compared to 0 that was taken in
    % class, 2 is raised to k-1 to compensate.
    
    if objF(x(k+1)) < objF(x(k))
        k = k + 1;
        continue
    else
        if step_size > 0
            xleft = x(k-1);
            xright = x(k+1);
        elseif step_size < 0
            xleft = x(k+1);
            xright = x(k-1);
        end
        
        break
    end
    
end

syms z

y = objF(z);
% Using a new variable name to avoid confusion
fplot(z , y, [-1 4])
hold on

plot([xleft xleft] , [0 2100], '--r')
text(xleft-0.3, 1520,'xleft')
hold on

plot([xright xright] , [0 2100], '--r')
text(xright-0.2, 1520,'xright')

xlabel('x')
ylabel('y')
title('Objective Function')
end