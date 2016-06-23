function x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints)

% leitura das imagens
ImgOrigH = imagemRosto; %imread('gatohelio.png');
MapBWCat = mascara ;    %imread('gatoferor.png');
ImgOrigG = imagemFiltro;%imread('gatofer.jpg');

[l,c] = size(MapBWCat);

% m�scara
Masc = ImgOrigG;
x = MapBWCat;

H = fspecial('average',5);
Masc = imfilter(Masc, H);

for i = 1:l
    for j = 1:c
        if (MapBWCat(i,j) < 100)
           Masc(i,j) = 0;
        end
    end
end

se = strel('disk', 4);
Masc = imdilate(Masc, se);

%fixedPoints = [194   172; 266   163;365   164;438   182;];
%movingPoints = [154   355; 289   322;  559   319;  679   331];


    
%tform = fitgeotrans(movingPoints,fixedPoints,'lwm',6);
tform = fitgeotrans(movingPoints,fixedPoints,'NonreflectiveSimilarity');
%tform = fitgeotrans(movingPoints,fixedPoints,'pwl');
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

imwrite(final, 'gatohelio2.png');

imshow(final);