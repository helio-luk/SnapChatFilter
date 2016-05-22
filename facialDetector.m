clear all
close all

I = imread('h.jpg');

%Algoritmo baseado no viola-jones para detecção de regiões de interesse na
%face humana
FDetect = vision.CascadeObjectDetector;
%vetor responsavel por delimitar a regiao do rosto
BB = step(FDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','r');
end
title('Face Detection');
hold off;

%detecção de nariz
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);
BB=step(NoseDetect,I);

figure,
imshow(I); hold on
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','b');
end
title('Nose Detection');
hold off;

%detecção de boca
MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
BB=step(MouthDetect,I);
figure,
imshow(I); hold on
for i = 1:size(BB,1)
 rectangle('Position',BB(i,:),'LineWidth',1,'LineStyle','-','EdgeColor','r');
end
title('Mouth Detection');
hold off;


%detecção de olho
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
BB=step(EyeDetect,I);
figure,imshow(I);
rectangle('Position',BB,'LineWidth',1,'LineStyle','-','EdgeColor','b');
title('Eyes Detection');
Eyes=imcrop(I,BB);
figure,imshow(Eyes);