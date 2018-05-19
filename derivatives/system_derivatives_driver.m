function system_derivatives_driver()
    y = zeros(1, 2);
    y(1) = 0;
    y(2) = 1;
    x = 0;
    h = 0.01;
    steps = 10 / h;
    plot(x,y(1),'*');
    hold on;
    for i = 1:steps
        dy(2) = -y(1);
        dy(1) = y(2);
        y = y + h*dy;
        x = x + h;
        plot(x,y(1),'*');
        plot(x,cos(x),'r.');
    end
end