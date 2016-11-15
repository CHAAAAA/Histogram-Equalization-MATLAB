% Histogram Equalization
%   This is the entry

I0 = imread('oImage.jpg');
I = I0;

% If the image is a color image, change it to a gray image
[height,width, numberOfColorChannels]=size(I0);
if numberOfColorChannels > 1
  disp(numberOfColorChannels);
  I = rgb2gray(I0);
end

% show the original image
subplot(241)
imshow(I)
title('Original Image');

% NumPixel is the number of occurrences of each gray level
NumPixel = compute_histogram(I,'Histogram of Original Image',2);
% ProbPixel is the probability of an occurrence of each gray level
ProbPixel = compute_normalized_histogram(NumPixel,I,'Normalized Histogram of Original Image',3);
% Cumupixel is the cumulative distribution function
CumuPixel = compute_cumulative_histogram(ProbPixel,'Cumulative Histogram of Original Image',4);


% The Cumupixel convert to new gray levels
Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * CumuPixel(i)+0.5);
end
for i = 1:height
    for j = 1:width
        I(i,j)=Map(I(i,j) + 1);
    end
end

% show the new image
subplot(245)
imshow(I)
title('New Image');

% show the new image's histograms
NewNumPixel = compute_histogram(I,'Histogram of New Image',6);
NewProbPixel = compute_normalized_histogram(NewNumPixel,I,'Normalized Histogram of New Image',7);
NewCumuPixel = compute_cumulative_histogram(NewProbPixel,'Cumulative Histogram of New Image',8);

