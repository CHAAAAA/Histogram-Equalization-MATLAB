function f = compute_histogram(I,title0,position)
%compute_histogram 
%   I: the image
%   title0: histogram's title
%   position: histogram's position

[height,width]=size(I);

% Compute the number of occurrences of each gray level
NumPixel = zeros(1,256);
for i = 1:height
    for j = 1:width
        NumPixel( I(i,j) + 1 ) = NumPixel( I(i,j) + 1 ) + 1;
    end
end

subplot(2,4,position)
bar(NumPixel)
title(title0);

f = NumPixel;
end