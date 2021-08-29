%% Backward warping for translation
% Justin Lee (S4885003)
% Steven Palma Morera (S4882385)
% Lab #1 Computer Vision 2020-03-20

%x_trans -> Translation on the X axis in pixels
%Y_trans -> Translation on the Y axis in pixels
%img -> Image to be translated ('image.jpg')
function [my_transbwimg]=translateimg(x_trans,y_trans,img)

    % Read the input image
    my_img=imread(img);
    
    % Turn it into a grayscale
    my_bwimg=rgb2gray(my_img);
    
    % Get the resolution of the image
    [f,c]=size(my_bwimg);
    
    % Create the matrix for the output image
    my_transbwimg=zeros(f,c);
    
    % Algorithm to determine the movement of the image
    % depending on the signs of the desired translations
    % For the X axis translation
    if (x_trans>=0)
        start_c=1;
        rate_c=1;
        end_c=c;
    else
        start_c=c;
        rate_c=-1;
        end_c=1;
    end
    
    % For the Y axis translation
    if (y_trans>=0)
        start_f=1;
        rate_f=1;
        end_f=f;
    else
        start_f=f;
        rate_f=-1;
        end_f=1;
    end
    
    % For every pixel in the output image
    for j=start_f:rate_f:end_f
        for i=start_c:rate_c:end_c
            
            % Get the exact position from the input image the results in the
            % current pixel in the output image
            x=i-x_trans;
            y=j-y_trans;
            
            % If position out of the original image, that means that that
            % pixel in the output image is empty
            if ((x<0)||(y<0))
                my_transbwimg(j,i)=0;
                
            % If position inside of the original image, then since it isnt
            % an exact pixel an interpolation should be applied to get the
            % intensity value of that location
            else
                % Call the interpolation algorithm and assign the result
                % into the current pixel of the output image
                my_transbwimg(j,i)= my_bilinear_interpolation (x,y,my_bwimg);
            end
        end
    end
    
    % Show the output image and save it
    figure, imshow(my_transbwimg,[0 255]);
    title(['translated ',img]);
    %imwrite(rescale(my_transbwimg),'trans_img.jpg');

end