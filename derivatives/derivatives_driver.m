function derivatives_driver()
    funct = @(x, y) 3 * x * y^2;
    [X N] = adam_bashforth(funct, 1, 0.5, 0.1, 4, 3)
    X 
    N
end