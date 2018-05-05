% Obrazki
close all;
imfinfo('lena.png')
u = imread('lena.png')
% konwersja w obr. w skali szar. typu double
o1(:,:,1) = im2double(rgb2gray(u));
% modyfikujemy obrazy
o1(:,:,2) = o1(:,:,1)/2;
o1(:,:,3) = o1(:,:,1) + 0.2;
o1(:,:,4) = o1(:,:,1)/2 + 0.5;
for i = 1:4
o2 = o1(:,:,i);
figure('name',strcat('s = ',num2str(mean(o2(:))),' o = ',num2str(std(o2(:)))))
imshow(o2);
end
whos u % Podstawowe dane o obrazie
impixelinfo % Pokazuje informacje o pixelu po nejchaniu mysza na pixel
cut_u = u(1:100, 1:100, :)
imshow(cut_u)