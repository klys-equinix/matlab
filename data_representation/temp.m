format long g
% powr�t do standardowego: format short
[num txt raw] = xlsread('pasazerowie_lot.xls');
d = array2table(num); % konwersja na postac tabeli
kraje = txt(4:40,1); % nazwy pa�stw
d.Properties.RowNames = kraje; % uzupe�nienie danych tabeli 
lata = txt(3,2:13); % lata 
lata2 = strrep(lata,'20','rok_20'); % zmiana tekstu
d.Properties.VariableNames = lata2; % uzupe�nienie danych tabeli
d % tabela w pe�nej postaci
dif = d{:,12} - d{:,1}; % r�nica mi�dzy ostantim i pierwszym rokiem
najw_wzrost = find(dif == max(dif)) % sukamy najwi�kszego wzrostu bezwzgl�dnego
kraje(najw_wzrost) % jaki to kraj ?

difproc = (d{:,12} - d{:,1})./d{:,1} %wzrost bezwzgl�dny
najw_wzrost_proc = find(difproc == max(difproc)) % szukamy najw. wzrostu wzgl.
kraje(najw_wzrost_proc) % kt�ry kraj mia� taki wzrost ?

% liczymy zmiany rok do roku, bezwzgl�dne i wzgl�dne
for i = 1:11
    difrok(:,i)=d{:,i+1}-d{:,i};
    difrokproc(:,i)=(d{:,i+1}-d{:,i})./d{:,i};
end

maxwzrosty = max(difrokproc);
minwzrosty = min(difrokproc);

srwzrosty = mean(difrokproc) 
difrokproc(1:5,1:5)
srwzrosty = mean(difrokproc,'omitnan')



