function [L, R] = lu_dist(A)
    n = size(A);
    L = zeros(n);
    R = zeros(n);
    L(1:1+size(L,1):end) = 1;
    for k=1:n(1)
        for i=k:n(1)
            R(k, i) = A(k, i) - sum(L(k, 1:k-1) .* R(1:k-1, i)');
        end
        for i=k+1:n(1)
            L(i, k) = (A(i, k) - sum(L(i, 1:k-1) .* R(1:k-1, k)')) / R(k, k);
            if R(k, k) == 0
                k
                L(i, k)
                R
            end
        end
    end
    L, R
end