clear all
close all


%a = imread('imgFiltro/oculos1.png');
a = imread('imgFace/helio.png');

imshow(a);
[x, y] = getpts;

fix([x y])