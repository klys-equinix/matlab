function muller_v2(F, x_val, stage)
    syms f(x) fd(x) fdd(x)
    f(x) = transform_into_sym(F);
    fd(x) = diff(f(x));
    fdd(x) = diff(fd(x));
    for i=1:stage
        f_val = double(f(x_val));
        fd_val = double(fd(x_val));
        fdd_val = double(fdd(x_val));
        x_val_1 = (x_val - (f_val - sqrt(fd_val^2 - 2 * f_val * fdd_val))) / fdd_val;
        x_val_2 = (x_val + (f_val - sqrt(fd_val^2 - 2 * f_val * fdd_val))) / fdd_val;                                                
        x_val = min(abs([x_val_1 x_val_2]))
    end
end