[num txt raw] = xlsread('imigracja.xls');

num = num(1:28, 2:end); % usuwamy pierwszą kolumnę (same NaN), wybieramy kraje euro
kraje = txt(7:34,1); % nazwy państw
lata = txt(4, 2:end); % lata

d = array2table(num); % konwersja na postac tabeli
d.Properties.RowNames = kraje;
lata2 = strrep(lata,'20','rok_20');
d.Properties.VariableNames = lata2;
% Nie pomijam krajow o niekomplenych danych - pomijam jedynie brakujace
% dane dla danej analizy - np stosuje nanmean

% Najwiecej imigrantow
[i, j] = find(d{:, :} == max(max(d{:, :})));
disp('najwyzsza liczba imigrantow')
disp(d(i, j))
% Najmniej imigrantow
[i, j] = find(d{:, :} == min(min(d{:, :})));
disp('najnizsza liczba imigrantow')
disp(d(i, j))

disp('Srednia imigracji dla kazdego roku')
nanmean(d{:, :})


disp('Srednia imigracji dla najwiekszych panstw w danym roku')
biggest_countries = d({'France', 'Spain', 'Sweden', 'Germany', 'Finland', 'Poland'}, :);

nanmean(biggest_countries{:, :})

disp('Srednia imigracja dla polski')
nanmean(d{'Poland', :})

avg_im = nanmean(d{:, :}, 2);
i = find(avg_im == max(avg_im));
disp('Kraj o max sredniej imigracji')
kraje(i)

diff_im = zeros(28, 11);

for i=2:12
    diff_im(:, i - 1) = d{:, i - 1} -  d{:, i};
end
[r, c] = find(diff_im == max(diff_im(:)));

disp('Kraj o najwiekszym wzroscie imigracji rok do roku')
d(r, c)

% Wykres liniowy imigracji w polsce i calej europie
close all;
subplot(2,2,1);
plot(2005:2016, d{'Poland', :})
hold on;
% Średnia dla krajow UE poza polska - skok jest spowodowany niekompletnymi
% danymi dla pierwszych lat dla wielu krajow
plot(2005:2016, nanmean(d{~ismember(kraje, 'Poland'), :}))
legend({'Poland', 'UE'})
title('Imigracja w Polsce i UE w latach 2005-2016')
ylabel('Liczba imigrantow')
xlabel('Lata')

% Wykres slupkowy wszystkich krajow w 2016 
subplot(2,2,2);
[dane ind] = sort(d{:, end}, 'ascend');
c = categorical(kraje(ind));
barh(dane)
set(gca, 'YTick', 1:28)
set(gca,'yticklabel', kraje(ind))
title('Imigracja w krajach UE w roku 2016')
xlabel('Liczba imigrantow')
ylabel('Kraje')
% Wykres ciastko (kolowy) dla roznych ilosci imigrantow w 2016
imigration = d{:, end};
subplot(2,2,3);
imigration_split = [length(imigration(imigration < 50001)) length(imigration((50001 < imigration) & (imigration < 100000))) length(imigration(imigration > 100000))];
pie(imigration_split, {['< 50000 = ' num2str(imigration_split(1))] , ['<50001, 100000> = ' num2str(imigration_split(2))], ['> 100000 = ' num2str(imigration_split(3))]})
title('Poziomy imigracji w UE w 2016')

