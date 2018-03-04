function cubic_driver(num_points)

runge = @(x) 1./(1+ 25*x.^2);

x = linspace(-1,1,num_points);
y = runge(x);
[s0,s1,s2,s3] = cubic_spline(x',y');

plot_points = 1000;
xx = linspace(-1,1,plot_points);
yy = runge(xx);

plot(xx,yy,'g');
hold on;
plot_spline(x,s0,s1,s2,s3);