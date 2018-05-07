function [X N] = euler_met(funct, x_zero, y_zero, h, num_points)
    X = zeros(1, num_points);
    N = zeros(1, num_points);
    X(1) = x_zero;
    N(1) = y_zero;
    for i=2:num_points + 1
        X(i) = X(i - 1) + h;
        N(i) = N(i - 1) + h * funct(X(i - 1), N(i - 1));
    end
end