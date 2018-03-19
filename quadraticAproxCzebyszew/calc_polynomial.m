function [y] = calc_polynomial(x, polynomial)
   n = length(polynomial);
   y = 0;
   for i=1:n
       y = y + calculate_czebyszew(i - 1, x) * polynomial(i);
   end
end