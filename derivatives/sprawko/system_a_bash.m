function [X N] = system_a_bash(x_zero, y, h, steps, derivs_handle, grade)
    BETA = [1 0 0 0 0; 
            3/2 -1/3 0 0 0; 
            23/12 -16/12 5/12 0 0; 
            55/24 -59/24 37/24 -9/24 0;
            1901/720 -2774/720 2616/720 -1274/720 251/720];
    N = zeros(length(y), steps);
    X = zeros(1, steps);
    [X N] = euler_system_solver(x_zero, y, h, grade - 1, derivs_handle);
    
    for i = grade:steps
        sub_sum = 0;
        for j=1:grade
            sub_sum = sub_sum + BETA(grade, j) .* feval(derivs_handle, X(i - j + 1), N(:, i - j + 1));
        end
        N(:, i+1) = N(:, i) + h * sub_sum;
        X(i+1) = X(i) + h;
    end
    plot(X, N)
end