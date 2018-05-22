function [X N] = heune_system_solver(x_zero, y, h, steps, derivs_handle)
    N = zeros(length(y), steps);
    X = zeros(1, steps);
    N(:, 1) = y;
    X(1) = x_zero;
    for i=1:steps
        X(i+1) = X(i) + h;
        dy_first = feval(derivs_handle, X(i), y);
        y_first = y + dy_first*h;
        dy_second = feval(derivs_handle, X(i+1), y_first);
        y = y + 0.5*h * (dy_first + dy_second);
        N(:, i+1) = y;
    end
end