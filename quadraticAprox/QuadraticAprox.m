function quadraticAprox(X, Y, grade)
    m = length(X);
    A = zeros(grade, 1);
    Left = zeros(grade, grade);
    Right = zeros(grade, 1);
    Left(1, 1) = m;
    first_run = true;
    for i=1:grade
        for j=1:grade
            if ~first_run
                Left(i, j) = sum(X.^(i + j -2));
            end
            first_run = false;
        end
        Right(i) = sum(Y.*(X.^(i - 1)));
    end
    Left
    Right
    A = Left\Right
                
end