function Driver(from, to, num_nodes, linear_points, color, lagrange, plot_base)

interpolated_function = @(x) (1 + x.^2) ./ (1 + x.^6);
scale_czebyszew = @(x) ((x + 1)/2*(to - from)) + from;
if linear_points
    x = linspace(from, to, num_nodes);
else
    x = czebyszew(num_nodes);
    x = scale_czebyszew(x(1:end));
end
% x = linspace(from, to, num_nodes);
y = interpolated_function(x);
if lagrange
    polynomial = Lagrange(x, y);
else
    polynomial = Newton(x, y);
end
plot_points = 1000;
xx = linspace(from, to, plot_points);
yy = interpolated_function(xx);
if plot_base
    plot(xx, yy, 'g');
end
hold on;
plot_polynomial(xx, polynomial, color, yy);
plot(x, y, strcat('*', color));
legend('przebieg postawowy', 'przebieg dla 5', 'punkty dla 5', 'przebieg dla 9', 'punkty dla 9', 'przebieg dla 11', 'punkty dla 11');
% hold on;
% plot_polynomial(xx, polynomialN, color);