files = dir('*.jpg');
feats = zeros(81,3963);
for i =1:3963
    I = imread(files(i).name);
    feats(:,i) = HOG(I);
end
feats = feats';

labels = load('labels.txt');
c = cvpartition(labels,'Holdout',1);
bestcv = 0;
result = [];

for log2c = 15,
  for log2g = -1,
    cmd = ['-v 20 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g)];
    cv = svmtrain(labels, feats, cmd);
    if (cv >= bestcv)
      bestcv = cv;
      bestc = 2^log2c;
      bestg = 2^log2g;
    end
    fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
    result = [result,cv];
  end
end

%result_sgld = reshape(result,21,21);