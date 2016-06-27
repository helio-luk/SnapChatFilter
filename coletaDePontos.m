clear all
close all

% a = imread('imgFiltro/gatoRoberta1.jpg');
a = imread('imgFace/casal8.jpg');

imshow(a);
[x, y] = getpts;

fix([x y]);
[l,~] = size(x);

% %faces
% arq = fopen('Landmarks-face/landmark-face-zac.txt','w');
% 
% %oculos
% fprintf(arq,'fixedPoints = [');
% for i = 1:(l-1)
%     fprintf(arq,'%d ', uint16(x(i)));
%     fprintf(arq,'%d; ', uint16(y(i)));
% end
% fprintf(arq,'%d ', uint16(x(l)));
% fprintf(arq,'%d]; ', uint16(y(l)));
% 
% [x, y] = getpts;
% 
% fix([x y]);
% [l,~] = size(x);
% 
% %fucinho
% fprintf(arq,'fixedPoints = [');
% for i = 1:(l-1)
%     fprintf(arq,'%d ', uint16(x(i)));
%     fprintf(arq,'%d; ', uint16(y(i)));
% end
% fprintf(arq,'%d ', uint16(x(l)));
% fprintf(arq,'%d]; ', uint16(y(l)));
% 
% [x, y] = getpts;
% 
% fix([x y]);
% [l,~] = size(x);
% 
% %orelhas
% fprintf(arq,'fixedPoints = [');
% for i = 1:(l-1)
%     fprintf(arq,'%d ', uint16(x(i)));
%     fprintf(arq,'%d; ', uint16(y(i)));
% end
% fprintf(arq,'%d ', uint16(x(l)));
% fprintf(arq,'%d]; ', uint16(y(l)));
% [x, y] = getpts;
% 
% fix([x y]);
% [l,~] = size(x);
% 
% %fucinho menor
% fprintf(arq,'fixedPoints = [');
% for i = 1:(l-1)
%     fprintf(arq,'%d ', uint16(x(i)));
%     fprintf(arq,'%d; ', uint16(y(i)));
% end
% fprintf(arq,'%d ', uint16(x(l)));
% fprintf(arq,'%d]; ', uint16(y(l)));

% fclose(arq);
close all