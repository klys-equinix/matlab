function [res] = combined_integr(Y, h, d)
    res = 0;
    width = d + 1;
    rest = rem(length(Y), width);
    for i = width:d:(length(Y) - rest)
        res = res + integr(Y(i-d:i), h);
    end
    degree = length(Y) - i;
    if 0 < degree && degree < 5
        res = res + integr(Y((end-degree):end), h);
    end
end