function test
    close all;
    [A B] = euler_system_solver(0, [0; 1], 0.001, 10000, @derivs);
    [C D] = heune_system_solver(0, [0; 1], 0.001, 10000, @derivs);
    exact_values = sin(A);
    
    plot(A, sin(A), A, B(1, :), 'o', C, D(1, :), 'x')
    legend('funkca sin(x)', 'metoda eulera', 'metoda Heune');
end