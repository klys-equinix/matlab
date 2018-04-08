function [L] = cholesky_dist(A)
    n = length(A);
    L = zeros(n, n);
    A
    for k=1:n
        L(k, k) = sqrt(A(k, k) - sum(L(k, 1:k-1).^2));
        for i=1:n
            if i ~= k
                L(i, k) = 1 / L(k, k) * (A(i, k) - sum(L(i, 1:k-1) .* L(k, 1:k-1)));
            end
        end
    end
end