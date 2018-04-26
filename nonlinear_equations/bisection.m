function [m, y] = bisection(f, a, b, steps, e)
    f_val = 0;
    iter = 1;
    errors = zeros(1, steps);
    while abs(a - b) > e && iter < steps
        m = (a + b) / 2;
        f_val = calc_func_val(f, m);
        if f_val * calc_func_val(f, a) < 0
            b = m;
        else
            a = m;
        end
        errors(iter) = abs(a - b);
        iter = iter + 1;
    end
    %plot(1:iter, log10(errors(1:iter)))
    %xlabel('numer iteracji')
    %ylabel('log10(wartość błędu)')
    %grid on
    errors(1:iter)
    m
    y = calc_func_val(f, m);
end