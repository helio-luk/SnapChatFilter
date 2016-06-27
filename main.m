clear all
close all


imagemRosto = imread('imgFace/angelina.jpg');
mascara     = imread('imgMascara/gatoRoberta1Focinho.png');
imagemFiltro= imread('imgFiltro/gatoRoberta1.jpg');

fixedPoints = [255 477; 386 474; 319 412; 324 514];
movingPoints = [327 664; 481 638; 397 600; 419 714];

x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints);

mascara     = imread('imgMascara/gatoFernandaOrelha.png');
imagemFiltro= imread('imgFiltro/gatoFernanda.jpg');

fixedPoints = [161 148; 193 120; 240 109; 344 108; 392 118; 433 146];
movingPoints = [173 410; 233 364; 301 326; 531 300; 615 342; 679 386];

x = transformacao(x, imagemFiltro, mascara, fixedPoints, movingPoints);

mascara     = imread('imgMascara/oculos1m.png');
imagemFiltro= imread('imgFiltro/oculos1.png');

fixedPoints = [235 304; 236 345; 393 302; 397 342];
movingPoints = [660 411; 660 539; 1468 419; 1464 549];

x = transformacao(x, imagemFiltro, mascara, fixedPoints, movingPoints);


imshow(x);