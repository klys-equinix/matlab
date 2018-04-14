function [L, R, b, P] = lu_dist_croute(A, b, P)
    n = size(A);
    L = zeros(n);
    R = zeros(n);
    L(1:1+size(L,1):end) = 1;
    for k=1:n(1)
%         [i, j] = find(A == max(A(k:end, k)));
%         A([k i],:) = A([i k],:);
%         P([k i],:) = P([i k],:);
%         b([k i],:) = b([i k],:);
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
end