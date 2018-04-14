function newton(f, fd, x, stage)
    for i=1:stage
        x = x - calc_func_val(f, x) / calc_func_val(fd, x);
    end
    x
end