function [img_noisy] = add_noise_saltpepper(img,title, density)
%ADD_NOISE_SALTPEPPER Summary of this function goes here
%   Detailed explanation goes here


img=double(img);
[rr,cc]=size(img);

indices=full(sprand(rr,cc,density));

%Create two masks
mask1=indices>0 & indices<0.5;
mask2=indices>=0.5;

img_noisy = img;

%Set pixels of mask 1 to 0 (black) and pixels of mask 1 to 255 (white)
img_noisy(mask1) = 0;
img_noisy(mask2) = 255;

dispAndSaveFig(img_noisy, title);

end

