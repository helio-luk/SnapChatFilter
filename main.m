clear all
close all


imagemRosto = imread('imgFace/homem8.jpg');
mascara     = imread('imgMascara/coelhoFucinho.png');
imagemFiltro= imread('imgFiltro/coelho.png');

fixedPoints = [490 237; 534 235; 514 219; 514 245];
movingPoints = [204 408; 298 408; 253 378; 254 434]; 

% x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints);

mascara     = imread('imgMascara/coelhoOrelha.png');

fixedPoints = [456 143; 468 139; 484 139; 526 133; 542 133; 554 137];
movingPoints = [169 246; 196 237; 223 230; 282 230; 310 235; 330 243];

x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints);

mascara     = imread('imgMascara/oculos1m.png');
imagemFiltro= imread('imgFiltro/oculos1.png');

fixedPoints = [168 168; 188 182; 246 121; 260 140];
movingPoints = [660 411; 660 539; 1468 419; 1464 549];

% x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints);

imshow(x);