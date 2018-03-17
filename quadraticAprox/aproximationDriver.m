function aproximationDriver(file, grade)
    file_content = load(file);
    X = file_content.s(1:end, 1);
    Y = file_content.s(1:end, 2);
    polynomial = quadraticAprox(X', Y', grade);
    xx = linspace(min(X), max(X), 100);
    yy = calc_polynomial(xx, polynomial);
    plot(X, Y, 'o', xx, yy, 'r');
end