function [] = dispAndSaveFig(img,my_title, show_histogram, show_surf)
%SHOWWARPANDSAVEFIG Displays the modified image and saves it to the /plots-Directory
%in pdf-file

%% Inputs:
%   img        image
%   my_title   Title of the plot and output file

if nargin == 2
show_histogram = true;
show_surf = false;
end

plotpath = 'plots/';
%Create directory "plots" if they don't already exist
if ~exist('plots/', 'dir')
   mkdir(plotpath)
end

%% display and save image
fig = figure('visible','off');
imagesc(img);
colormap gray;
title(my_title, 'Interpreter', 'none');
set(gcf,'Units','centimeters');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print(fig,strcat(plotpath,my_title,'.pdf'),'-dpdf');

%% display and save histogram of image
if show_histogram
    fig = figure('visible','off');
    title_histo = strcat(my_title,'_histo');
    imhist(uint8(img),256)
    title(title_histo, 'Interpreter', 'none');
    set(gcf,'Units','centimeters');
    screenposition = get(gcf,'Position');
    set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
    print(fig,strcat(plotpath,title_histo,'.pdf'),'-dpdf');
end

if show_surf
    fig = figure('visible','off');
    title_surf = strcat(my_title,'_surf');
    surf(img);
    title(title_surf, 'Interpreter', 'none');
    set(gcf,'Units','centimeters');
    screenposition = get(gcf,'Position');
    set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
    print(fig,strcat(plotpath,title_surf,'.pdf'),'-dpdf');
end

