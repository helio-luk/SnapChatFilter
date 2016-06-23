clear all
close all


imagemRosto = imread('imgFace/helio.png');
mascara     = imread('imgMascara/gatoRoberta2Focinho.png');
imagemFiltro= imread('imgFiltro/gatoRoberta2.jpg');

fixedPoints=[249   386;338   385;290   341; 294   428];



movingPoints = [557   607;  795   621;  681   553; 693   707 ];

x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints);

imshow(x);