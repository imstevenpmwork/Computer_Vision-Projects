%% Test script for Lab 1
% Justin Lee S4885003
% Steven Palma Morera (S4882385)
% Lab #1 Computer Vision 2020-03-20

% Read image
my_boc = imread('boccadasse.jpg');
    
% Turn it into a grayscale
bw_boc = rgb2gray(my_boc);

%Display Test image
figure,imshow(bw_boc);
title('test boccadasse');

% Read image
my_flwr = imread('flower.jpg');
    
% Turn it into a grayscale
bw_flwr = rgb2gray(my_flwr);

%Display Test image
figure,imshow(bw_flwr);
title('test flower');

% Translate boccadasse image -87.1 on x axis and 23.5 on y axis
translateimg(-87.1,23.5,'boccadasse.jpg');

% Translate flower image 85.1 on x axis and -50.7 on y axis
translateimg(85.1,-50.7,'flower.jpg');

% Rotate boccadasse image -1.812 rads
rotateimg(-1.812,'boccadasse.jpg');

% Rotate flower image 0.785398 rads
rotateimg(0.785398,'flower.jpg');

% Warp boccadasse image from data.mat
warpingimg('boccadasse.jpg','data.mat');

% Warp flower image from data_flower.mat
warpingimg('flower.jpg','data_flower.mat');