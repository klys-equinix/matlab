function aproximationDriver(file, grade)
    file_content = load(file);
    X = file_content.s(1:end, 1);
    Y = file_content.s(1:end, 2);
    polynomial = quadraticAprox(X', Y', grade);
    xx = linspace(min(X), max(X), 100);
    yy = zeros(1, 100);
    for i=1:100
        yy(i) = calc_polynomial(xx(i), polynomial);
    end
    error = 0;
    for i=1:length(X)
        error = error + (calc_polynomial(X(i), polynomial) - Y(i))^2;
    end
    error = error / length(X);
    disp('error');
    error
    plot(X, Y, 'o', xx, yy, 'r');
end