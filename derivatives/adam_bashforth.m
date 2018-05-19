function [X N] = adam_bashforth(funct, x_zero, y_zero, h, num_points, grade)
    BETA = [1 0 0 0 0; 
            3/2 -1/3 0 0 0; 
            23/12 -16/12 5/12 0 0; 
            55/24 -59/24 37/24 -9/24 0;
            1901/720 -2774/720 2616/720 -1274/720 251/720];
    X = zeros(1, num_points);
    N = zeros(1, num_points);
    [X N] = heune_met(funct, x_zero, y_zero, h, grade - 1);
    
    for i = grade + 1:num_points + 1
        X(i) = X(i - 1) + h;
        sub_sum = 0;
        for j=1:grade
            sub_sum = sub_sum + BETA(grade, j) * funct(X(i - j), N(i - j));
        end
        N(i) = N(i - 1) + h * sub_sum;
    end
end