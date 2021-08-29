function [img_titles_cropped] = crop_titles(titles)
%CROP_TITLES Deletes the suffix .png from filetitles

img_titles_cropped = [];

for i= 1:length(titles)
    %% Get the title of the image without .png
    str_temp = titles{i};
    str_temp = string(str_temp(1:end-4));
    img_titles_cropped = [img_titles_cropped, str_temp];
end
end

