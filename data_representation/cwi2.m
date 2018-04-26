% Zadanie 10
% sam = load('samochody');
% max(sam.d{sam.d.klasa=='limuzyna', 1:3}) - min(sam.d{sam.d.klasa=='limuzyna', 1:3}) 
% max(sam.d{sam.d.klasa=='sportowy', 1:3}) - min(sam.d{sam.d.klasa=='sportowy', 1:3}) 
% Zadanie 12
% w = csvread('waluty1.csv', 1);
% res = zeros(10, 9);
% j = 1;
% for i=2006:2010
%     disp(i + "pierwsze")
%     var(w( w(:, 1) == i & ( 1 <= w(:, 2) <= 6 ) , 4:7))
%     mean(w( w(:, 1) == i & ( 1 <= w(:, 2) <= 6 ) , 4:7))
%     res(j, 1) = i + "pierwsze";
%     res(j, 2:5) = var(w( w(:, 1) == i & ( 1 <= w(:, 2) <= 6 ) , 4:7));
%     res(j, 6:9) = mean(w( w(:, 1) == i & ( 1 <= w(:, 2) <= 6 ) , 4:7));
%     j = j + 1;
%     disp(i + "drugie")
%     var(w( w(:, 1) == i & ( 6 < w(:, 2) <= 12 ) , 4:7))
%     mean(w( w(:, 1) == i & ( 6 < w(:, 2) <= 12 ) , 4:7))
%     res(j, 1) = i + "drugie";
%     res(j, 2:5) = var(w( w(:, 1) == i & ( 6 < w(:, 2) <= 12 ) , 4:7));
%     res(j, 6:9) = mean(w( w(:, 1) == i & ( 6 < w(:, 2) <= 12 ) , 4:7));
%     j = j + 1;
% end
% res
% for i=1:4
% %     disp([i
% %         max(res(:, 1 + i))  min(res(:, 4 + i)) max(res(:, 4 + 1))])
%     max_var = max(res(:, 1 + i))
%     find(res(:, 1 + i) == max_var)
%     min_val = min(res(:, 4 + i));
%     i_min_val = (find(res(:, 4 + i)) == min_val)
%     max_val = max(res(:, 4 + i))
%     i_max_val = (find(res(:, 4 + i)) == max_val)
%     disp([i i_max_var max_var min_val i_min_val i_max_val max_val]);
% end
% Zadanie 13

% clear all % czyści zmienne
% close all % zamyka okna
% o = imread('lena.png'); % wczytujemy obraz
% % konwersja w obr. w skali szar. typu double
% o1(:,:,1) = im2double(rgb2gray(o));
% % modyfikujemy obrazy
% o1(:,:,2) = o1(:,:,1)/2;
% o1(:,:,3) = o1(:,:,1) + 0.2;
% o1(:,:,4) = o1(:,:,1)/2 + 0.5;
% for i = 1:4
% o2 = o1(:,:,i);
% figure('name',strcat('s = ',num2str(mean(o2(:))),' o = ',num2str(std(o2(:)))))
% imshow(o2);
% end
% Zadanie 14
% o = 5
% v = floor([rand(o,1)*10-5, rand(o,1)*200-2, rand(o,1)*1000])
% [min(v) ; max(v) ; mean(v) ; std(v)] % podstawowe parametry
% (v - ones(o,1)*min(v))./(ones(o,1)*(max(v) - min(v))) % normalizacja min-max
% (v - ones(o,1)*mean(v))./(ones(o,1)*std(v)) % standaryzacja
% v = zscore(v) % funkcja realizująca standartyzację

% mean(v)
% std(v)

% Zadanie 15

% sam = load('samochody');

% cov(sam.d{:, 1:3})
% corr(sam.d{:, 1:3})

% Zadanie 17

% AA = [1 3 6 8 8 7 NaN 3 2 2 1];

% nanmean(AA)

% Zadanie 18
% AA = [1 3 6 8 8 7 3 2 2 1];
% A = [1 3 6 8 8 7 NaN 3 2 2 1];
% calculate random number with normal dist for AA
% x = normrnd(mean(AA), std(AA));
% nanmean(A)
% A(5) = x;
% mean(A)

% Zadanie 19 
%format long g
% powrót do standardowego: format short
%[num txt raw] = xlsread('pasazerowie_lot.xls');

%d = array2table(num(:, 2:end)); % konwersja na postac tabeli
%kraje = txt(4:40,1);
%d.Properties.RowNames = kraje;
%lata = txt(3,2:13);
%lata2 = strrep(lata,'20','rok_20');
%d.Properties.VariableNames = lata2;


