function [L, U] = lu_dist_row(A)
    n = length(A);
    for k=1:n-1
        A(k, k+1:end) = A(k, k+1:end) ./ A(k, k);
        display('first step')
        A
        for j=k+1:n
            for i=k+1:n
                A(j, i) = A(j, i) - A(j, k)*A(k, i);
            end
        end
        display('second step')
        A
    end
    A
end