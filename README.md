# CelebLookAlikeFinder
The aim for our project is to find the closest celebrity whose face is most similar to the face in a query image. Based on extracted facial features, we classify each sample input as one of the celebrity classes using several classifiers. It is always fascinating to know which famous personality you resemble closely. Moreover, such a system could also be used to find suitable stunt-doubles for celebrities.

# Steps involved in the project:
1. Preprocessing: The PubFig database is a text file (database.txt) containing URLs of celebrity images. It contains 16,000 URLs for 200 celebrities in total. 
  
  i. SaveImagesFromURL.java - Reads database.txt to download all images from the URLs given in the file.
  
  ii. Parse.java - Generates allCoordinates.txt and allNames.txt containing the coordinates of faces in images, corresponding to each image/filename in allNames.txt
  
  iii. Labels.java - Prints all labels of in order of files in the directory of all the face images, and assigns an integer label to images belonging to the same celebrity. 
  
  iv. cropping.m - Crops all images in allNames.txt using coordinates given in corresponding row of allCoordinates.txt
  
  v. resizeImages.m - Resizes all images to 144x144 to obtain features later.
2. Feature Extraction: 
  
  i. Histogram of Gradients
    - HOG.m - MATLAB function that returns HOG features of an input image
  
  ii. Local Binary Patterns:
    - efficientLBP package - MATLAB package contains implementation of LBP inpired by materials published by Matti Pietik?inen in http://www.cse.oulu.fi/CMV/Research/LBP. Available on MATLAB File Exchange: http://www.mathworks.com/matlabcentral/fileexchange/36484-local-binary-patterns/content/efficientLBP/efficientLBP.m
3. Classification:
  
  i. SVM:
    - SVMonHOG.m - Calls MATLAB function HOG.m on all images and performs grid search on extracted features
    - SVMonLBP.m - Uses efficientLBP package, and performs grid search on extracted features.
  
  ii. Neural Network: inbuilt NNET tool of MATLAB was used, and parameters modified using the UI. (hence, no codebase for this part of the project)

