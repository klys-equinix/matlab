function [val] = Newton(X, Y)
    n = length(X);
    prev_fis = Y;
    A = zeros(1, n);
    curr_fis = zeros(1, n);
    for i=1:n
        A(i) = prev_fis(i);
        for j=i+1:n
            curr_fis(j) =  (prev_fis(j) - prev_fis(i)) / (X(j) - X(i));
        end
        prev_fis = curr_fis;
    end
    polyval = [1 -X(1)];
    val = zeros(1, n);
    val(n) = A(1);
    for i=2:n
        %[zeros(1, length(val)-length(polyval))  A(i).*polyval]
        val = val + [zeros(1, length(val)-length(polyval))  A(i).*polyval];
        polyval = conv(polyval, [1 -X(i)]);
    end
    val;
end