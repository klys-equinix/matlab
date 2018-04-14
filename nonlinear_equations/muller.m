function muller(f, fd, fdd, x, stage)
    for i=1:stage
        x = x - (calc_func_val(f, x) - sqrt(calc_func_val(fd, x)^2 - 2 * calc_func_val(f, x) * calc_func_val(fdd, x))) / calc_func_val(fdd, x);
    end
    x
end