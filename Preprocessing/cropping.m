clear
clc
fileID = fopen('F:/college/Sem8/PR/Project/allData/allCoordinates.txt');
fileID2 = fopen('F:/college/Sem8/PR/Project/allData/allNames.txt');

while(1)
    tline = fgetl(fileID);
    C = textscan(tline, '%u %u %u %u');
    thisVector = cell2mat(C);
    minX = thisVector(1);
    minY = thisVector(2);
    width = thisVector(3) - thisVector(1);
    height = thisVector(4) - thisVector(2);

    tline2 = fgetl(fileID2);
    img = imread(tline2);
    imshow(img)
    thisImage = imcrop(img, [minX minY width height]);
    imshow(thisImage);
    imwrite(thisImage, ['F:/college/Sem8/PR/Project/data/',tline2]);
    if(feof(fileID2))
        break;
    end

end

