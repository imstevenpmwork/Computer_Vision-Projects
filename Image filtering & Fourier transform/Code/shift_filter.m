function [img_out] = shift_filter(img, title ,fsize)
    %IDENTITY_FILTER Summary of this function goes here
    %   Detailed explanation goes here
    K=zeros(fsize);
    K(4,7) = 1;
    img_out=conv2(img,K,'same');

    %Display Filter
    dispAndSaveFig(K, strcat(title,'_filter_',string(fsize)), false, true);

    %Display filtered image
    dispAndSaveFig(img_out, strcat(title,'_',string(fsize)), false, false);
end