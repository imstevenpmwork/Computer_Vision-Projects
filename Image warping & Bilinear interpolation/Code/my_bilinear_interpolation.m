%% Bilinear Interpolation Algorithm
% Justin Lee (S4885003)
% Steven Palma Morera (S4882385)
% Lab #1 Computer Vision 2020-03-20

% The intensity of the point (X,Y) is wanted
%X -> X component of the image 
%Y -> Y component of the image
%img -> Input image (matrix)
function [intensity_xy]= my_bilinear_interpolation (x,y,img)
    
    % Get the closest pixel rounded down to the input/desired point
    i=floor(x);
    j=floor(y);
    
    % Get the resolution of the image
    [f,c]=size(img);
    
    % If the closest pixel is (0,0) since that pixel doesnt exist, assign
    % an intensity equals to 0
    if ((i<=0)||(j<=0))
        intensity_xy=0;
    % If we are in the border of the original image, (f+1) nor (c+1) exists
    % so assign an intensity equals to 0
    elseif ((i>=c)||(j>=f))
        intensity_xy=0;
        
    % If in the middle of the image
    else
        a=x-i;
        b=y-j;
        
        % Follow the bilinear interpolation algorithm for the point,
        % considereing the pixels around it
        intensity_xy= (1-a)*(1-b)*img(j,i) + a*(1-b)*img(j,i+1) + a*b*img(j+1,i+1) + (1-a)*b*img(j+1,i);
    end
end