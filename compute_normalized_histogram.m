function f = compute_normalized_histogram(NumPixel,I,title0,position)
%compute_normalized_histogram
%   NumPixel: number of each gray level
%   I: the image
%   title0: histogram's title
%   position: histogram's position

[height,width]=size(I);

% Compute the probability of an occurrence of each gray level
ProbPixel = zeros(1,256);
for i = 1:256
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);
end

subplot(2,4,position)
bar(ProbPixel)
title(title0);

f = ProbPixel;
end
