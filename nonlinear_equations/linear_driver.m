function linear_driver
    [x1, y1] = bisection([3.55 -1.1 -0.765 0.74], -1, 1, 100, 1e-10);
    [x2, y2] = newton([3.55 -1.1 -0.765 0.74], [10.65 -2.2 -0.765], (-1/300), 100, 1e-10);
    X = linspace(-1,1, 1000);
    Y = zeros(1, 1000);
    for i=1:1000
        Y(i) = calc_func_val([3.55 -1.1 -0.765 0.74], X(i));
    end
    plot(X, Y,  x1, y1, 'x', x2, y2, 'o')
    xlabel('x')
    ylabel('y')
    grid on
    legend('przebieg funkcji','bisekcja rozwiazanie', 'newton rozwiazanie')
end