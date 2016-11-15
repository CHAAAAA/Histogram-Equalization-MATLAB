function f = compute_cumulative_histogram(ProbPixel,title0,position)
%compute_cumulative_histogram
%   ProbPixel: probability density of each gray level
%   title0: histogram's title
%   position: histogram's position

% Compute the cumulative distribution function
CumuPixel = zeros(1,256);
for i = 1:256
    if i == 1
        CumuPixel(i) = ProbPixel(i);
    else
        CumuPixel(i) = CumuPixel(i-1) + ProbPixel(i);
    end
end

subplot(2,4,position);
bar(CumuPixel)
title(title0);

f = CumuPixel;
end