%start = 4;
%panstwa = start:size(d,1);
% szukamy największego wzrostu względnego
%difproc = (d{panstwa,12} - d{panstwa,1})./d{panstwa,1} % wzrost względny
% szukamy najw. wzrostu wzgl.:
%najw_wzrost_proc = find(difproc == max(difproc)) + start - 1
%kraje(najw_wzrost_proc) % który kraj miał taki wzrost ?
% liczymy zmiany rok do roku, bezwzględne i względne
%for i = 1:11
%    difrok(panstwa,i)=d{panstwa,i+1}-d{panstwa,i};
%    difrokproc(panstwa,i)/home/konrad/Downloads/Eurostat_Table_tessi250NoFlagDesc_ebdd3828-c426-4186-b222-5c20a374532b.xls=(d{panstwa,i+1}-d{panstwa,i})./d{panstwa,i};
%end
% kraj o największym wzroście 2015-16
%kraje(find(difrokproc(:,11) == max(difrokproc(:,11))))
% kraj o najwiekszym wzroscie rok do roku
%kraje(find(difrokproc(:,:) == max(max(difrokproc(:,:)))))
%Zadanie 21
%[num txt raw] = xlsread('employment.xls');
%d = array2table(num(5:end, 2:end));
%kraje = txt(9:44, 1);
%d.Properties.RowNames = kraje;
%lata = txt(4,2:13);
%lata2 = strrep(lata,'20','rok_20');
%d.Properties.VariableNames = lata2;

%start = 1;
%panstwa = start:size(d,1);
%dif_proc = (d{panstwa, 11} - d{panstwa, 1}) ./ d{panstwa, 1};
%najw_wzrost_proc = find(dif_proc == max(dif_proc));
%kraje(najw_wzrost_proc);
%dif_proc(najw_wzrost_proc);
%najm_wzrost_proc = find(dif_proc == min(dif_proc));
%kraje(najm_wzrost_proc);
%dif_proc(najm_wzrost_proc);

%Zadanie 22
%lata = 1999:2018;
%sprzedaz = [10 11 12 14 16 17 18 19 19 18 16 15 17 18 18 19 20 21 23 23;
%5 6 7 7 7 8 8 10 14 14 15 16 16 17 19 20 22 22 24 25;
%15 15 16 17 16 15 14 13 12 11 10 9 8 8 7 8 9 7 6 6 ];
%sum_sprzedaz = zeros(size(sprzedaz));
%for n=1:length(sprzedaz(1, :))
%    sum_sprzedaz(1, n) = sum(sprzedaz(1, 1:n));
%    sum_sprzedaz(2, n) = sum(sprzedaz(2, 1:n));
%    sum_sprzedaz(3, n) = sum(sprzedaz(3, 1:n));
%end
%plot(lata, sum_sprzedaz, 'LineWidth',1)
%legend('firma A','firma B','firma C');
%title('suma Sprzedaż w latach 2009-2018');
%ylabel('Sprzedaż w mln zł.')
%xlabel('Rok')

%Zadanie 23
% clear all
% load patients
% whos
% Location = categorical(Location); % niezbędna konwersja
% summary(Location) % podsumowanie
% SelfAssessedHealthStatus = categorical(SelfAssessedHealthStatus,...
% {'Poor' 'Fair' 'Good' 'Excellent'},'Ordinal',true);
% summary(SelfAssessedHealthStatus)
% Smoker = categorical(Smoker);
% Gender = categorical(Gender);
% summary(Smoker)
% s(1) = mean(Systolic(Smoker == "true"));
% s(2) = mean(Systolic(Smoker == "false"));
% bar(categorical({'true','false'}), s)
% s(1) = mean(Systolic(Smoker == "true" & Gender == "Female"));
% s(2) = mean(Systolic(Smoker == "false" & Gender == "Female"));
% s(3) = mean(Systolic(Smoker == "true"& Gender == "Male"));
% s(4) = mean(Systolic(Smoker == "false"& Gender == "Male"));
% s
% bar(categorical({'Female smoker','Female nonsmoker', 'Male smoker', 'Male nonsmoker'}), s)

% Zadanie 24
%[num txt raw] = xlsread('pasazerowie_lot.xls','','','basic');
%num = num(:,2:end); % usuwamy pierwszą kolumnę (same NaN)
%kraje = txt(4:40,1); % nazwy państw
%lata = txt(3,2:13); % lata
% wybieramy zakres
%zakres = 4:35; % zakres państw
%lata = 6:11; % wybrany rok
% przewozy = sum(num(zakres, lata), 2);
%przewozy = num(zakres, lata);
%wybrane = kraje(zakres);
% usuwamy NaN-y
%ind = ~any(isnan(przewozy), 2); % nie NaN-y
%przewozy2 = przewozy(ind, :)
%wybrane2 = wybrane(ind);
% sortujemy
%[przewozy3 ind] = sort(przewozy2,'descend');
%wybrane3 = wybrane2(ind);

