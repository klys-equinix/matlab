function lu_solver(path)
    d = load(path);
    A = d.A;
    b = d.b;
    n = length(A);
    P = zeros(n, n);
    for l = 1:n
        P(l, l) = 1;
    end
    [L, R, b, P] = lu_dist_croute(A, b, P);
    Y = zeros(1, n);
    X = zeros(1, n);
    for i=1:n
        Y(i) = (b(i) - sum(L(i, 1:i-1) .* Y(1:i-1))) / L(i, i);
    end
    
    for i=n:-1:1
        X(i) = (Y(i) - sum(R(i, i+1:n) .* X(i+1:n))) / R(i, i);
    end
    E = norm(A * X' - b)
    err = sum(sum(abs(P*A - L * R)))
end 