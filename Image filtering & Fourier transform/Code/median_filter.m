function [img_out] = median_filter(img, title, fsize)
%MEDIAN_FILTER of this function goes here
%   Detailed explanation goes here

img_out=medfilt2(img,[fsize,fsize]);

%Display Filter does not really make sense, because nonlinear!

%Display Filtered image
dispAndSaveFig(img_out, strcat(title,'_med_',string(fsize)));
end

