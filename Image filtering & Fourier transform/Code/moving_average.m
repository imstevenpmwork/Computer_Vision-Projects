function [img_out] = moving_average(img, title ,fsize)
%MOVING_AVERAGE Summary of this function goes here
%   Detailed explanation goes here
K=ones(fsize)/(fsize*fsize);
img_out=conv2(img,K,'same');

%Display Filter
dispAndSaveFig(K, strcat(title,'_av_filt',string(fsize)), false, true);

%Display filtered image
dispAndSaveFig(img_out, strcat(title,'_av_img',string(fsize)));
end