%figure
%b = barh(przewozy3(1:5, :), 'stacked');
%yticklabels(wybrane3(1:5, :));
%yticks(1:5);
%b.FaceColor = 'flat';
%title('Przewozy lotnicze 2011-15')
% Zadanie 25
%load fisheriris
%s = nominal(species); % niebędna konwersja atrybutu decyzyjnego
%hist(meas(s == 'setosa', 3))
%hist(meas(s == 'virginica', 3))
%hist(meas(s == 'versicolor', 3))
% Zadanie 27
% wczytywanie pliku
% fid = fopen('Pan Tadeusz.txt', 'rt', 'n', 'UTF8');
% w = fread(fid,[1 Inf],'*char');
% fclose(fid)
% % podzial na linijki
% t = regexp(w,'\r?\n','split');
% %zliczanie slow w linijce
% hist = zeros(15,1);
% for i=1:size(t,2)
%     ile = numel(strsplit(string(t(i))));
%     if (ile<16) hist(ile) = hist(ile) + 1; end
% end
% % wynikowy histogram
% bar(hist)
% numSlow =  0;
% for i=1:15
%     numSlow = numSlow + hist(i) * i;
% end
% numSlow / size(t, 2)
% Zadanie 28
% load samochody
%  scatter(d.vmax,d.paliwo) % wykres punktowy dwóch atrybutów
% figure
% scatter(d.paliwo,d.moc,20,d.klasa, 'filled') % wykres z rozróżnieniem klas
% colormap(parula(5)) % zmiana palety kolorów
% Fchuj ich jest generalnie

% Zadanie 29
% load samochody
% m(1,:) = mean(d{d.klasa=='limuzyna',1:3}); % wektor średnich klas
% m(2,:) = mean(d{d.klasa=='sportowy',1:3});
% m
% dd = [1 2]'; % wektor etykiet poszczególnych klas
% scatter(d.vmax,d.paliwo,20,d.klasa);
% hold on % dzięki tej komendzie kolejny wykres pojawi się na poprzednim
% dd
% scatter(m(:,1), m(:,2), 40, dd, 'filled'); %dd to wykres etykiet
% colormap winter

%  Zadanie 30
%  load samochody
%  scatter(d.moc, d.vmax, 20, d.klasa)
%  figure
%  scatter(d.paliwo, d.vmax, 20, d.klasa)
%  figure
%  scatter(d.paliwo, d.moc, 20, d.klasa)
%  colormap(parula(2))

%  Zadanie 31
%  load fisheriris
%  s = nominal(species); % niebędna konwersja atrybutu decyzyjnego
%  m(1, :) = mean(meas(s == 'setosa', :))
%  m(2, :) = mean(meas(s == 'virginica', :))
%  m(3, :) = mean(meas(s == 'versicolor', :))
%  dd = [1 2 3]';
%  scatter(meas(: ,1), meas(:, 2), 20, s)
%  hold on
%  scatter(m(:, 1), m(:, 2), 50, dd, 'filled')

% Zadanie 32
% load patients
% Gender = categorical(Gender);
% summary(Gender)
% Weight = Weight(:, :) .* 0.454;
% Height = Height(:, :) .* 2.54;
% X1 = Weight(Gender=='Female');
% Y1 = Height(Gender=='Female');
% X2 = Weight(Gender=='Male');
% Y2 = Height(Gender=='Male');
% mx1 = mean(X1);
% my1 = mean(Y1);
% mx2 = mean(X2);
% my2 = mean(Y2);
% figure
% scatter(X1,Y1,'o','r');
% hold on
% scatter(mx1,my1,'*','r');
% scatter(X2,Y2,'o','g');
% scatter(mx2,my2,'*','g');
% title('Wzrost vs. waga')
% xlabel('Waga (lbs)')
% ylabel('Wzrost (in)')

% Zadanie 33
% load fisheriris
% s = nominal(species);
% cov(meas(:, 1:2))
% cov(meas(:, 2:3))
% cov(meas(:, 3:4))
% corr(meas(:, 1:2))
% corr(meas(:, 2:3))
% corr(meas(:, 3:4))
% gplotmatrix(meas, [], s)

% Zadanie 34
% load fisheriris
% s = nominal(species);
% boxplot(meas(s == 'setosa', :))
% figure
% boxplot(meas(s == 'virginica', :))
% figure
% boxplot(meas(s == 'versicolor', :))

% Zadanie 35
% TODO

% Zadanie 36

% im = imread('baboon.jpg');
% subplot(2,1,1);
% imshow([im(:,:,1), im(:,:,2), im(:,:,3)])
% im2 = rgb2hsv(im);
% subplot(2,1,2);
% imshow([im2(:,:,1), im2(:,:,2), im2(:,:,3)])

% Zadanie 37

% im = imread('gray.bmp');
% im2 = imread('lenagray.bmp');
% imshow([im im2]) % wyświetlenie obrazów w trybie w skali szarości
% col = colormap('jet') % jaką macierzą jest tablica kolorów (rozmiar, typ danych) ?
% subplot(1,2,1)
% rgbplot(col);
% subplot(1,2,2)
% imshow([im; im2],col); % wyświetlenie obrazów w trybie pseukolorowania
