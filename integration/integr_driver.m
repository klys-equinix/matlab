function integr_driver
    f = @(x) 11 * x.^10;
    X = linspace(-1, 1, 201);
    Y = f(X);
    plot(X, Y)
    simple_integration(Y, 0.01, 2)
  
end