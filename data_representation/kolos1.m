[num txt raw] = xlsread('euro_energy_2.xls');

num = num(9:36, 2:2:end); % usuwamy pierwszą kolumnę (same NaN)
kraje = txt(9:36,1); % nazwy państw
lata = txt(4, 2:2:24); % lata

d = array2table(num); % konwersja na postac tabeli
d.Properties.RowNames = kraje;
lata2 = strrep(lata,'20','rok_20');
d.Properties.VariableNames = lata2;
% Najwyzsza cena ever
[i, j] = find(d{:, :} == max(max(d{:, :})));
% kraje(i)
% lata2(j)
disp('najwyzsza cena ever')
disp(d(i, j))
% Najniższa cena ever
[i, j] = find(d{:, :} == min(min(d{:, :})));
kraje(i)
lata2(j)

avg_prices = sum(d{:, :}, 2) ./ 12;
avg_ue = sum(avg_prices) / 28

biggest_countries = d({'France', 'Spain', 'Sweden', 'Germany', 'Finland', 'Poland'}, :);

avg_prices_big = sum(biggest_countries{:, :}, 2) ./ 12;
avg_big = sum(avg_prices_big) / 6

avg_pol = sum(d{'Poland', :}) / 12

kraje(avg_prices == max(avg_prices))

diff_prices = zeros(28, 11);

for i=2:12
    diff_prices(:, i - 1) = d{:, i - 1} -  d{:, i};
end
[r, c] = find(diff_prices == max(diff_prices(:)));

kraje(r)
lata2(c)
close all;
subplot(2,2,1);
plot(2005:2016, d{'Poland', :})
hold on;
plot(2005:2016, d{~ismember(kraje, 'Poland'), :})
subplot(2,2,2);
[dane ind] = sort(d{:, end}, 'descend');
c = categorical(kraje(ind));
barh(dane)
set(gca, 'YTick', 1:28)
set(gca,'yticklabel', kraje(ind))
inflation = d{:, 12} - d{:, 1};
subplot(2,2,3);
%Inflacja
pie([length(inflation(inflation < 0.1)) length(inflation((0.1 < inflation) & (inflation < 0.2))) length(inflation(inflation > 0.3))], {'a', 'b', 'c'}) 

% Podstawowe miary statystyczne

avg = [geomean(d{:, :}, 2) harmmean(d{:, :}, 2) mean(d{:, :}, 2) median(d{:, :}, 2) std(d{:,:}, 0, 2) var(d{:, :}, 0, 2) quantile(d{:, :}, .25, 2), quantile(d{:, :}, .5, 2)];

avg_tab = array2table(avg);
avg_tab.Properties.RowNames = kraje;
avg_tab.Properties.VariableNames = {'geo', 'harm', 'mean', 'med', 'std', 'var', 'q1', 'q2'};
avg_tab

a = zscore(d{:, :}); %Standardyzacja - chociaz tu to jest bez sensu jka mamy jeden atrybut - w standardyzacji chodzi o to aby różne atrybuty mialy ten sam zakres zmiennosci
% subplot(2,2,4);
% plot(2005:2016, a)

% Miary współzależności - sluza do pokazania powiazan miedzy roznymi
% atrybutami obiektow tej samej klasy - korelacja i kowariancja

% Wykresy analizy danych
subplot(2,2,4);
hist(reshape(d{:, :}, [1 12*28]))
