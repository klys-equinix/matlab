function [f] = transform_into_sym(F)
    pow = length(F);
    syms f(x)
    func_expression = 'f(x) =';
    for n=1:pow - 1
        func_expression = strcat(func_expression, num2str(F(n)), '*x^', num2str((pow - n)), ' +');
    end
    func_expression = strcat(func_expression, num2str(F(pow)));
    eval(func_expression)
    f = formula(f(x));
end