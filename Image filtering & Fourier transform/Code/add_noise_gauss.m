function [img_noisy] = add_noise_gauss(img,title, standard_deviation)
%ADD_NOISE_GAUSS Summary of this function goes here
%   Detailed explanation goes here

img_noisy=double(img)+standard_deviation*randn(size(img));
dispAndSaveFig(img_noisy, title);

end

