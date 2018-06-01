clear all;
% o = imread('lotnicze.tif');
% subplot(2,2,1); subimage(o);
% subplot(2,2,2); subimage(imadjust(o,[0.2 1],[0 1]));
% subplot(2,2,3); subimage(imadjust(o,[0.4 1],[0 1]));
% subplot(2,2,4); subimage(imadjust(o,[0.2 1],[0.1 0.6]));
% figure;
% % utwórz nowe okno wyświetlania obrazów
% subplot(2,2,1); subimage(o);
% subplot(2,2,2); subimage(imadjust(o,[0 1],[0 1],0.5));
% subplot(2,2,3); subimage(imadjust(o,[0 1],[0 1],2));
% subplot(2,2,4); subimage(imadjust(o,[0 1],[0 1],5));

% Filtr rozmywajacy
% o = imread('uscalszum1.tif');
% % wczytaj obraz zaszumiony
% m = ones (3)/ (3*3) %
% sum(sum(m)) % czy suma wsp. maski wynosi 1 ?
% o1 = imfilter(o,m);
% subplot (1,2,1); subimage (o);
% subplot (1,2,2); subimage (o1);

% Uśredniajacy kolorowy
% im = imread('peppers.png');
% h = ones(5,5)/25;
% im2 = imfilter(im,h);
% imshow([im ; im2])

% Filtry gornoprzepustowe - krawedzie

% im = imread('rose.tif');
% im1 = im2double(im);
% f = fspecial('prewitt')
% im2 = imfilter(im1,f);
% max(max(im2))
% % maksymalna wartość punktu obrazu przefiltrowanego
% min(min(im2))
% % i minimalna
% im2a = abs(im2/3); % normalizacja - aby zmiejszyc b. duzy kontrast
% max(max(im2a))
% % maksymalna wartość po normalizacji
% min(min(im2a))
% % i minimalna
% im3 = imfilter(im1,f'); % transponowana maska filtru
% im3a = abs(im3/3);
% im4 = im2a+im3a;
% imshow([im1 im2a ; im3a im4]);

% Segmentacja przez progowanie

o = imread('dowels.tif');
subplot(1,3,1); subimage(o);
seg = im2bw(o,0.5);
% pierwszy sposób progowania
subplot(1,3,2); subimage(seg);
seg2 = o > 128;
% drugi sposób progowania
subplot(1,3,3); subimage(seg2);