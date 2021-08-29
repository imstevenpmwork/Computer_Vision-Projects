%% Backward warping for rotation
% Justin Lee (S4885003)
% Steven Palma Morera (S4882385)
% Lab #1 Computer Vision 2020-03-20

%angle -> The image will be rotated around its center 'Angle' degrees (rad)
%img -> Image to be translated ('image.jpg')
function [my_rotbwimg]=rotateimg(angle,img)

    % Read the input image
    my_img=imread(img);
    
    % Turn it into a grayscale
    my_bwimg=rgb2gray(my_img);
    
    % Get the resolution of the image
    [f,c]=size(my_bwimg);
    
    % Get the center of the image
    fC= floor(f/2);
    cC= floor(c/2);
    
    % Create the matrix for the output image
    my_rotbwimg=zeros(f,c);
    
    % For every pixel in the output image
    for j=1:1:f
        for i=1:1:c
            
            % Change of coordinates so that way the image is rotated along
            % its center
            v_out=[i-cC j-fC 0];
            
            % Get the pixel from the input image that results in the
            % current output pixel after the rotation
            v_in= [cos(-angle) -sin(-angle) 0; sin(-angle) cos(-angle) 0; 0 0 1]*v_out';
            
            % Restore original coordinates
            v_in(1)=v_in(1)+cC;
            v_in(2)=v_in(2)+fC;
            
            % If desired input image pixels are out of bounds
            if ((v_in(1)>c)||(v_in(2)>f))
                my_rotbwimg(j,i)=0;
            elseif ((v_in(1)<0)||(v_in(2)<0))
                my_rotbwimg(j,i)=0;
            else
                % Call the interpolation algorithm and assign the result
                % into the current pixel of the output image
                my_rotbwimg(j,i)= my_bilinear_interpolation (v_in(1),v_in(2),my_bwimg);
            end
        end
    end
    
    % Show the output image
    figure, imshow(my_rotbwimg,[0 255]);
    title(['rotated ',img]);
    %imwrite(rescale(my_rotbwimg),'rot_img.jpg');

end