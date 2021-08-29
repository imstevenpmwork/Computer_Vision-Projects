function [img_out] = blurring_filter(img, title ,fsize)
    %BLURRING_FILTER Summary of this function goes here
    %   Detailed explanation goes here
    K=ones(fsize)/(fsize*fsize);
    img_out=conv2(img,K,'same');

    %Display Filter
    dispAndSaveFig(K, strcat(title,'_filter_',string(fsize)), false, true);

    %Display filtered image
    dispAndSaveFig(img_out, strcat(title,'_',string(fsize)), false, false);
end