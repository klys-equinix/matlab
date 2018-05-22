function predict_correct(x_zero, y, h, steps, derivs_handle, grade)

    BETA_MOULTON = [1 0 0 0 0; 
            1/2 1/2 0 0 0; 
            5/12 8/12 -1/12 0 0; 
            9/24 19/24 -5/24 1/24 0;
            251/720 646/720 -264/720 106/720 -19/720];
    BETA = [1 0 0 0 0; 
            3/2 -1/2 0 0 0; 
            23/12 -16/12 5/12 0 0; 
            55/24 -59/24 37/24 -9/24 0;
            1901/720 -2774/720 2616/720 -1274/720 251/720];
    N = zeros(length(y), steps);
    X = zeros(1, steps);
    [X N] = euler_system_solver(x_zero, y, h, grade - 1, derivs_handle);
    
    for i = grade:steps
        sum_bash = 0;
        
        
%         Predyktor
        for j=1:grade
            sum_bash = sum_bash + BETA(grade, j) .* feval(derivs_handle, X(i - j + 1), N(:, i - j + 1));
        end
        N(:, i+1) = N(:, i) + h * sum_bash;
        X(i+1) = X(i) + h;
        
        
%         Korektor

          for m=1:2
              sum_mul = 0;
              for j=1:grade
                  sum_mul = sum_mul + BETA_MOULTON(grade, j) .* feval(derivs_handle, X(i - j + 2), N(:, i - j + 2));
              end
              N(:, i+1) = N(:, i) + h * sum_mul;
          end
        
        
    end
    exact_values = sin(X);
    err = max(abs(N(1, :) - exact_values))
    plot(X(1, :), exact_values, X(1, :), N(1, :), 'o')
    legend('wartosc dokladna', 'predyktor-korektor')
end