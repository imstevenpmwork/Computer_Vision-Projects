function [] = saveimg(fig,my_title)

    plotpath = 'plots/';
    %Create directory "plots" if they don't already exist
    if ~exist(plotpath, 'dir')
        mkdir(plotpath)
    end
    
    imwrite(fig,char(strcat(plotpath,my_title,'.jpg')),'jpg');

end