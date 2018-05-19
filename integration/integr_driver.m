function integr_driver
    f = @(x) 11 * x.^10;
    X = -1:0.01:1
    Y = f(X);
%     plot(X, Y)
    combined_integr(Y, 0.01, 1)
    combined_integr(Y, 0.01, 2)
    combined_integr(Y, 0.01, 3)
    combined_integr(Y, 0.01, 4)

     solutions = zeros(4, 1000);
     
     for d=1:4
         for i=1:1000
             num_points = d * i + 1;
             h = 2 / (num_points - 1);
             Y = f(-1:h:1);
             solutions(d, i) = combined_integr(Y, h, d);
         end
     end
     
     loglog([1:1000], abs(solutions(1, :) - 2.0),...
           [1:1000], abs(solutions(2, :) - 2.0),...
           [1:1000], abs(solutions(3, :) - 2.0),...
           [1:1000], abs(solutions(4, :) - 2.0))
     legend('1', '2', '3', '4')
     ylabel('Błąd bezwględny')
     xlabel('i')
        grid on
     solutions(:, end-10:end)
end