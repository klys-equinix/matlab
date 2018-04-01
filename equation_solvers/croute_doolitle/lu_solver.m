function lu_solver(A, b)
    n = length(A);
    [L, R] = lu_dist(A);
    Y = zeros(1, n);
    X = zeros(1, n);
    for i=1:n
        Y(i) = (b(i) - sum(L(i, 1:i-1) .* Y(1:i-1))) / L(i, i);
    end
    
    for i=n:-1:1
        X(i) = (Y(i) - sum(R(i, i+1:n) .* X(i+1:n))) / R(i, i);
    end
    Y, X
end 