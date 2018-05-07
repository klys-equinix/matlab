function [res] = combined_integr(Y, h, d)
    res = 0;
    switch d
        case 1
            rest = rem(length(Y), 2);
            for i=2:(length(Y) - rest)
                res = res + simple_integr(Y(i-1:i), h, 1);
            end
            if rest ~= 0
                res = res + simple_integr(Y((end-rest):end), h, rest - 1);
            end
        case 2
            rest = rem(length(Y), 3);
            for i=3:(length(Y) - rest)
                res = res + simple_integr(Y(i-2:i), h, 2);
            end
            if rest ~= 0
                res = res + simple_integr(Y((end-rest):end), h, rest - 1);
            end
        case 3
            rest = rem(length(Y), 4);
            for i=4:(length(Y) - rest)
                res = res + simple_integr(Y(i-3:i), h, 3);
            end
            if rest ~= 0
                res = res + simple_integr(Y((end-rest):end), h, rest - 1);
            end
        case 4
            rest = rem(length(Y), 5);
            for i=5:(length(Y) - rest)
                res = res + simple_integr(Y(i-4:i), h, 4);
            end
            if rest ~= 0
                res = res + simple_integr(Y((end-rest):end), h, rest - 1);
            end
        otherwise
            res = NaN
    end
end