[num txt raw] = xlsread('euro_energy_2.xls');

num = num(9:36, 2:2:end); % usuwamy pierwszą kolumnę (same NaN)
kraje = txt(9:36,1); % nazwy państw
lata = txt(4, 2:2:24); % lata

d = array2table(num); % konwersja na postac tabeli
d.Properties.RowNames = kraje;
lata2 = strrep(lata,'20','rok_20');
d.Properties.VariableNames = lata2;
[i, j] = find(d{:, :} == max(max(d{:, :})));
kraje(i)
lata2(j)
[i, j] = find(d{:, :} == min(min(d{:, :})));
kraje(i)
lata2(j)

avg_prices = sum(d{:, :}, 2) ./ 12;
avg_ue = sum(avg_prices) / 28

biggest_countries = d({'France', 'Spain', 'Sweden', 'Germany', 'Finland', 'Poland'}, :);

avg_prices_big = sum(biggest_countries{:, :}, 2) ./ 12;
abg_big = sum(avg_prices_big) / 6

avg_pol = sum(d{'Poland', :}) / 12

kraje(avg_prices == max(avg_prices))

diff_prices = zeros(28, 11);

for i=2:12
    diff_prices(:, i - 1) = d{:, i - 1} -  d{:, i};
end
[r, c] = find(diff_prices == max(diff_prices(:)));

kraje(r)
lata2(c)
