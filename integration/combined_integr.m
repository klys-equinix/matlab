function [res] = combined_integr(Y, h, d)
    res = 0;
    width = d + 1;
    rest = rem(length(Y), width);
    for i=width:d:(length(Y) - rest)
        res = res + integr(Y(i-d:i), h);
    end
    if 0 < rest < 5
        res = res + integr(Y((end-rest):end), h);
    else
        disp('scream')
    end
end