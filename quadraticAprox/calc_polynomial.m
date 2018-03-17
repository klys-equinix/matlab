function [y] = calc_polynomial(x, polynomial)
   n = length(polynomial);
   y = 0;
   for j=1:n
       y = y + polynomial(j) * x^(j - 1);
   end
end