function qudratic_aprox(X, Y, grade)
    m = length(X);
    scale_czebyszew = @(x) (2 * x - min(X) - max(X)) / (max(X) - min(X));
    A = zeros(grade, 1);
    Left = zeros(grade, grade);
    Right = zeros(grade, 1);
%     Non czebyszew
%     Left(1, 1) = m;
    first_run = true;
    
    %Czebyszew only
    X = scale_czebyszew(X(1:end));
    
    for i=1:grade
        for j=1:grade
%             Non Czebyszew
%             if ~first_run
%                 Left(i, j) = sum(X.^(i + j -2));
%             end
%             first_run = false;
            for k=1:m
                Left(i, j) = Left(i, j) + sum(calculate_czebyszew(i - 1, X(k)) .* calculate_czebyszew(j - 1, X(k)));
            end
        end
        for k=1:m
            Right(i) = Right(i) + sum(Y(k) * calculate_czebyszew(i - 1, X(k)));
        end
%       Non czebyszew
        %Right(i) = sum(Y.*(X.^(i - 1)));
    end
    Left
    Right
    A = Left\Right
                
end