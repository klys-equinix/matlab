function better_newton(F, x_val, stage)
    syms f(x) fd(x)
    f(x) = transform_into_sym(F);
    fd(x) = diff(f(x));
    for i=1:stage
        f_val = double(f(x_val));
        fd_val = double(fd(x_val));
        x_val = x_val - f_val / fd_val;
    end
    x_val
end