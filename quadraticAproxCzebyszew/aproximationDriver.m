function aproximationDriver(file, grade)
     file_content = load(file);
     X = file_content.s(1:end, 1);
     Y = file_content.s(1:end, 2);
%     polynomial = quadraticAprox(X', Y', grade);
%     X = [0 0.5 1 1.5 2];
%     Y =[0 0.19 0.26 0.29 0.31];
    polynomial = quadraticAprox(X', Y', grade)';
    scale_czebyszew = @(x) (2 * x - min(X) - max(X)) / (max(X) - min(X));
    xx = linspace(min(X), max(X), 100);
    yy = zeros(1, 100);
    for i=1:100
        yy(i) = calc_polynomial(scale_czebyszew(xx(i)), polynomial);
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