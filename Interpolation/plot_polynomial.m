function plot_polynomial(xx, polynomial, color)
   n = length(polynomial);
   yy = zeros(1, length(xx));
   for i=1:length(xx)
       for j=1:n
           yy(i) = yy(i) + polynomial(j) * xx(i)^(n - j);
       end
   end
   plot(xx, yy, color);
end