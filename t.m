clear all
close all


%a = imread('gatoroberta.jpg');
a = imread('helio.png');

imshow(a);
[x, y] = getpts;

fix([x y])