%% Backward warping from a data file
% Justin Lee (S4885003)
% Steven Palma Morera (S4882385)
% Lab #1 Computer Vision 2020-03-20

%img -> Input image (matrix)
%data_file-> matlab workspace with the variables XD and YD
function [warp_img] = warpingimg(img,data_file)
    
    % Load warping data file
    load(data_file);
    
    % Read image
    my_img = imread(img);
    
    % Turn it into a grayscale
    bw_img = rgb2gray(my_img);
    
    % Get size of image and create meshgrid
    [row,col] = size(bw_img);
    [X,Y]=meshgrid(1:col,1:row);
    
    % Add warping effect
    Xc = X + XD;
    Yc = Y + YD;
    
    % Compute the warped impage
    warp_img = griddata(X,Y,double(bw_img),Xc,Yc,'linear');
    
    % Display and save the warped image
    
    figure,imshow(warp_img,[0 255]);
    title(['warped ',img]);
    %imwrite(rescale(warp_img),'warp_img.jpg');
end