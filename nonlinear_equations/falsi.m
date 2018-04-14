function falsi(f, a, x, stage)
    mi = @(x, a) (a * calc_func_val(f, x) - x * calc_func_val(f, a)) / (calc_func_val(f, x) - calc_func_val(f, a));
    for i=1:stage
        m = mi(a, x);
        fm = calc_func_val(f, m);
        fx = calc_func_val(f, x);
        if (fm * fx) > 0
            x = m;
        else
            a = m;
        end
    end
    m
end