function gauss_driver(A, Y)
    n = size(A);
    for index = 1:n(1, 1)
        [A, Y] = gauss(A, Y, index);
    end
    x_index = 1;
    X = zeros(1, n(1, 1));
    A, Y
    for rev_index = n(1,1):-1:1
        X(x_index) = (Y(rev_index) - sum(X(1:x_index) .* A(rev_index, n:-1:rev_index))) / A(rev_index, rev_index);
        x_index = x_index + 1;
    end
    X'
end