function [res] = integr(Y, step)
    res = 0;
    switch length(Y)
        case 1
            res = Y(1) * step;
        case 2
            res = (Y(2) + Y(1)) / 2 * step;
        case 3
            res = (Y(3) + 4*Y(2) + Y(1)) / 3 * step;
        case 4
            res = (Y(4) + 3*Y(3) + 3*Y(2) + Y(1)) * (3/8) * step;
        case 5
             res = (Y(5)*7 + 32*Y(4) + 12*Y(3) + 32*Y(2) + 7*Y(1)) * (2/45) * step;
        otherwise
            res = NaN
    end
end