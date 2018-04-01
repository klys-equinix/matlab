function [A] = matrix_reverse(A)
    n = length(A);
    for k=1:n
        for i=1:n
            if i ~= k
                A(i, k) = A(i, k) / A(k, k);
            end
        end
        for i=1:n
            for j=1:n
                if j ~= k && i ~= k 
                    A(i, j) = A(i, j) - A(i, k) * A(k, j);
                end
            end
        end
        for j=1:n
            if j ~= k
                A(k, j) = -A(k, j) / A(k, k);
            end
        end
        A(k, k) = 1 / A(k, k);
    end
    A
end