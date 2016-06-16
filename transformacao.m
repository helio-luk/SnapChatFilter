close all
clear all
clc

% leitura das imagens
ImgOrigH = imread('faceppteste.png');
MapBWCat = imread('86537-olhos.png');
ImgOrigG = imread('86537.jpg');

[l,c] = size(MapBWCat);

% máscara
Masc = ImgOrigG;

for i = 1:l
    for j = 1:c
        if (MapBWCat(i,j) < 100)
           Masc(i,j) = 0;
        end
    end
end

% landmarks do rosto humano
fixedPoints  = [38 48; 38 46; 34 47; 38 46; 32 47; 38 45; 30 43; 42 42; 41 63; 50 70; 50 66; 59 61; 50 63; 49 62; 43 57; 54 56; 48 56; 57 45; 57 44; 53 46; 57 44; 61 44; 56 43; 51 41; 63 39];

% landmarks do gato
movingPoints = [2059 1302; 2058 1227; 1967 1192; 2058 1227; 2146 1281; 2061 1168; 1926 1148; 2150 1190; 2159 1577; 2284 1617; 2284 1585; 2439 1576; 2284 1572; 2284 1535; 2202 1456; 2352 1449; 2278 1451; 2487 1261; 2468 1197; 2368 1272; 2468 1197; 2547 1154; 2450 1144; 2366 1173; 2551 1105];

tform = fitgeotrans(movingPoints,fixedPoints,'lwm',10);

ajuste = imwarp(Masc,tform,'OutputView',imref2d(size(ImgOrigH)));

final = zeros(size(ImgOrigH));

[l,c] = size(ImgOrigH);

for i = 1:l
    for j = 1:c
        if(ajuste(i,j) == 0)
            final(i,j) = ImgOrigH(i,j);
        else
            final(i,j) = ajuste(i,j);
        end
    end
end

final = uint8(final);

imshow(final);