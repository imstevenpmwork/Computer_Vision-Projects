function [] = task2_filter(img,title)
%TASK2_FILTER Summary of this function goes here
%   Detailed explanation goes here

filtersizes = [3,7];
%smoothing by averaging
for filtersize=filtersizes
    moving_average(img,title,filtersize);
    median_filter(img,title,filtersize);
    gauss_filter(img,title,filtersize);
end

end

