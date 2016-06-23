function x = transformacao(imagemRosto, imagemFiltro, mascara, fixedPoints, movingPoints)

% leitura das imagens
ImgOrigH = imagemRosto; %imread('gatohelio.png');
MapBWCat = mascara ;    %imread('gatoferor.png');
ImgOrigG = imagemFiltro;%imread('gatofer.jpg');

[l,c] = size(MapBWCat);

% m�scara
Masc = ImgOrigG;
x = MapBWCat;

H = fspecial('average',15);
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



%Igray = rgb2gray(ajuste);
%E = im2uint8(edge(Igray,'canny'));
%E = repmat(E,[1 1 3]);
%Ed = imdilate(E,strel('disk',2));
%Ed = logical(Ed);
%Ifilt = imfilter(ajuste,fspecial('gaussian'));
%ajuste(Ed) = Ifilt(Ed);


%imshow(ajuste);
final = zeros(size(ImgOrigH));

[l,c] = size(ImgOrigH);

for i = 1:l
    for j = 1:c
        if(ajuste(i,j) == 0)
          %  final(i,j) = ImgOrigH(i,j);
        else
           % final(i,j) = ajuste(i,j);
        end
    end
end
K = vision.AlphaBlender;
final = step(K,ImgOrigH, ajuste );

final = uint8(final);

%imwrite(final, 'gatohelio2.png');

%imshow(final);
x = final;