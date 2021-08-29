function [image_edges] = edge_detection_LoG_own(img, threshold)

[size_y,size_x] = size(img);
image_edges = zeros(size_y, size_x);

%Perform same operations linewise and the columwise by transposing at the
%end of main-loop
for loop_twice = 1:2
[size_y,size_x] = size(img);
%% Iterate line by line
for i=1:size_y
    for j=1:size_x-1
        %% look at 2 Pixels
        if abs(img(i,j)-img(i,j+1))>threshold && ...  %Threshold exceeded?
           ((img(i,j)>0 && img(i,j+1)<0) ||...   % Crossing + to -
           (img(i,j)<0 && img(i,j+1)>0))         % Crossing - to +
            if abs(image_edges(i,j))<abs(image_edges(i,j))  % Find pixel closer to 0-crossing
                image_edges(i,j) = 1;                        % and set it to 0
            else
                image_edges(i,j+1) = 1;
            end
        end
        %% look at 3 Pixels        
        if j<size_x-2 && ...    % avoid incorrect indexing
           abs(img(i,j)-img(i,j+2))>threshold && ...  %Threshold exceeded?
           ((img(i,j)>0 && img(i,j+1)==0 && img(i,j+2)<0) ||...   % Crossing + 0 -
           (img(i,j)<0 && img(i,j+1)==0 && img(i,j+2)>0))          % Crossing - 0 +
           image_edges(i,j+1) = 1;   % Set central pixel to 
        end
    end
end
%%Transpose image and image_edges to perform exact same operations
%%columnwise, then transpose back to get original image
img=img';
image_edges=image_edges';
end

end

