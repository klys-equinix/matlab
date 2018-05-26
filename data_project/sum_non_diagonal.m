function s = sum_non_diagonal(M)
    [x y] = size(M);
    s = 0;
    for i=1:x
        for j=1:y
            if i~=j
                s = s + M(i, j);
            end
        end
    end         
end