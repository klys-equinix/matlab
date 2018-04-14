function retarded_falsi(f, a, x, stage)
    X = zeros(1, stage);
    X(1) = x;
    next_x = @(X, i) (X(i - 1) * calc_func_val(f, X(i)) - X(i) * calc_func_val(f, X(i -1))) / (calc_func_val(f, X(i)) - calc_func_val(f, X(i -1)));
    X(2) = a;
    for i=2:stage + 1
        X(i + 1) = next_x(X, i);
    end
    X
end