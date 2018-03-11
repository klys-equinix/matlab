function [y] = calculate_czebyszew(ordinal, x)
    if ordinal == 0
        y = 1;
    elseif ordinal == 1
        y = x;
    else
        y = 2 * x * calculate_czebyszew(ordinal - 1, x) - calculate_czebyszew(ordinal - 2, x);
    end
end