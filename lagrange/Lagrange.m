function Lagrange(X, Y)
    n = length(X);
    polynomial = zeros(1, n);
    for j=1:n
        polynomial = polynomial + Y(j).*LagrangePoly(X, j);
    end
    polynomial
end