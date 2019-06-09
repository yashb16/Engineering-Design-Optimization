function [a_left, a_right , m] = bounding_phase_algo(x0, S, a , l , rp , m)

x(:,1) = x0;

alpha(1) = a;

step_size = 0.01;

k = 1;

del = abs(step_size);
% delta is assigned the absolute value of step_size
[m, f1] = augF(x(:,1) - del*S , m , l ,rp);
[m, f2] = augF(x(:,1), m , l , rp);
[m, f3] = augF(x(:,1) + del*S , m , l ,rp);
% Checking whether the function is increasing or decreasing
if (f1 >= f2) && (f2 >= f3)
    disp('Step size is positive');
    step_size = del;
elseif (f1 <= f2) && (f2 <= f3)
    disp('Step size is negative');
    step_size = -1*del;
else
%     disp('Input smaller value of step_size');
%     disp( 'xleft =  x(:,1) - abs(step_size)');
    a_left = a-del;
%     disp('xleft =  x(:,1) + abs(step_size)');
    a_right = a+del;
    return
end
% if increasing, step_size is positive
% if decreasing, step_size is negative

while k > 0

    x(:,k+1) = x(:,k) + alpha(k).*S;
    alpha(k+1) = alpha(k) + (2^(k-1))*step_size;
    % Since the matrix indices start with 1 as compared to 0 that was taken in
    % class, 2 is raised to k-1 to compensate.
    
    [m ,f_new] = augF(x(:,k+1) , m, l , rp);
    [m ,f_old] = augF(x(:,k) , m, l , rp);
    
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