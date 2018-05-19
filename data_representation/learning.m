% wczytanie zbioru danych
% load dane3
% podział na zbiór uczący i testowy
% c = cvpartition(d.klasa,'HoldOut',0.3);
% d(c.test,:) % zbiór testowy
% d(c.training,:) % zbiór uczący
% wykres punktowy zbioru uczącego i testowego
% scatter(d{c.training,1},d{c.training,2},20,d{c.training,3},'filled')
% hold on
% scatter(d{c.test,1},d{c.test,2},20,d{c.test,3})
% hold off
% zdefiniowanie modelu klasyfikacji
% kl = fitcknn(d{c.training,1:2},d{c.training,3},'NumNeighbors',1);
% wynik klasyfikacji dla zbioru uczącego
% wynik = kl.predict(d{c.training,1:2});
% confusionmat(d{c.training,3},wynik)
% wynik klasyfikacji dla zbioru testowego
% wynik = kl.predict(d{c.test,1:2});
% confusionmat(d{c.test,3},wynik)
% Confusion matrix - macierz (ilosc_klas x ilosc_klas), np jezeli
% prawidlowo w pierwszej klasie sa 3 obiekty ,
% w drugiej klasie sa prawidlowo 2 obiekty i jeden źle zakalifikowano do
% grupy 3,
% a w grupie 3 wszytskie 3 obiekty blednie zakwalifikowano do grupy 1 to
% macierz bedzie wygladac tak:
% 3 0 0
% 0 2 1
% 3 0 0
% Bezbleedna macierz ma wartosci tylko na diagonali.

% Fisher's iris 
% load fisheriris;
% wizualizacja danych - wykres punktowy
% gplotmatrix(meas,[],species,'bgrcmyk','.',[],'on',[],...
% {'dlugosc kielicha','szerokosc kielicha','dlugosc platka','szerokosc platka'})
% klasyfikator = 'minodl';
% kl = fitcknn(meas,species,'NumNeighbors',1);
% koniec = 0;
% while  ~koniec
%     dk = input('podaj dlugosc kielicha: ');
%     sk = input('podaj szerokosc kielicha: ');
%     dp = input('podaj dlugosc platka: ');
%     sp = input('podaj szerokosc platka: ');
%     wynik = kl.predict([dk sk dp sp]);
%     W = strcat('to jest irys odmiany: ', string(wynik));
%     disp(W)
%     odp = input('Jeszcze raz ? [t/n] ', 's');
%     if strcmp(odp,'n') koniec = 1; end
% end

% Klasyfikator k najblizszych sasiadow
% load dane3
% % podział na zbiór uczący i testowy
% c = cvpartition(d.klasa,'HoldOut',0.3);
% % wykres punktowy zbioru uczącego i testowego
% scatter(d{c.training,1},d{c.training,2},20,d{c.training,3},'filled')
% hold on
% scatter(d{c.test,1},d{c.test,2},20,d{c.test,3})
% hold off
% for k=1:2:7
%     kl = fitcknn(d{c.training,1:2},d{c.training,3},'NumNeighbors',k);
%     wynik = kl.predict(d{c.test,1:2});
%     strcat(num2str(k),'-NN')
%     confusionmat(d{c.test,3},wynik)
% end

% Uczenie z prototypami

% load dane2
% c = cvpartition(d.klasa,'HoldOut',0.3);
% % tworzenie macierzy prototypów
% pro_c(1,:) = mean(d{c.training & d.klasa == 'klasa 1',1:2});
% pro_c(2,:) = mean(d{c.training & d.klasa == 'klasa 2',1:2});
% pro_c(3,:) = mean(d{c.training & d.klasa == 'klasa 3',1:2});
% pro = table(pro_c(:,1),pro_c(:,2),nominal({'klasa 1'; 'klasa 2'; 'klasa 3'}));
% pro.Properties.VariableNames = {'atrybut1', 'atrybut2', 'klasa'};
% pro % macierz prototypów
% scatter(d{c.training,1},d{c.training,2},20,d{c.training,3})
% hold on
% scatter(pro{:,1},pro{:,2},20,pro{:,3},'filled')
% hold off
% kl = fitcknn(pro{:,1:2},pro{:,3},'NumNeighbors',1);
% wynik = kl.predict(d{c.training,1:2});
% confusionmat(d{c.training,3},wynik)
% wynik = kl.predict(d{c.test,1:2});
% confusionmat(d{c.test,3},wynik)

% Bayes

%  load dane2
%  c = cvpartition(d.klasa,'HoldOut',0.3);
%  scatter(d{c.training,1},d{c.training,2},20,d{c.training,3},'filled')
%  hold on
%  scatter(d{c.test,1},d{c.test,2},20,d{c.test,3})
%  hold off
%  kl = fitcnb(d{c.training,1:2},d{c.training,3});
%  wynik = kl.predict(d{c.training,1:2});
%  confusionmat(d{c.training,3},wynik)
%  wynik = kl.predict(d{c.test,1:2});
%  confusionmat(d{c.test,3},wynik)

