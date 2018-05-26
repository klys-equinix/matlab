clear all;
close all;
load projekt4

disp('ilosc obiektow')
length(t{:, 1})

disp('klasy w t')
classes = unique(t{:, end})

disp('podstawowe miary dla poszczegolnych klas')
column_names = t.Properties.VariableNames(1:end-1);
means = array2table(zeros(4, 12));
means.Properties.VariableNames = column_names;
means.Properties.RowNames = [{'klasa1'}, {'klasa2'}, {'klasa3'}, {'klasa4'}];
for i=1:4
    disp(['klasa ' num2str(i)])
    
    m = array2table(zeros(4, 12));
    m.Properties.VariableNames = column_names;
    m.Properties.RowNames = [{'mean'}, {'median'}, {'std'}, {'var'}];
    
    m{1, :} = mean(t{t.klasa == i, 1:end-1});
    m{2, :} = median(t{t.klasa == i, 1:end-1});
    m{3, :} = std(t{t.klasa == i, 1:end-1});
    m{4, :} = var(t{t.klasa == i, 1:end-1});
    means{i, :} = m{1, :};
    covariance = cov(t{t.klasa == i, 1:end-1});
    correlation = corr(t{t.klasa == i, 1:end-1});

end
means
means_std = std(means{:, :})
means_total = mean(t{:, 1:end-1})
rel_std = means_std ./ means_total
attr_with_big_std = find(abs(rel_std) > 0.5);
% attr_with_big_std = find(means_std > 5);
disp('atrybuty o odchyleniu standardowym dla klas wiekszym niz 5')
attr_with_big_std

total_cov = cov(t{:, 1:end-1});
total_corr = corr(t{:, 1:end-1});

[x y] = find(abs(total_corr) > 0.5);
disp('pary atrybutow o wartosci bezwzglednej korelacji wiekszej niz 0.5')

for i=1:length(x)/2 + 1
    if x(i) ~= y(i)
        pair = [x(i) y(i)]
    end
end

disp('wybieram tylko te atrybuty ktore mocno roznia sie miedzy klasami')

disp('usuwam ze zbioru wybranych atrybutów 1 ze wzgledu na korelacje')
attr_with_big_std = attr_with_big_std(attr_with_big_std ~= 1)

dane = t{:, attr_with_big_std};
disp('dobor ilosci klas')
for i=1:20
    [kl c so] = kmeans(dane,i,'Replicates',15); %so to odleglosci puntktow dopasownych od centroidow -  chcemy zeby byly male ale nie za male
%     scatter(dane(:,1),dane(:,2),2,kl);
    odl(i) = sum(so)/size(dane,1);
    if (i>1) dif(i-1) = (odl(i-1) - odl(i))/odl(i-1); 
    end
end

figure;
subplot(1, 1, 1);
plot(odl);
max(find(dif>0.1))

disp('klasy a skupiska atrybutów')
figure;
a = 1;
for i=1:4
    for j=1:4
        subplot(4, 4, a);
        scatter(dane(:,i), dane(:, j), 2, t{:, end});
        a= a + 1;
    end
end

disp('klasyfikator najbliższych sasiadow')
c = cvpartition(t.klasa,'HoldOut',0.3);
kl = fitcknn(t{c.training, attr_with_big_std}, t{c.training, end},'NumNeighbors', 1);
disp('wynik klasyfikacji dla zbioru uczącego')
wynik = kl.predict(t{c.training,attr_with_big_std});
crosstab(t{c.training, end}, wynik)
disp('wynik klasyfikacji dla zbioru testowego')
wynik = kl.predict(t{c.test, attr_with_big_std});
c_tab = crosstab(t{c.test, end}, wynik)
disp('ilosc bledow')
sum_non_diagonal(c_tab)

disp('klasyfikator najbliższych sasiadow - bez selekcji atrybutów')
c = cvpartition(t.klasa,'HoldOut',0.3);
kl = fitcknn(t{c.training,1:end-1}, t{c.training, end},'NumNeighbors', 1);
disp('wynik klasyfikacji dla zbioru uczącego')
wynik = kl.predict(t{c.training,1:end-1});
crosstab(t{c.training, end}, wynik)
disp('wynik klasyfikacji dla zbioru testowego')
wynik = kl.predict(t{c.test, 1:end-1});
c_tab = crosstab(t{c.test, end}, wynik)
disp('ilosc bledow')
sum_non_diagonal(c_tab)

disp('klasyfikator naiwny bayes - wybrane atrybuty')
kl = fitcnb(t{c.training, attr_with_big_std}, t{c.training, end});
disp('wynik klasyfikacji dla zbioru uczącego')
wynik = kl.predict(t{c.training,attr_with_big_std});
crosstab(t{c.training, end}, wynik)
disp('wynik klasyfikacji dla zbioru testowego')
wynik = kl.predict(t{c.test, attr_with_big_std});
c_tab = crosstab(t{c.test, end}, wynik)
disp('ilosc bledow')
sum_non_diagonal(c_tab)

disp('klasyfikator naiwny bayes - wszystkie atrybuty')
kl = fitcnb(t{c.training, 1:end-1}, t{c.training, end});
wynik = kl.predict(t{c.training,1:end-1});
crosstab(t{c.training, end}, wynik)
disp('wynik klasyfikacji dla zbioru testowego')
wynik = kl.predict(t{c.test, 1:end-1});
c_tab = crosstab(t{c.test, end}, wynik)
disp('ilosc bledow')
sum_non_diagonal(c_tab)


