function [x, y] = find_max_val(A, row)
    n = length(A);
    max_val = 0;
    x = row;
    y = 1;
    for i=row:n
        for j=1:n
            if(A(i, j) > max_val)
                max_val = A(i, j);
                x = i;
                y = j;
            end
        end
    end
end