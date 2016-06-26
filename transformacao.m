function x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints)

% leitura das imagens
ImgOrigH = imagemRosto;
MapBWCat = mascara ;   
ImgOrigG = imagemFiltro;

[l,c] = size(MapBWCat);

% m�scara
Masc = ImgOrigG;

for i = 1:l
    for j = 1:c
        if (MapBWCat(i,j) < 100)
           Masc(i,j) = 0;
        end
    end
end

%tform = fitgeotrans(movingPoints,fixedPoints,'lwm',6);
tform = fitgeotrans(movingPoints,fixedPoints,'NonreflectiveSimilarity');
%tform = fitgeotrans(movingPoints,fixedPoints,'pwl');
ajuste = imwarp(Masc,tform,'OutputView',imref2d(size(ImgOrigH)));

[l,c] = size(ImgOrigH);

final = ImgOrigH;

matrizBoleana = zeros(size(ImgOrigH));


for i = 1:l
    for j = 1:c
        if(ajuste(i,j) == 0)
            matrizBoleana(i, j) = false;            
            %aqui pega a imagem original(helio) e coloca na imagem final
        else
            matrizBoleana(i, j) = true;            
            %aqui pega a imagem do gato e coloca no helio
        end
    end
end

se = strel('disk', 4);
ajuste = imdilate(ajuste, se);

for i = 1:l
    for j = 1:c
        if(matrizBoleana(i, j) == false)            
            final(i,j) = ImgOrigH(i,j);           
        else            
            final(i,j) = ajuste(i,j);  
        end
    end
end

final = uint8(final);

%imwrite(final, 'imgFace/gatohelio.png');
x = final;
