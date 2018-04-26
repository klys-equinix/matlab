function [x, y] = newton(f, fd, x, stage, e)
    format long
    iter = 1;
    errors = zeros(1, stage);
    while iter < stage && abs(calc_func_val(f, x)) > e
        x = x - calc_func_val(f, x) / calc_func_val(fd, x);
        errors(iter) = abs(calc_func_val(f, x));
        iter = iter + 1;
    end
    plot(1:iter, log10(errors(1:iter)))
    xlabel('numer iteracji')
    ylabel('log10(wartość błędu)')
    grid on
    errors(1:iter)
    x
    y = calc_func_val(f, x);
end