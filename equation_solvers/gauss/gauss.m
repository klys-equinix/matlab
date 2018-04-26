function [A, Y] = gauss(A, Y, row)
    size = length(A);
%    [i, j] = find_max_val(A, row);
%    A([row i],:) = A([i row],:);
%    Y([row i],:) = Y([i row],:);
%    A(:,[row j]) = A(:,[j row]);
    for k = row + 1:size
        div_val = A(k, row)/A(row, row);
        A(k, :) = A(k, :) - div_val .* A(row, :);
        Y(k, 1) = Y(k, 1) - Y(row, 1) .* div_val;
    end
end