clear all
close all


imagemRosto = imread('imgFace/helio.png');
mascara     = imread('imgMascara/cachorro1Focinho.png');
imagemFiltro= imread('imgFiltro/cachorro1.png');

fixedPoints=[251   344; 342   340;  293   307;  293   367];
movingPoints = [144   255; 243   251;  190   216;  194   268];

x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints);

imshow(x);