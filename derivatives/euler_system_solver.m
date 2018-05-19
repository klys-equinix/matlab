function [X N] = euler_system_solver(x_zero, y, h, steps, derivs_handle)
    N = zeros(length(y), steps);
    X = zeros(1, steps);
    N(:, 1) = y;
    X(1) = x_zero;
    for i=1:steps
        dy = feval(derivs_handle, X(i), y);
        y = y + dy*h;
        X(i+1) = X(i) + h;
        N(:, i+1) = y;
    end
    plot(X, N)
end