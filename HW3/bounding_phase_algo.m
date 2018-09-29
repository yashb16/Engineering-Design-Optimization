function [a_left, a_right] = bounding_phase_algo(x0, S, a)

x(:,1) = x0;

alpha(1) = a;

step_size = 0.01;

k = 1;

del = abs(step_size);
% delta is assigned the absolute value of step_size

% Checking whether the function is increasing or decreasing
if (objF(x(:,1) - del*S) >= objF(x(:,1))) && (objF(x(:,1)) >= objF(x(:,1) + del*S))
    disp('Step size is positive');
    step_size = del;
elseif (objF(x(:,1) - del*S) <= objF(x(:,1))) && (objF(x(:,1)) <= objF(x(:,1) + del*S))
    disp('Step size is negative');
    step_size = -1*del;
else
    disp('Input smaller value of step_size');
    disp( 'xleft =  x(1) - abs(step_size)');
    a_left = x(:,1) - del*S;
    disp('xleft =  x(1) + abs(step_size)');
    a_right = x(:,1) + del*S;
    return
end
% if increasing, step_size is positive
% if decreasing, step_size is negative

while k > 0

    x(:,k+1) = x(:,k) + alpha(k).*S;
    alpha(k+1) = alpha(k) + (2^(k-1))*step_size;
    % Since the matrix indices start with 1 as compared to 0 that was taken in
    % class, 2 is raised to k-1 to compensate.
    
    f_new = objF(x(:,k+1));
    f_old = objF(x(:,k));
    
    if f_new <= f_old
        k = k + 1;
        continue
    else
        if step_size > 0
            a_left = alpha(k-1);
            a_right = alpha(k+1);
        elseif step_size < 0
            a_left = alpha(k+1);
            a_right = alpha(k-1);
        end
        
        break
    end
    
end

end