disp('drzewo decyzyjne - dobrane atrybuty')
kl = fitctree(t{c.training, attr_with_big_std}, t{c.training, end});
disp('wynik klasyfikacji dla zbioru uczącego')
wynik = kl.predict(t{c.training,attr_with_big_std});
crosstab(t{c.training, end}, wynik)
disp('wynik klasyfikacji dla zbioru testowego')
wynik = kl.predict(t{c.test, attr_with_big_std});
c_tab = crosstab(t{c.test, end}, wynik)
disp('ilosc bledow')
sum_non_diagonal(c_tab)

disp('drzewo - wszytskie atrybuty')
kl = fitctree(t{c.training, 1:end-1}, t{c.training, end});
wynik = kl.predict(t{c.training,1:end-1});
crosstab(t{c.training, end}, wynik)
disp('wynik klasyfikacji dla zbioru testowego')
wynik = kl.predict(t{c.test, 1:end-1});
c_tab = crosstab(t{c.test, end}, wynik)
disp('ilosc bledow')
sum_non_diagonal(c_tab)

disp('metoda prototypow - dobrane atrybuty')
pro_c(1,:) = mean(t{c.training & t.klasa == 1,attr_with_big_std});
pro_c(2,:) = mean(t{c.training & t.klasa == 2,attr_with_big_std});
pro_c(3,:) = mean(t{c.training & t.klasa == 3,attr_with_big_std});
pro_c(4,:) = mean(t{c.training & t.klasa == 4,attr_with_big_std});

pro_c

kl = fitcknn(pro_c,[1; 2; 3; 4;],'NumNeighbors',1);

disp('metoda prototypow - treningowy bledy')
wynik = kl.predict(t{c.training, attr_with_big_std});
c_tab = crosstab(t{c.training, end}, wynik)
sum_non_diagonal(c_tab)

disp('metoda prototypow - testowy bledy')
wynik = kl.predict(t{c.test, attr_with_big_std});
c_tab = crosstab(t{c.test, end},wynik)
sum_non_diagonal(c_tab)

disp('metoda prototypow - wszystkie atrybuty')
pro_c_a(1,:) = mean(t{c.training & t.klasa == 1,1:end-1});
pro_c_a(2,:) = mean(t{c.training & t.klasa == 2,1:end-1});
pro_c_a(3,:) = mean(t{c.training & t.klasa == 3,1:end-1});
pro_c_a(4,:) = mean(t{c.training & t.klasa == 4,1:end-1});

pro_c_a

kl = fitcknn(pro_c_a,[1; 2; 3; 4;],'NumNeighbors',1);

disp('metoda prototypow - treningowy bledy')
wynik = kl.predict(t{c.training, 1:end-1});
c_tab = crosstab(t{c.training, end}, wynik)
sum_non_diagonal(c_tab)

disp('metoda prototypow - testowy bledy')
wynik = kl.predict(t{c.test, 1:end-1});
c_tab = crosstab(t{c.test, end},wynik)
sum_non_diagonal(c_tab)

disp('metoda prototypow - wszystkie atrybuty - standaryzowany')
t{:, 1:end-1} = zscore(t{:, 1:end - 1});
pro_c_a_z(1,:) = mean(t{c.training & t.klasa == 1,1:end-1});
pro_c_a_z(2,:) = mean(t{c.training & t.klasa == 2,1:end-1});
pro_c_a_z(3,:) = mean(t{c.training & t.klasa == 3,1:end-1});
pro_c_a_z(4,:) = mean(t{c.training & t.klasa == 4,1:end-1});

pro_c_a_z

kl = fitcknn(pro_c_a_z,[1; 2; 3; 4;],'NumNeighbors',1);

disp('metoda prototypow - treningowy bledy')
wynik = kl.predict(t{c.training, 1:end-1});
c_tab = crosstab(t{c.training, end}, wynik)
sum_non_diagonal(c_tab)

disp('metoda prototypow - testowy bledy')
wynik = kl.predict(t{c.test, 1:end-1});
c_tab = crosstab(t{c.test, end},wynik)
sum_non_diagonal(c_tab)


disp('klasyfikator k najblizszych sasiadow - musimy dokonac standaryzacji lub normalizacji danych aby uzyskac sensowne wyniki')
for k=1:2:7
    kl = fitcknn(t{c.training,attr_with_big_std}, t{c.training, end},'NumNeighbors', k);
    wynik = kl.predict(t{c.test, attr_with_big_std});
    strcat(num2str(k),'-NN')
    c_tab = crosstab(t{c.test, end}, wynik)
    disp('ilosc bledow')
    sum_non_diagonal(c_tab)
end

disp('klasyfikator k najblizszych sasiadow - bez doboru atrybutow')

for k=1:2:7
    kl = fitcknn(t{c.training,1:end-1}, t{c.training, end},'NumNeighbors', k);
    wynik = kl.predict(t{c.test, 1:end-1});
    strcat(num2str(k),'-NN')
    c_tab = crosstab(t{c.test, end}, wynik)
    disp('ilosc bledow')
    sum_non_diagonal(c_tab)
end
