clear 
clc

files = dir('F:\college\Sem8\PR\Project\finalPics\*.jpg');

tempSize = size(files);

% allLengths = [];
% allBreadths = [];
% count = 0;

for i=1:tempSize
    thisImg = files(i).name;
    [myImg, map] = imread(thisImg);
%     tempImgSize = size(myImg);
%     thisLength = tempImgSize(1);
%     if thisLength<300
%         count = count + 1;
%     end
%     
%     thisBreadth = tempImgSize(2);
%     allLengths = [allLengths thisLength];
%     allBreadths = [allBreadths thisBreadth];
    imshow(myImg)
    thisImage = imresize(myImg, [144 144]);
    imshow(thisImage)
    imwrite(thisImage, ['F:/college/Sem8/PR/Project/resize144144/',thisImg]);
end


% count
% 
% disp('Lengths: ');
% disp(['Minimum: ' num2str(min(allLengths))])
% disp(['Maximum: ' num2str(max(allLengths))])
% disp(['Mean: ' num2str(mean(allLengths))])
% disp(['Std: ' num2str(std(allLengths))])
% 
% 
% disp('Breadths: ');
% disp(['Minimum: ' num2str(min(allBreadths))])
% disp(['Maximum: ' num2str(max(allBreadths))])
% disp(['Mean: ' num2str(mean(allBreadths))])
% disp(['Std: ' num2str(std(allBreadths))])