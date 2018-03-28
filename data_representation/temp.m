format long g
% powrót do standardowego: format short
[num txt raw] = xlsread('pasazerowie_lot.xls');
d = array2table(num); % konwersja na postac tabeli
kraje = txt(4:40,1); % nazwy pañstw
d.Properties.RowNames = kraje; % uzupe³nienie danych tabeli 
lata = txt(3,2:13); % lata 
lata2 = strrep(lata,'20','rok_20'); % zmiana tekstu
d.Properties.VariableNames = lata2; % uzupe³nienie danych tabeli
d % tabela w pe³nej postaci
dif = d{:,12} - d{:,1}; % ró¿nica miêdzy ostantim i pierwszym rokiem
najw_wzrost = find(dif == max(dif)) % sukamy najwiêkszego wzrostu bezwzglêdnego
kraje(najw_wzrost) % jaki to kraj ?

difproc = (d{:,12} - d{:,1})./d{:,1} %wzrost bezwzglêdny
najw_wzrost_proc = find(difproc == max(difproc)) % szukamy najw. wzrostu wzgl.
kraje(najw_wzrost_proc) % który kraj mia³ taki wzrost ?

% liczymy zmiany rok do roku, bezwzglêdne i wzglêdne
for i = 1:11
    difrok(:,i)=d{:,i+1}-d{:,i};
    difrokproc(:,i)=(d{:,i+1}-d{:,i})./d{:,i};
end

maxwzrosty = max(difrokproc);
minwzrosty = min(difrokproc);

srwzrosty = mean(difrokproc) 
difrokproc(1:5,1:5)
srwzrosty = mean(difrokproc,'omitnan')



