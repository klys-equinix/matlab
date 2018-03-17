function [yy] = calc_polynomial(xx, polynomial)
   n = length(polynomial);
   yy = zeros(1, length(xx));
   for i=1:length(xx)
       for j=1:n
           yy(i) = yy(i) + polynomial(j) * xx(i)^(j - 1);
       end
   end
end