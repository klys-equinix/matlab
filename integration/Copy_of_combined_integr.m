function [res] = combined_integr(Y, h, d)
    res = 0;
    switch d
        case 1
            res = sum(Y .* h);
        case 2
            rest = rem(length(Y), 2);
            for i=2:(length(Y) - rest)
                res = res + integr(Y(i-1:i), h);
            end
            if rest ~= 0
                res = res + integr(Y(end), h);
            end
        case 3
            rest = rem(length(Y), 3);
            for i=3:(length(Y) - rest)
                res = res + integr(Y(i-2:i), h);
            end
            if rest == 1
                res = res + integr(Y(end), h);
            elseif rest == 2
                res = res + integr(Y(end-1:end), h);
            end
        case 4
            rest = rem(length(Y), 4);
            for i=4:(length(Y) - rest)
                res = res + integr(Y(i-3:i), h);
            end
            if rest == 1
                res = res + integr(Y(end), h);
            elseif rest == 2
                res = res + integr(Y(end-1:end), h);
            elseif rest == 3
                res = res + integr(Y(end-2:end), h);
            end
        otherwise
            res = NaN
    end
end