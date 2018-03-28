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
o = 5
v = floor([rand(o,1)*10-5, rand(o,1)*200-2, rand(o,1)*1000])
% [min(v) ; max(v) ; mean(v) ; std(v)] % podstawowe parametry
% (v - ones(o,1)*min(v))./(ones(o,1)*(max(v) - min(v))) % normalizacja min-max
% (v - ones(o,1)*mean(v))./(ones(o,1)*std(v)) % standaryzacja
v = zscore(v) % funkcja realizująca standartyzację

mean(v)
std(v)