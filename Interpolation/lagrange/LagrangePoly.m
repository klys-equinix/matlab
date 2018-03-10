function [coeffs] = LagrangePoly(X, index)
    n = length(X);
    coeffs = zeros(1, n);
    div_val = 1;
    first_iter = 1;
    for i=1:n
        if i~=index
            div_val = div_val * (X(index) - X(i));
            poly = [1 -X(i)];
            if first_iter == 1
                coeffs = poly;
                first_iter = 0;
            else
                coeffs = conv(coeffs, poly);
            end
        end
    end
    coeffs = coeffs./div_val;
end

