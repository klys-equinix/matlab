function plot_polynomial(xx, polynomial, color, results)
   n = length(polynomial);
   yy = zeros(1, length(xx));
   for i=1:length(xx)
       for j=1:n
           yy(i) = yy(i) + polynomial(j) * xx(i)^(n - j);
       end
   end
   plot(xx, yy, color)
   error = abs(results - yy);
   disp('max');
   disp(max(error));
   disp('mean');
   disp(mean(error));
end