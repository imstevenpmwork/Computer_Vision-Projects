function [] = disp_and_save_fig(img,my_title, show_histogram, show_surf, histogram_bins)
%SHOWWARPANDSAVEFIG Displays the modified image and saves it to the /plots-Directory
%in pdf-file

%% Inputs:
%   img        image
%   my_title   Title of the plot and output file

if nargin == 2
show_histogram = true;
show_surf = false;
end

if nargin < 5
    histogram_bins = nan;
end


%% display and save image
fig = figure('visible','on');
imagesc(img);
colormap gray;
title(my_title, 'Interpreter', 'none');
export_figure(fig,my_title);

%% display and save greyscale histogram of image
if show_histogram
    fig = figure('visible','on');
    title_histo = strcat(my_title,'_histo');
    if isnan(histogram_bins)
        imhist(uint8(img),256);
    else
        hist(img(:),histogram_bins);
    end
    title(title_histo, 'Interpreter', 'none');
    export_figure(fig,my_title);
end

if show_surf
    fig = figure('visible','on');
    title_surf = strcat(my_title,'_surf');
    surf(img);
    title(title_surf, 'Interpreter', 'none');
    export_figure(fig,my_title);
end


