clear all
close all


imagemRosto = imread('imgFace/grupo2.jpg');
mascara     = imread('imgMascara/oculos1m.png');
imagemFiltro= imread('imgFiltro/oculos1.png');

fixedPoints = [831 263; 819 254; 795 304; 780 296];
movingPoints = [660 411; 660 539; 1468 419; 1464 549];

x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints);

fixedPoints = [840 552; 816 548; 828 597; 807 597];

x = transformacao(x, imagemFiltro, mascara, fixedPoints, movingPoints);

fixedPoints = [951 690; 969 704; 993 650; 1008 662];

x = transformacao(x, imagemFiltro, mascara, fixedPoints, movingPoints);

fixedPoints = [1089 371; 1107 380; 1113 329; 1128 329];

x = transformacao(x, imagemFiltro, mascara, fixedPoints, movingPoints);

imshow(x);