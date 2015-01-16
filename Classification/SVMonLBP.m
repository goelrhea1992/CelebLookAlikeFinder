clear 
clc
files = dir('F:\college\Sem8\PR\Project\resize144144\*.jpg');
a = cell(3963,1);
tempSize = size(files);
for i=1:tempSize
    thisImg = files(i).name;
    imgRGB=imread(thisImg);
    img=rgb2gray(imgRGB);
    nFiltSize=8;
    nFiltRadius=1;
    filtR=generateRadialFilterLBP(nFiltSize, nFiltRadius);

    effRILBP= efficientLBP(img, 'filtR', filtR, 'isRotInv', true, 'isChanWiseRot', false);
    binsRange=(1:2^nFiltSize)-1;

    tic;
    effLBP= efficientLBP(imgRGB, 'filtR', filtR, 'isRotInv', true, 'isChanWiseRot', false);
    img2=rgb2gray(effLBP);

    a(i) = mat2cell(img2);
    effTime=toc;
%     figure;
%     subplot(1, 3, 1)
%     imshow(imgRGB);
%     title('Original image', 'fontSize', 18);
% 
%     subplot(1, 3, 2)
%     imshow( effLBP );
%     title('Efficeint LBP image', 'fontSize', 18);
end

b = [];
for i=1:3963
    temp = reshape(cell2mat(a(i)).',1,[]);
    b = [b; temp];
end

labels = load('allLabels.txt');
bestcv = 0;
bestc = 0;
bestg = 0;

b = im2double(b);

result = [];
for log2c = 10:15,
  for log2g = -3:3,
    cmd = ['-v 20 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
    cv = svmtrain(labels, b, cmd);
    if (cv >= bestcv)
      bestcv = cv;
      bestc = 2^log2c;
      bestg = 2^log2g;
    end
    fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
    result = [result,cv];
  end
end

