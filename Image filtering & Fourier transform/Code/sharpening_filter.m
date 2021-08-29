function [img_out] = sharpening_filter(img, title ,fsize)
    %IDENTITY_FILTER Summary of this function goes here
    %   Detailed explanation goes here
    K1 = zeros(fsize);
    mid = ceil(fsize/2);
    K1(mid,mid) = 2;
    
    K2 = ones(fsize)/(fsize*fsize);
    K = K1 - K2;
    img_out=conv2(img,K,'same');

    %Display Filter
    dispAndSaveFig(K, strcat(title,'_filter_',string(fsize)), false, true);

    %Display filtered image
    dispAndSaveFig(img_out, strcat(title,'_',string(fsize)), false, false);
end
