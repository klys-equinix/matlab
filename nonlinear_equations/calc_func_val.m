function [y] = calc_func_val(f, x)
    pow = length(f);
    y = 0;
    for n=1:pow
        y = y + f(n) * x ^ (pow - n);
    end
end