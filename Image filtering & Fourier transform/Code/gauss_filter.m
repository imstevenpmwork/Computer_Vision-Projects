function [img_out] = gauss_filter(img, title, fsize)
%GAUSS_FILTER Summary of this function goes here
%   Detailed explanation goes here

%Set appropriate sigma to fit most of relevant parts of gaussian function
%into filter
    sigma = fsize/6; 

	h = fspecial('gaussian', fsize, sigma);
	img_out = imfilter(img, h); 
 
    %Display filter
    dispAndSaveFig(h, strcat(title,'_gauss_filt',string(fsize)), false, true);
    
    %Display filtered Image
    dispAndSaveFig(img_out, strcat(title,'_gauss_img',string(fsize)));
end

